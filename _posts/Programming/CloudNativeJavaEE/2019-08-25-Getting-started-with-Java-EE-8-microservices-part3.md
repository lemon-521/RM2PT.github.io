---
layout: post
title: MicroProfile - Handling State and Persistence
date: 2019-08-25 02:40:00.000000000 +08:00
type: post
categories: [Programming, CloudNativeJavaEE]
author: yyl
---


## Using JPA with Cloud-native databases

In this video we are going to use a Cockroach DB as NewSQL database to store
relational as well as JSON data.

### Step 1: Database Infrastructure Setup

Add the following definition to your `docker-compose.yml` file.

```yaml
  cockroach1:
    image: cockroachdb/cockroach:v2.0.5
    hostname: cockroach1
    command: start --insecure
    ports:
    - "26257:26257"
    - "8080:8080"
    volumes:
    - data-volume1:/cockroach/cockroach-data
    networks:
      jee8net:
        aliases:
        - cockroach-db
        - postgres-db

  cockroach2:
    image: cockroachdb/cockroach:v2.0.5
    hostname: cockroach2
    command: start --insecure --join=cockroach1
    volumes:
    - data-volume2:/cockroach/cockroach-data
    depends_on:
    - cockroach1
    links:
    - cockroach1
    networks:
    - jee8net

  cockroach3:
    image: cockroachdb/cockroach:v2.0.5
    hostname: cockroach3
    command: start --insecure --join=cockroach1
    volumes:
    - data-volume3:/cockroach/cockroach-data
    depends_on:
    - cockroach1
    links:
    - cockroach1
    networks:
    - jee8net
```

### Step 2: App Server Container Configuration

Next we will add the Postgres JDBC driver to our Gradle build.
```groovy
configurations {
    postgresql {
        description = "PostgreSQL dependencies"
        transitive = true
    }

    providedCompile.extendsFrom postgresql
}

dependencies {
    providedCompile 'javax:javaee-api:8.0'

    postgresql 'org.postgresql:postgresql:42.2.5'
}

task copyPostgresqlLibs(type: Copy) {
    from configurations.postgresql
    into "$buildDir/postgresql"
}

assemble.dependsOn copyPostgresqlLibs
```

We need to configure our Payara app server to create a JDBC resource. Edit the
file `post-deploy.asadmin` with the following content.
```
create-jdbc-connection-pool --datasourceclassname org.postgresql.ds.PGConnectionPoolDataSource --restype javax.sql.ConnectionPoolDataSource --property portNumber=26257:password='root':user='root':serverName=cockroach-db:databaseName='cloud_native_db' PostgresPool
create-jdbc-resource --connectionpoolid PostgresPool jdbc/CloudNativeDb

set resources.jdbc-connection-pool.PostgresPool.connection-validation-method=custom-validation
set resources.jdbc-connection-pool.PostgresPool.validation-classname=org.glassfish.api.jdbc.validation.PostgresConnectionValidation
set resources.jdbc-connection-pool.PostgresPool.is-connection-validation-required=true
set resources.jdbc-connection-pool.PostgresPool.fail-all-connections=true

deploy --type war /opt/payara/deployments/cloud-native-jpa.war
```

Now edit the `Dockerfile` to add all artifacts to the image and change the CMD.
```
FROM qaware/zulu-centos-payara-micro:8u181-5.183

COPY post-deploy.asadmin /opt/payara/post-deploy.asadmin
COPY build/postgresql/* /opt/payara/libs/
COPY build/libs/cloud-native-jpa.war /opt/payara/deployments/

CMD ["--noCluster", "--addjars", "/opt/payara/libs/", "--postdeploycommandfile", "/opt/payara/post-deploy.asadmin"]
```

### Step 3: Add JPA persistence for CloudNativeEvents

In this step we want to store simple events with flexible JSON payloads. Create the following JPA entity.  

```java
@Entity
@Table(name = "cloud_native_event")
@NoArgsConstructor
@Data
public class CloudNativeEvent {
    @Id
    @SequenceGenerator(name = "cloud_native_event_seq_gen", sequenceName = "cloud_native_event_seq", allocationSize = 5)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cloud_native_event_seq_gen")
    @Column(name = "id")
    private Long id;

    @Column(name = "payload", columnDefinition = "jsonb")
    @Convert(converter = JsonObjectConverter.class)
    private JsonObject payload;

    @Column(name = "stored_at")
    private OffsetDateTime storedAt;

    protected CloudNativeEvent(JsonObject payload) {
        this.payload = payload;
    }

    @PrePersist
    protected void onCreate() {
        storedAt = OffsetDateTime.now();
    }

    public JsonObject toJson() {
        return Json.createObjectBuilder()
                .add("id", id)
                .add("stored_at", storedAt.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME))
                .add("payload", payload)
                .build();
    }
}
```

Now create a simple data access object to store and retrieve the `CloudNativeEvent` entities.
```java
@Stateless
@Transactional(Transactional.TxType.REQUIRED)
public class CloudNativeEventStorage {

    @PersistenceContext
    private EntityManager entityManager;

    public CloudNativeEvent get(Long id) {
        return Optional.ofNullable(entityManager.find(CloudNativeEvent.class, id)).orElseThrow(NotFoundException::new);
    }

    public Collection<CloudNativeEvent> all() {
        return entityManager.createQuery("SELECT e FROM CloudNativeEvent e", CloudNativeEvent.class).getResultList();
    }

    public CloudNativeEvent persist(JsonObject payload) {
        return entityManager.merge(new CloudNativeEvent(payload));
    }

}
```

We also need to configure the persistence unit, so add the following content to the `persistence.xml` file.
```xml
<persistence version="2.2"
             xmlns="http://xmlns.jcp.org/xml/ns/persistence"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">

    <persistence-unit name="cloudNativeDb" transaction-type="JTA">
        <jta-data-source>jdbc/CloudNativeDb</jta-data-source>

        <class>cloud.nativ.javaee.CloudNativeEvent</class>
        <exclude-unlisted-classes>false</exclude-unlisted-classes>

        <!-- Disable share cache -->
        <shared-cache-mode>NONE</shared-cache-mode>

        <!--
            Alternatively use Payara Cache coordination
            https://payara.gitbooks.io/payara-server/documentation/payara-server/jpa-cache-coordination.html
        -->

        <properties>
            <property name="javax.persistence.schema-generation.database.action" value="drop-and-create"/>
            <property name="javax.persistence.schema-generation.create-source" value="script-then-metadata"/>
            <property name="javax.persistence.schema-generation.create-script-source" value="META-INF/create.sql"/>

            <property name="javax.persistence.sql-load-script-source" value="META-INF/cloud-native-db.sql"/>

            <property name="eclipselink.logging.level" value="FINE"/>
            <property name="eclipselink.logging.parameters" value="true"/>
        </properties>
    </persistence-unit>

</persistence>
```


##  Using NoSQL databases with Java EE

### Step 1: Infrastructure Setup for MongoDB

Add the following definition to your `docker-compose.yml` file.

```yaml
  mongodb:
    image: mongo:3.6
    ports:
    - "27017:27017"
    networks:
    - jee8net
```

### Step 2: CDI Integration of MongoDB Java client

Add the following dependencies for the MongoDB Java Client and the
Morphia object mapper (optional) to the `build.gradle` file.

```groovy
    compile 'org.mongodb:mongo-java-driver:3.6.4'
    compile 'org.mongodb.morphia:morphia:1.3.2'
```

Add the following CDI producer bean to create the MongoDB client and database beans.

```java
@ApplicationScoped
public class MongoProducer {

    private MongoClient mongoClient;
    private CodecRegistry pojoCodecRegistry;

    @PostConstruct
    void initialize() {
        // use MicroProfile Config to externalize these
        mongoClient = new MongoClient("mongodb", 27017);
        pojoCodecRegistry = fromRegistries(MongoClient.getDefaultCodecRegistry(),
                fromProviders(PojoCodecProvider.builder().automatic(true).build()));
    }

    @Produces
    @ApplicationScoped
    public MongoClient client() {
        return mongoClient;
    }

    @Produces
    @ApplicationScoped
    public MongoDatabase database() {
        return mongoClient.getDatabase("javaee").withCodecRegistry(pojoCodecRegistry);
    }
}
```

### Step 3: Using MongoDB with JSON-P

Since MongoDB stores documents as JSON, the natural fit is to combine it with JSON-P and JAX-RS.
Add the following resource class to query and store documents in Mongo collections.

```java
@ApplicationScoped
@Path("mongo")
@Produces(MediaType.APPLICATION_JSON)
public class MongoResource {

    @Inject
    private MongoDatabase database;

    @GET
    @Path("{collection}")
    public Response all(@PathParam("collection") String collectionName) {
        MongoCollection<Document> collection = database.getCollection(collectionName);
        MongoCursor<Document> cursor = collection.find().iterator();
        JsonArrayBuilder response = Json.createArrayBuilder();

        try {
            while (cursor.hasNext()) {
                Document document = cursor.next();
                response.add(Json.createObjectBuilder(document));
            }
        } finally {
            cursor.close();
        }

        return Response.ok(response.build()).build();
    }

    @POST
    @Path("{collection}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response insertOne(@PathParam("collection") String collectionName, @NotNull String jsonPayload) {
        MongoCollection<Document> collection = database.getCollection(collectionName);

        Document document = Document.parse(jsonPayload).append("_id", UUID.randomUUID().toString());
        collection.insertOne(document);

        URI location = UriBuilder
                .fromResource(MongoResource.class)
                .path("{collection}/{id}")
                .resolveTemplate("collection", collectionName)
                .resolveTemplate("id", document.getString("_id"))
                .build();

        return Response.created(location).build();
    }

    @GET
    @Path("{collection}/{id}")
    public Response get(@PathParam("collection") String collectionName, @PathParam("id") String id) {
        MongoCollection<Document> collection = database.getCollection(collectionName);

        MongoIterable<Document> documents = collection.find(new Document("_id", id));
        Document found = Optional.ofNullable(documents.first()).orElseThrow(NotFoundException::new);

        return Response.ok(found.toJson()).build();
    }
}
```

### Step 4a: Using MongoDB with Morphia and JSON-B

If you like it more typed using POJOs, you can use the Morphia library (https://github.com/MorphiaOrg/morphia) which gives
you a more JPA like feeling. In combination with JSON-B we can take care of the marshalling in JAX-RS.

We create the following POJO class and annotate it using the Morphia annotations (NOT the JPA equivalient!) and also
JSON-B annotations for correct marshalling.

```java
@Data
@Entity("pojos")
@JsonbPropertyOrder({"description", "name"})
@JsonbNillable
public class MorphiaPojo {

    @Id
    @JsonbTransient
    private ObjectId id;

    @Property
    @JsonbProperty("the-name")
    private String name;

    @Property
    @JsonbProperty
    private String description;
}
```

We create a simple CDI repository bean to handle all the persistence logic.

```java
@ApplicationScoped
public class MorphiaRepository {

    @Inject
    private MongoClient client;

    private Morphia morphia;
    private Datastore datastore;

    @PostConstruct
    void initialize() {
        this.morphia = new Morphia();
        this.datastore = morphia.createDatastore(client, "morphia");
        this.datastore.ensureIndexes();
    }

    public Collection<MorphiaPojo> findAll() {
        final Query<MorphiaPojo> query = datastore.createQuery(MorphiaPojo.class);
        return query.asList();
    }

    public String save(MorphiaPojo payload) {
        Key<MorphiaPojo> saved = datastore.save(payload);
        return ((ObjectId) saved.getId()).toHexString();
    }

    public MorphiaPojo findById(String id) {
        Query<MorphiaPojo> query = datastore.createQuery(MorphiaPojo.class).field("id").equal(new ObjectId(id));
        return Optional.ofNullable(query.get()).orElseThrow(NotFoundException::new);
    }

    public void delete(String id) {
        datastore.delete(MorphiaPojo.class, new ObjectId(id));
    }
}
```

And we create a JAX-RS resource class to provide a REST API for the Morphia repository.

```java
@ApplicationScoped
@Path("morphia")
@Produces(MediaType.APPLICATION_JSON)
public class MorphiaResource {

    @Inject
    private MorphiaRepository repository;

    @GET
    public Response all() {
        Collection<MorphiaPojo> results = repository.findAll();
        return Response.ok(results).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response save(@NotNull MorphiaPojo payload) {
        String id = repository.save(payload);

        URI location = UriBuilder
                .fromResource(MorphiaResource.class)
                .path("{id}")
                .resolveTemplate("id", id)
                .build();

        return Response.created(location).build();
    }

    @GET
    @Path("{id}")
    public Response get(@PathParam("id") String id) {
        MorphiaPojo pojo = repository.findById(id);
        return Response.ok(pojo).build();
    }

    @DELETE
    @Path("{id}")
    public Response delete(@PathParam("id") String id) {
        repository.delete(id);
        return Response.noContent().build();
    }
}
```

### Step 4b: Using MongoDB with JNoSQL and JSON-B

Alternatively, you can use the JNoSql library to mimic the JPA APIs to access any
NoSQL database.
