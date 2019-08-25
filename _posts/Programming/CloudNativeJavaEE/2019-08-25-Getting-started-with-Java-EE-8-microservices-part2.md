---
layout: post
title: MicroProfile - Versioning, Fault Tolerance, OpenAPI, and Configuration
date: 2019-08-25 02:40:00.000000000 +08:00
type: post
categories: [Programming, CloudNativeJavaEE]
author: yyl
---


## Building and versioning REST APIs with JAX-RS

### Step 1: URL based versioning using sub resources

Add the following resource class as the root of your URL based versioning scheme.
```java
@RequestScoped
@Path("version")
public class VersionResource {

    @Context
    private ResourceContext context;

    @Path("v1")
    public VersionResourceV1 v1() {
        // alternatively we could return VersionResourceV1.class
        // careful, because injection does not work here
        return new VersionResourceV1();
    }

    @Path("v2")
    public VersionResourceV2 v2() {
        // perform lookup via ResourceContext for @Inject support
        return context.getResource(VersionResourceV2.class);
    }
}
```

For each supported version you return the so called nested resources using a sub resource locator.
```java
@RequestScoped
@Produces(MediaType.APPLICATION_JSON)
public class VersionResourceV1 {
    @GET
    public Response getV1() {
        JsonObject response = Json.createObjectBuilder().add("version", "v1").build();
        return Response.ok(response).build();
    }
}

@RequestScoped
@Produces(MediaType.APPLICATION_JSON)
public class VersionResourceV2 {

    @Context
    private HttpHeaders httpHeaders;

    @GET
    public Response getV2() {
        JsonObject response = Json.createObjectBuilder().add("version", "v2").build();
        return Response.ok(response).build();
    }
}
```

### Step 2: Media-Type versioning

Media type versioning allows for a lot more flexibility. Add the following class to demonstrate its usage.
The V1 resource method acts as the default, it used content negotiation and accepts all requests.

```java
@RequestScoped
@Path("media-type")
public class MediaTypeVersionResource {

    /**
     * MediaType implementation for the version resource in v1.
     */
    public static final MediaType V1_MEDIA_TYPE = new MediaType("application", "vnd.version.v1+json");

    @GET
    @Produces({"application/json; qs=0.75", "application/vnd.version.v1+json; qs=1.0"})
    public Response getWithV1MediaType() {
        JsonObject response = Json.createObjectBuilder()
                .add("version", "v1").add("media-type", V1_MEDIA_TYPE.toString())
                .build();
        return Response.ok(response).build();
    }

}
```

Add a second resource method to return the V2 response when the correct `Accept` header has bee set.
```java
    /**
     * MediaType implementation for the version resource in v2.
     */
    public static final MediaType V2_MEDIA_TYPE = new MediaType("application", "vnd.version.v2+json");

    @GET
    @Produces("application/vnd.version.v2+json")
    public Response getWithV2MediaType() {
        JsonObject response = Json.createObjectBuilder()
                .add("version", "v2").add("media-type", V2_MEDIA_TYPE.toString())
                .build();
        return Response.ok(response).build();
    }
```


## Implementing tolerant reader with JSON-P

### Step 1: Tolerant reader on the JAX-RS client side

In this step we are implementing a tolerant reader for the ChuckNorris API.

```java
@ApplicationScoped
@Path("jokes")
public class JokesResource {

    private Client client;
    private WebTarget target;

    @PostConstruct
    public void initialize() {
        client = ClientBuilder
                .newBuilder()
                .connectTimeout(5, TimeUnit.SECONDS).readTimeout(5, TimeUnit.SECONDS)
                .build();
        target = client.target("https://api.chucknorris.io/jokes/random");
    }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public Response getJoke(@Context UriInfo uriInfo) {
        // obtain the request as JSON object
        JsonObject jsonJoke = target.request().get(JsonObject.class);

        // direct access to value field may be dangerous
        String value = jsonJoke.getString("value", "No Joke!");

        JsonPointer jsonPointer = Json.createPointer("/url");
        String uri;
        if (jsonPointer.containsValue(jsonJoke)) {
            uri = ((JsonString) jsonPointer.getValue(jsonJoke)).getString();
        } else {
            uri = uriInfo.getRequestUri().toString();
        }

        return Response.ok(value).link(uri, "_self").build();
    }
}
```

### Step 2: Tolerant processing on the JAX-RS server side

```java
@RequestScoped
@Path("tolerant")
public class TolerantResource {

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response postTolerantPayload(@NotNull JsonObject payload) {

        JsonPatch patch = Json.createPatchBuilder()
                .test("/version", "v1")
                .build();

        try {
            JsonObject applied = patch.apply(payload);
            return Response.ok(applied).build();
        } catch (JsonException e) {
            JsonObject error = Json.createObjectBuilder().add("message", e.getMessage()).build();
            return Response.status(Response.Status.BAD_REQUEST).entity(error).build();
        }
    }
}
```


## Resilient service invocation using MicroProfile Fault Tolerance

### Step 1: Add MicroProfile dependencies

Add the following dependencies to the `build.gradle` file.

```groovy
providedCompile 'org.eclipse.microprofile.fault-tolerance:microprofile-fault-tolerance-api:1.1.2'
providedCompile 'org.eclipse.microprofile.rest.client:microprofile-rest-client-api:1.1'
```

### Step 2: Add typed interface for REST client API

Add the following type REST client interface class.

```java
@RegisterRestClient
@Path("/data/2.5/weather")
public interface OpenWeatherMap {
    @GET
    @Consumes(MediaType.APPLICATION_JSON)
    JsonObject getWeather(@QueryParam("q") String city, @QueryParam("appid") String appid);
}
```

### Step 3: Add REST client initialization

```java
    private OpenWeatherMap openWeatherMap;

    @PostConstruct
    void initialize() {
        try {
            openWeatherMap = RestClientBuilder.newBuilder()
                    .baseUri(new URI("https://samples.openweathermap.org"))
                    .property("jersey.config.client.connectTimeout", 500)
                    .property("jersey.config.client.readTimeout", 100)
                    .build(OpenWeatherMap.class);
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public String getWeather(String city) {
        JsonObject response = openWeatherMap.getWeather(city, "b6907d289e10d714a6e88b30761fae22");

        JsonPointer pointer = Json.createPointer("/weather/0/main");
        return ((JsonString) pointer.getValue(response)).getString();
    }
```

### Step 4: Add resiliency annotations and fallback method

Add the following annotations to the repository method
```java
    @CircuitBreaker(delay = 3000L, failureRatio = 0.75, requestVolumeThreshold = 10)
    // @Retry(delay = 100, maxDuration = 2, durationUnit = ChronoUnit.SECONDS, maxRetries = 2)
    @Timeout(value = 2, unit = ChronoUnit.SECONDS)
    @Fallback(fallbackMethod = "defaultWeather")
```

```java
    public String defaultWeather(String city) {
        return "Unknown";
    }
```

## API documentation with MicroProfile Open API

### Step 1: Add MicroProfile Open API dependency

```groovy
dependencies {
    providedCompile 'org.eclipse.microprofile.openapi:microprofile-openapi-api:1.0.1'
}
```

### Step 2: Add OpenAPI definition

Add a `package-info.java` to the root package and add the following `@OpenAPIDefinition` annotation.

```java
@OpenAPIDefinition(
        info = @Info(title = "Cloud-native Applications with Java EE 8",
                contact = @Contact(name = "M.-Leander Reimer", email = "mario-leander.reimer@qaware.de"),
                license = @License(name = "MIT"),
                version = "1.0.0"),
        tags = {
                @Tag(name = "Java EE 8"),
                @Tag(name = "Eclipse MicroProfile")
        },
        servers = {
                @Server(url = "http://localhost:8080/api/")
        },
        externalDocs = @ExternalDocumentation(url = "www.google.com", description = "Use Google for external documentation")
)
```

### Step 3: Add OpenAPI definitions to REST schema

Add the following annotations to the `Book` schema type.
```java
@Schema(name = "Book", description = "POJO that represents a book.")
public class Book {

    @Schema(required = true, example = "978-0345391803")
    @JsonbProperty("isbn-13")
    public String isbn13;

    @Schema(required = true, example = "The Hitchhiker's Guide to the Galaxy")
    public String title;

    @JsonbCreator
    public Book(@JsonbProperty("isbn-13") String isbn13, @JsonbProperty("title") String title) {
        this.isbn13 = isbn13;
        this.title = title;
    }
}
```

### Step 4: Add OpenAPI definitions to REST operations

Add the following annotations to the `books()` method.
```java
    @Operation(summary = "Get all books.", description = "Retrieves the list of all books.")
    @APIResponse(responseCode = "200", description = "The list of all books.",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(type = SchemaType.ARRAY, implementation = Book.class)))
```

Add the following annotations to the `create()` method.
```java
    @Operation(summary = "Create a new book.", description = "Creates a new book.")
    @APIResponse(responseCode = "201", description = "The book has been created.")
    @RequestBody(name = "book", required = true,
            content = @Content(mediaType = "application/json", schema = @Schema(ref = "Book")))
```

Add the following annotations to the `get()` method.
```java
    @Operation(summary = "Get book.", description = "Get a book by ISBN-13.")
    @APIResponse(name = "ok", responseCode = "200", description = "The list of all books.",
            content = @Content(mediaType = "application/json", schema = @Schema(ref = "Book")))
    @APIResponse(responseCode = "404", description = "The book was not found.")
```

Add the following annotations to the `update()` method.
```java
    @Operation(summary = "Update book.", description = "Update book identified by ISBN-13.")
    @APIResponse(responseCode = "200", description = "Update successful.")
    @APIResponse(responseCode = "400", description = "The ISBN did not match or request was invalid.")
    @RequestBody(name = "book", required = true,
            content = @Content(mediaType = "application/json", schema = @Schema(ref = "Book")))
```

Add the following annotations to the `delete()` method.
```java
    @Operation(summary = "Delete book.", description = "Delete a book identified by ISBN-13.")
    @APIResponse(responseCode = "204", description = "Delete successful.")
    @APIResponse(responseCode = "404", description = "The book was not found.")
```

## Building message-driven microservices with Java EE

### Step 1: Add Message Queue infrastructure

Add the following YAML snippet to your `docker-compose.yml` file to create a message queue.
```yaml
  message-queue:
    image: rmohr/activemq:5.15.6
    expose:
    - "61616"       # the JMS port
    - "1883"        # the MQTT port
    - "5672"        # the AMQP port
    ports:
    - "8161:8161"   # the admin web UI
    networks:
    - jee8net
    labels:
      kompose.service.type: nodeport
    deploy:
      replicas: 1
      resources:
        limits:
          memory: 512M
        reservations:
          memory: 512M
```

### Step 2: Add app server configuration

Next, we need to configure the app server to create the relevant managed objects to connect
to the message queue via JMS. Create a file called `src/main/docker/post-deploy.asadmin`.

```
deploy --type rar --name activemq-rar /opt/payara/deployments/activemq-rar.rar

create-resource-adapter-config --property ServerUrl='tcp://message-queue:61616':UserName='admin':Password='admin' activemq-rar
create-connector-connection-pool --raname activemq-rar --connectiondefinition javax.jms.ConnectionFactory --ping false --isconnectvalidatereq true jms/activeMqConnectionPool
create-connector-resource --poolname jms/activeMqConnectionPool jms/activeMqConnectionFactory
create-admin-object --raname activemq-rar --restype javax.jms.Topic --property PhysicalName=MESSAGE.EVENTS jms/MessageEvents

deploy --type war /opt/payara/deployments/messaging-service.war
```

Modify your `Dockerfile` and copy all relevant files into the image.
```
FROM qaware/zulu-centos-payara-micro:8u181-5.183

CMD ["--postdeploycommandfile", "/opt/payara/post-deploy.asadmin"]

COPY src/main/docker/* /opt/payara/
COPY build/activemq/activemq-rar-5.15.6.rar /opt/payara/deployments/activemq-rar.rar
COPY build/libs/messaging-service.war /opt/payara/deployments/
```

### Step 3: Add JMS topic sender for JSON events

Add the following class to send JSON events to the JMS topic. We use plain TextMessages,
and we set the JMS type as well as contentType message headers.

```java
@Stateless
public class MessageEventTopic {

    private static final Logger LOGGER = Logger.getLogger(MessageEventTopic.class.getName());

    @Resource(lookup = "jms/activeMqConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/MessageEvents")
    private Topic destination;

    public void publish(JsonObject messageEvent) {
        StringWriter payload = new StringWriter();
        Json.createWriter(payload).writeObject(messageEvent);

        try (Connection connection = connectionFactory.createConnection()) {
            Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            MessageProducer producer = session.createProducer(destination);
            producer.setTimeToLive(1000 * 30); // 30 seconds

            TextMessage textMessage = session.createTextMessage(payload.toString());
            textMessage.setJMSType("MessageEvent");
            textMessage.setStringProperty("contentType", "application/vnd.message.v1+json");

            producer.send(textMessage);
            LOGGER.log(Level.INFO, "Sent {0} to MessageEvents destination.", textMessage);
        } catch (JMSException e) {
            LOGGER.log(Level.WARNING, "Could not send JMS message.", e);
        }
    }

    public void observe(@ObservesAsync JsonObject messageEvent) {
        publish(messageEvent);
    }
}
```

### Step 4: Add JMS message driven bean to receive JSON events

Add the following class to implement a simple message driven bean that reads the TextMessage and
uses JSON-P to unmarshall the payload. The `MessageDriven` annotations specify the required
connection properties, and a suitable messageSelector.

```java
@MessageDriven(name = "MessageEventMDB", activationConfig = {
        @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/MessageEvents"),
        @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
        @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Topic"),
        @ActivationConfigProperty(propertyName = "destination", propertyValue = "MESSAGE.EVENTS"),
        @ActivationConfigProperty(propertyName = "resourceAdapter", propertyValue = "activemq-rar"),
        @ActivationConfigProperty(propertyName = "subscriptionDurability", propertyValue = "Durable"),
        @ActivationConfigProperty(propertyName = "clientId", propertyValue = "messaging-service"),
        @ActivationConfigProperty(propertyName = "subscriptionName", propertyValue = "MessageEventMDB"),
        @ActivationConfigProperty(propertyName = "messageSelector",
                propertyValue = "(JMSType = 'MessageEvent') AND (contentType = 'application/vnd.message.v1+json')")
})
public class MessageEventMDB implements MessageListener {

    private static final Logger LOGGER = Logger.getLogger(MessageEventMDB.class.getName());

    @Override
    public void onMessage(Message message) {
        LOGGER.log(Level.INFO, "Received inbound message {0}.", message);

        String body = getBody(message);
        if (body != null) {
            try (JsonReader reader = Json.createReader(new StringReader(body))) {
                JsonObject jsonObject = reader.readObject();
                LOGGER.log(Level.INFO, "Unmarshalled MessageEvent from {0}.", jsonObject);
            }
        }
    }

    private String getBody(Message message) {
        String body = null;
        try {
            if (message instanceof TextMessage) {
                body = ((TextMessage) message).getText();
            }
        } catch (JMSException e) {
            LOGGER.log(Level.WARNING, "Could not get message body.", e);
        }
        return body;
    }
}
```


## Enabling multi-environment configuration using MicroProfile Config

### Step 1: Add MicroProfile Config dependency

In order to use the config API, add the following dependency to your `build.gradle` file.
```groovy
dependencies {
    providedCompile 'org.eclipse.microprofile.config:microprofile-config-api:1.3'
}
```

### Step 2: Simple `@ConfigProperty` injection

All configuration values can be injected, using the `@ConfigProperty` annotation. Create the
following configuration bean class.
```java
@ApplicationScoped
public class ConfigurationBean {

    @Inject
    @ConfigProperty(name = "hostname")
    private String hostname;

    @Inject
    @ConfigProperty(name = "a.optional.string")
    private Optional<String> aOptionalString;

    @Inject
    @ConfigProperty(name = "a.dynamic.string", defaultValue = "A default value.")
    private Provider<String> aDynamicString;

    @Inject
    @ConfigProperty(name = "a.long", defaultValue = "23051977")
    private Long aLong;

    @Inject
    @ConfigProperty(name = "a.string.array")
    private String[] aStringArray;

    // other getters omitted for brevity
    public String getDynamicString() { return aDynamicString.get(); }
}
```

The values are either taken from system properties, ENV variables or the contents
of the `microprofile-config.properties` file.

### Step 3: Add custom MicroProfile Config converters

To convert configuration values to non standard data types, implement a custom converter.
```java
public class JsonObjectConverter implements Converter<JsonObject> {
    @Override
    public JsonObject convert(String value) {
        try {
            return Json.createReader(new StringReader(value)).readObject();
        } catch (JsonException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
```

You need to register all custom converters in the service loader file
`src/main/resources/META-INF/org.eclipse.microprofile.config.spi.Converter`.

```java
    @Inject
    @ConfigProperty(name = "a.json.object")
    private JsonObject aJsonObject;
```

### Step 4: Programmatic configuration

Add the following REST resource implementation class to show the programmatic usage of the `Config` API.

```java
@ApplicationScoped
@Path("configuration")
public class ConfigurationResource {

    @Inject
    private Config config;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response info() {
        JsonArrayBuilder response = Json.createArrayBuilder();

        Iterable<ConfigSource> configSources = config.getConfigSources();
        for (ConfigSource source : configSources) {
            response.add(Json.createObjectBuilder()
                    .add("name", source.getName())
                    .add("ordinal", source.getOrdinal())
                    .add("propertyNames", Json.createArrayBuilder(source.getPropertyNames()))
            );
        }

        return Response.ok(response.build()).build();
    }

    @GET
    @Path("{key}")
    @Produces(MediaType.TEXT_PLAIN)
    public Response get(@PathParam("key") String key) {
        return Response.ok(config.getValue(key, String.class)).build();
    }
}
```


## Handling secrets in Cloud-native Java EE microservices

### Step 1: Secure usage of ENV variables

Create a `.env` file for local development, make sure to never commit this
file into version control.

```
ENV_USER_NAME=secure-env-user
ENV_USER_PASSWORD=secure-env-password
```

We running your container with Docker Compose, edit you `docker-compose.yml` and
add the envrionment variables without value.
```yaml
environment:
 - ENV_USER_NAME
 - ENV_USER_PASSWORD
```

You can now access the environment variables using MicroProfile Config API as usual.
```java
@Inject
@ConfigProperty(name = "env.user.name")
private Provider<String> envUsername;

@Inject
@ConfigProperty(name = "env.user.password")
private Provider<String> envPassword;
```

### Step 2: Secure usage of secrets files

Another popular option is to store secrets as individual files and mount these into a container.
Extend the `docker-compose.yaml` with the following:

```yaml
volumes:
  - ./src/test/resources:/secrets:ro
```

Next, we need to configure Payara to pick up the secrets files from this location. If you are using a different app
server this may vary.
```
set-config-secrets-dir --directory=/secrets
```

Now you can access the secrets files using normal MicroProfile Config API. The important bit is that the file name
needs to correspond to the properties name.
```java
@Inject
@ConfigProperty(name = "secret.user.name")
private Provider<String> secretUsername;

@Inject
@ConfigProperty(name = "secret.user.password")
private Provider<String> secretPassword;
```


### Step 3: Using Secrets in Kubernetes

First we need encode the secret user name and password in the console.

```
$ echo -n 'secret-agent' | base64
c2VjcmV0LWFnZW50
$ echo -n 'jamesbond007' | base64
amFtZXNib25kMDA3
```

Next, we create a Kubernetes YAML definition of a Secret in

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: super-secret
type: Opaque
data:
  secret.user.name: c2VjcmV0LWFnZW50
  secret.user.password: amFtZXNib25kMDA3
```

You now have two options to use the Secret in Kubernetes: mount the secrets as ENV variables (see Step 1) or mount the
secrets as files (see Step 2). To use these, create a file `src/main/kubernetes/secrets-service-deployment.yaml`.

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    io.kompose.service: secrets-service
  name: secrets-service
spec:
  replicas: 1
  template:
    metadata:
      labels:
        io.kompose.service: secrets-service
    spec:
      containers:
      - image: secrets-service:1.0.1
        name: secrets-service
        ports:
        - containerPort: 8080
        # injecting secrets as ENV variables
        env:
        - name: ENV_USER_NAME
          valueFrom:
            secretKeyRef:
              name: super-secret
              key: secret.user.name
        - name: ENV_USER_PASSWORD
          valueFrom:
            secretKeyRef:
              name: super-secret
              key: secret.user.password
        # injecting secrets as files in a directory
        volumeMounts:
        - mountPath: /secrets
          name: super-secret
          readOnly: true
      restartPolicy: Always
      volumes:
      - name: super-secret
        secret:
          secretName: super-secret
```

## Clustered Scheduling and Coordination with EJBs

### Step 1: Multiple deployments with Docker Compose

To simulate a clustered deployment we are going to start the same service as two individual containers.
Add the following snippet to your `docker-compose.yml` file:
```yml
version: "3"

services:  
  cluster-schedule-1:
    build:
      context: .
    image: cluster-schedule:1.0.1
    ports:
    - "18080:8080"
    networks:
    - jee8net

  cluster-schedule-2:
    image: cluster-schedule:1.0.1
    ports:
    - "28080:8080"
    networks:
    - jee8net

networks:
  jee8net:
    driver: bridge
```

### Step 2: Create a Automatic Timer EJB

In order to create an automatic timer that runs using a Cron like schedule, add the following EJB class.
The schedule will run every 5 seconds.

```java
@Startup
@Singleton
public class ClusterScheduleAutoBean {

    private static final Logger LOGGER = Logger.getLogger(ClusterScheduleAutoBean.class.getName());

    @Inject
    @Metric(name = "automaticTimeoutCounter", absolute = true)
    private Counter automaticTimeoutCounter;

    @Schedule(second = "*/5", minute = "*", hour = "*")
    public void automaticTimeout() {
        automaticTimeoutCounter.inc();
        LOGGER.log(Level.INFO, "Automatic timer execution {0} at {1}.",
                new Object[]{automaticTimeoutCounter.getCount(), LocalDateTime.now()});
    }

    public long getAutomaticTimeoutCounter() {
        return automaticTimeoutCounter.getCount();
    }
}
```

### Step 3: Create a Programmatic Timer EJB

In order to create and run a programmatic interval timer, add the following EJB class. The logic is contained
in the `@Timeout` annotated method. The interval is set to 2 seconds with an initial delay of 10 seconds.

```java
@Startup
@Singleton
public class ClusterScheduleProgBean {

    private static final Logger LOGGER = Logger.getLogger(ClusterScheduleProgBean.class.getName());

    @Inject
    @Metric(name = "programmaticTimeoutCounter", absolute = true)
    private Counter programmaticTimeoutCounter;

    @Resource
    private TimerService timerService;

    @PostConstruct
    public void initialize() {
        timerService.createIntervalTimer(10000, 2000, new TimerConfig(ClusterScheduleProgBean.class.getName(), true));
    }

    @Timeout
    public void programmaticTimeout(Timer timer) {
        programmaticTimeoutCounter.inc();
        LOGGER.log(Level.INFO, "Programmatic timer execution {0} at {1}.",
                new Object[]{programmaticTimeoutCounter.getCount(), LocalDateTime.now()});
    }

    public long getProgrammaticTimeoutCounter() {
        return programmaticTimeoutCounter.getCount();
    }

}
```

### Step 4: Synchronize Clustered Timer with Hazelcast and Distributed Locks

Currently the individual timer EJBs all run concurrently when running multiple instances. This may not be desirable.
To avoid this, we can use a distributed lock from Hazelcast to synchronize the instances.

Make sure you have the following dependency defined in your `build.gradle` file.
```groovy
providedCompile 'com.hazelcast:hazelcast:3.10.5'
```

First, import the Hazelcast instance from Payara bound to the `payara/Hazelcast` JNDI name.
```java
@Resource(name = "payara/Hazelcast")
private HazelcastInstance hazelcast;
```

The, add the following code snipped to the timer beans, e.g. the automatic timer bean.
```java
@Schedule(second = "*/5", minute = "*", hour = "*")
public void automaticTimeout() {
    ILock lock = hazelcast.getLock("automaticTimeoutLock");
    if (lock.tryLock()) {
        try {
            automaticTimeoutCounter.inc();
            LOGGER.log(Level.INFO, "Automatic timer execution {0} at {1}.",
                    new Object[]{automaticTimeoutCounter.getCount(), LocalDateTime.now()});

            Thread.sleep(5000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            lock.unlock();
        }
    } else {
        LOGGER.log(Level.INFO, "Skip automatic timer execution. Locked by another instance.");
    }
}
```

```java
@Timeout
public void programmaticTimeout(Timer timer) {
    ILock lock = hazelcast.getLock("programmaticTimeoutLock");
    if (lock.tryLock()) {
        try {
            programmaticTimeoutCounter.inc();
            LOGGER.log(Level.INFO, "Programmatic timer execution {0} at {1}.",
                    new Object[]{programmaticTimeoutCounter.getCount(), LocalDateTime.now()});

            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            lock.unlock();
        }
    } else {
        LOGGER.log(Level.INFO, "Skip programmatic timer execution. Locked by another instance.");
    }
}
```
