---
layout: post
title: MicroProfile - Diagnosability Triangle
date: 2019-08-25 18:38:00.000000000 +08:00
type: post
categories: [Programming, CloudNativeJavaEE]
author: yyl
---

## Adding good, detailed and structured logging

Having good, detailed and structured logging is the cornerstone of good and
easy diagnosability.

### Step 1: Define a suitable logging strategy

- **DEBUG** - Used for detailed and valuable information required for debugging.
- **INFO** - Used for important runtime or business events.
- **WARNING** - Used for non critical errors that can be compensated by the system.
- **ERROR** -  Used for critical errors that need immediate attention (ops team or SRE).

### Step 2: Choose a suitable logging framework

There are many good logging frameworks out there. Usually it is a good idea to have a uniform
logging API available to homogenize all of these. Add the following SLF4J dependencies.

```groovy
    compile 'org.slf4j:slf4j-api:1.7.25'
    runtime 'org.slf4j:slf4j-jdk14:1.7.25'
    runtime 'org.slf4j:log4j-over-slf4j:1.7.25'
    runtime 'org.slf4j:jcl-over-slf4j:1.7.25'
```

### Step 3: Configure logging framework


1. **Reduce noise!** Avoid excessive logging, especially by 3rd party dependencies. Tune the log level.
2. Decide on log format (plain text vs. JSON) and define format.

Open the file called `logging.properties` and add the following content to it.

```ruby
## Handlers
handlers=java.util.logging.ConsoleHandler
java.util.logging.ConsoleHandler.formatter=com.sun.enterprise.server.logging.ODLLogFormatter
com.sun.enterprise.server.logging.ODLLogFormatter.ansiColor=true

# java.util.logging.ConsoleHandler.formatter=fish.payara.enterprise.server.logging.JSONLogFormatter

java.util.logging.ConsoleHandler.level=FINEST

## Global Level
.level=WARNING

## Application Level
cloud.nativ.javaee.level=FINEST

# 3rd Party Level
PayaraMicro.level=INFO
javax.level=INFO
javax.enterprise.system.core.level=INFO
javax.enterprise.system.core.classloading.level=INFO
javax.enterprise.system.tools.deployment.level=INFO
javax.enterprise.system.core.transaction.level=INFO
javax.enterprise.system.tools.admin.level=INFO
org.apache.jasper.level=INFO
org.apache.catalina.level=INFO
org.apache.coyote.level=INFO
```

### Step 4: Add logging

To get hold of a suitable logger instance, we can use CDI by implementing the following producer.

```java
@ApplicationScoped
public class LoggerProducer {

    @Produces
    @Dependent
    public Logger produceLogger(InjectionPoint injectionPoint) {
        Class<?> declaringClass = injectionPoint.getMember().getDeclaringClass();
        return LoggerFactory.getLogger(declaringClass);
    }
}
```

Using the `Logger` in your code is easy, simply `@Inject` the instance where ever needed.

```java
@Slf4j
@ApplicationScoped
@Path("logger")
public class LoggerResource {

    @Inject
    private Logger logger;

    @PUT
    @Logged
    public Response log(@QueryParam("level") @DefaultValue("INFO") String level, @QueryParam("message") String message) {
        switch (level) {
            case "DEBUG":
                logger.debug(message);
                break;
            case "WARN":
                logger.warn(message);
                break;
            case "ERROR":
                logger.error(message);
                break;
            case "INFO":
                logger.info(message);
                break;
            default:
                // this uses the Lombok LOGGER !!!
                LOGGER.info(message);
        }

        return Response.noContent().build();
    }
}
```

### Bonus Step: The Elastic Stack

As a bonus, you may want to follow the instructions found in the elastic stack
repository (https://github.com/elastic/stack-docker) to fire up a current Elastic
Stack locally using Docker Compose. Careful, you need quite some resources.


## Adding telemetry data using MicroProfile Metrics

Good telemetry data on technical as well as business metrics is another cornerstone of good
diagnosability in a cloud native environment.

### Step 1: Add MicroProfile Metrics API

Add the following dependency to your `build.gradle` file.

```groovy
    providedCompile 'org.eclipse.microprofile.metrics:microprofile-metrics-api:1.1.1'
```

### Step 2: Add custom metrics to JAX-RS resource

There are several ways to add metrics to your code: annotate methods using the desired MicroProfile Metrics
annotation or inject a suitable metrics instances for programmatic access. Add the following class
to your codebase.

```java
@ApplicationScoped
@Path("metrics-demo")
public class MetricsDemoResource {

    @Inject
    @Metric(name = "globalMetricsDemoCounter", absolute = true)
    private Counter counter;

    private final AtomicInteger concurrentInvocations = new AtomicInteger(0);

    @GET
    @Timed(name = "metricsDemo", unit = MetricUnits.MILLISECONDS)
    public JsonObject metricsDemo() {
        counter.inc();

        try {
            return Json.createObjectBuilder()
                    .add("counter", counter.getCount())
                    .add("currentConcurrentInvocations", concurrentInvocations.incrementAndGet())
                    .build();
        } finally {
            concurrentInvocations.decrementAndGet();
        }
    }

    @Gauge(name = "currentConcurrentMetricsDemoInvocations", unit = MetricUnits.NONE)
    public Integer currentConcurrentInvocations() {
        return concurrentInvocations.get();
    }
}
```

### Step 3: Access metrics endpoints

Once you have compiled everything, built the image and fired up the container, the default
metrics endpoints are exposed already.

```
$ curl http://localhost:8080/api/metrics-demo

$ curl http://localhost:8080/metrics
$ curl http://localhost:8080/metrics/application
$ curl http://localhost:8080/metrics/base
```

### Bonus Step: Try Prometheus

Add the following definitions to your `docker-compose.yml` file to also start Prometheus, the Node Exporter
as well as Grafana.

```ruby
prometheus:
  image: prom/prometheus:v2.4.3
  volumes:
  - ./prometheus.yml:/etc/prometheus/prometheus.yml
  command: "--config.file=/etc/prometheus/pometheus.yml"
  ports:
  - "9090:9090"
  depends_on:
  - node-exporter
  - metrics-service
  networks:
  - jee8net

node-exporter:
  image: prom/node-exporter:v0.16.0
  ports:
  - "9100:9100"
  networks:
  - jee8net

grafana:
  image: grafana/grafana:5.3.2
  ports:
  - "3000:3000"
  depends_on:
  - prometheus
  networks:
  - jee8net
```

Also, add a `prometheus.yml` file to your codebase with the following content.

```ruby
# global config
global:
  scrape_interval:     5s # By default, scrape targets every 15 seconds.
  evaluation_interval: 5s # By default, scrape targets every 15 seconds.
  # scrape_timeout is set to the global default (10s).

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
    monitor: 'metrics-monitor'

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
# - "first.rules"
# - "second.rules"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
# The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
- job_name: 'prometheus'

  # Override the global default and scrape targets from this job every 5 seconds.
  scrape_interval: 5s

  # metrics_path defaults to '/metrics'
  # scheme defaults to 'http'.

  static_configs:
  - targets: ['localhost:9090']

- job_name: "node-exporter"
  scrape_interval: "15s"
  static_configs:
  - targets: ['node-exporter:9100']

- job_name: "metrics-service"
  scrape_interval: "3s"
  static_configs:
  - targets: ['metrics-service:8080']
```

## Adding readiness probes using MicroProfile Health

### Step 1: Add MicroProfile Health dependency

```groovy
    providedCompile 'org.eclipse.microprofile.health:microprofile-health-api:1.0'
```

### Step 2: Add health check implementations

Add the following `HealthCheck` implementation class to check if a TCP connection can be
established locally.

```java
@ApplicationScoped
@Health
public class TcpConnectHealthCheck implements HealthCheck {

    @Override
    public HealthCheckResponse call() {
        HealthCheckResponseBuilder builder = HealthCheckResponse.builder().name("tcp");
        try (Socket socket = new Socket("localhost", 8080)) {
            if (socket.isConnected()) {
                builder = builder.up();
            } else {
                builder = builder.down();
            }
        } catch (IOException e) {
            builder = builder.down().withData("message", e.getMessage());
        }
        return builder.build();
    }
}
```

Add the following `HealthCheck` implementation to build a more elaborate and modifiable health
checkk response.

```java
@ApplicationScoped
@Health
public class ModifiableHealthCheck implements HealthCheck {

    private AtomicBoolean state = new AtomicBoolean(true);
    private String message = "Health is OK.";

    @Override
    public HealthCheckResponse call() {
        return HealthCheckResponse.builder()
                .name("modifiable")
                .state(state.get())
                .withData("message", message)
                .withData("currentTimeMillis", System.currentTimeMillis())
                .withData("version", "1.0.1")
                .build();
    }

    public void up(String message) {
        state.compareAndSet(false, true);
        this.message = message;
    }

    public void down(String message) {
        state.compareAndSet(true, false);
        this.message = message;
    }
}
```

To modify the health response, add the following REST resource implementation to your codebase.

```java
@ApplicationScoped
@Path("health-check")
public class HealthCheckResource {

    @Inject
    @Health
    private ModifiableHealthCheck healthCheck;

    @PUT
    @Path("up")
    public Response up(@QueryParam("message") @DefaultValue("Health is OK.") String message) {
        healthCheck.up(message);
        return Response.ok().build();
    }

    @PUT
    @Path("down")
    public Response down(@QueryParam("message") @DefaultValue("Health is NOK.") String message) {
        healthCheck.down(message);
        return Response.ok().build();
    }

}
```

### Step 3: Query /health endpoint manually

Once you compile and run everything, the default `/health` endpoint is exposed by the service.

```
$ curl http://localhost:8080/health

$ curl -X PUT http://localhost:8080/api/health-check/down
$ curl http://localhost:8080/health

$ curl -X PUT http://localhost:8080/api/health-check/up
$ curl http://localhost:8080/health
```


### Step 4: Using /health endpoint as Kubernetes readiness probe

Finally, we can now use the `/health` endpoint as a readiness probe in our Kubernetes deployment.
Add the following readiness and liveness probes to the `src/main/kubernetes/health-service-deployment.yaml`.

```ruby
    # use health endpoint as readiness probe
    readinessProbe:
      httpGet:
        path: /health
        port: 8080
      initialDelaySeconds: 30
      periodSeconds: 5

    # use WADL endpoint as liveness probe
    livenessProbe:
      httpGet:
        path: /api/application.wadl
        port: 8080
      initialDelaySeconds: 60
      periodSeconds: 5
```


## Adding trace information using MicroProfile OpenTracing

### Step 1: Add the MicroProfile OpenTracing dependency

First, we need to add the following dependencies to the `build.gradle` file.

```groovy
    providedCompile 'org.eclipse.microprofile.opentracing:microprofile-opentracing-api:1.1'
    providedCompile 'io.opentracing:opentracing-api:0.31.0'
```

### Step 2: Configure Payara request tracing

Next we need to configure the request tracing feature of Payara using a post boot command file.
Create a file called `post-boot.asadmin` and add the following content.

```bash
set-requesttracing-configuration --thresholdValue=25 --enabled=true --target=server-config --thresholdUnit=MICROSECONDS --dynamic=true
requesttracing-log-notifier-configure --dynamic=true --enabled=true --target=server-config
```

We also need to modify the `Dockerfile` to use the post boot command file in the CMD options.

```ruby
FROM qaware/zulu-centos-payara-micro:8u181-5.183

CMD ["--noCluster", "--postbootcommandfile", "/opt/payara/post-boot.asadmin", "--deploymentDir", "/opt/payara/deployments"]

COPY post-boot.asadmin /opt/payara/
COPY build/libs/tracing-service.war /opt/payara/deployments/
```

### Step 3: Use MicroProfile OpenTracing with JAX-RS

To use MicroProfile OpenTracing we simply need to annotate any JAX-RS resource method with the `@Traced` annotation.
We can also use CDI to `@Inject` a `io.opentracing.Tracer` instance. Create the following class.

```java
@ApplicationScoped
@Path("tracing")
public class TracingResource {

    @Inject
    private Tracer tracer;

    @GET
    @Traced
    public Response trace(@QueryParam("payload") @DefaultValue("None") String payload) {
        tracer.activeSpan().setTag("payload", payload);
        return Response.ok().build();
    }
}
```
