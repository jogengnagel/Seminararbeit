#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

#import "/src/meta/terms.typ": *

= Basics
- Short Description of what the chapters are about

== Cloud-native Applications and Monitoring
Cloud-native applications are concipated to fully utilize the advantages of cloud-platforms like *scalability*, *flexibility* and *cost-effectiveness*.
They are usually made up of *microservices*, that run in *containers* and communicate with each other over APIs.

=== Advantages and Properties
- *Indpendent development and deployment*: Because different microservices are independent of each other, they can be developed in different programming languages, updated at different intervals and hosted on different hardware, fitting their specific needs. 
- *Continious Integratioon / Continoius Deployment (CI/CD)*: Cloud based applications enable automatic processes for builds, tests and deployments. This allows teams to optimize development and maintain efficiency in ever growing applications.
- *On-demand scaling*: Ressources can be allocated dynamically to whatever part of the system needs it, making it very flexible in case of ressource-spikes.
- *Resilience and Monitoring*: Loosley coupled systems have a higer tolerance to errors and are easier to monitor. When one part of the application ceases to work, it does not directly affect the other parts and the apllication might be able to work fine nevertheless.

=== Challenges
Cloud based development demands a switch from a traditional monolithic mindset to a more of a cloud-based mindset especially for organizations whith a lot of history and lasting legacy applications. Some of the challenges organizations face the first time developing a cloud based application are: 
- *Complexity*: Developing large applications consisting of many small microservices introduces a lot more abstraction and overhead in form of layers to the application. These layers are needed to tie the services together and sustain the introduced flexibility. This creates a complex application architecture and introduces more potential points of failure compared to a monolithic system structure.
- *Management and Maintanance*: As the applications scales, the amount of data being produced by the system grows exponentially. This requires an advanced strategy for managing, storing and processing the data to ensure consistency and correct behavior between the distributed systems.
- *Security and Communication*: Due to the distributed nature of cloud-based applications, communication between microservices can be a security risk, especially if sensitive data like user-information is being sent to different microservices in different locations. Companies have to establish and enforce security controls.

@cloudnative @monitoring

=== Monitoring in Cloud Environments
In order to fully utilize the advantages and properly manage the challenges of cloud-native applications, cloud-native applications are designed with monitoring in mind. Monitoring helps operators and developers to fully understand the state of a complexly distributed application without needing a deeper knowledge of the whole codebase.
Cloud monitoring is commonly used to achieve the following goals:
- *Performance Assurance*:
The applications performance is monitored by tracking hardware-utilization like CPU, Memory, Storage and Network Usage. This is for detecting issues with performance degregation and initiating solutions.
- *Reliability and Availability*:
Many companies have to comply to SLAs which are often defined by the applications up-times, respone-times, and failure-rates. 
- *Security*:
Monitoring can also be really usefull for detecting security-risks like unauthorized access and intrusion attempts.
@monitoring

This is achieved by collecting and analyzing telemetry data from different microservices. 

== Telemetry Types
Telemetry data for monitoring distributed cloud-native applications consists of three primary pillars.
=== Logs
Logs are timestamped text records with optional metadata emitted on events. They provide usefull information about time-specific occurences of user-actions, warings and errors. They are essential for udnerstanding processess and debugging issues. 
(example)
=== Traces
Traces provide insight to requests from start to finish as it travels through multiple components of a distributed system. They make it easy to understand the context of complex data-flows and diagnosing root-causes of issues in the application.
- examples

=== Metrics
Metrics are *numerical measurements* with *timestamps* and optional *labels/metadata*. They provide information about the state of a system at a given time period and form the basics for many monitoring-processes. They are leightweight and ideal for alerting and triggering actions.

*Examples*:
- CPU-Usage
- latency
- number of active users
*Scenarios*
- Base for *Dashboards* and *Alerts*
- Automatic scaling and error-handling

@telemetry

The complex distributed nauture of cloud-native applications makes it very difficult to effiently collect, aggregate and visualize the emitted data in a benefitial way. This is reflected in the layered architecture of cloud monitoring systems.

== Compononts of Cloud Monitoring Systems
Dataflow - Daiagram

=== Data Acquisition Layer
The data acquisition layer builds the foundation of cloud monitoring architecture. There are two different ways monitoring system ingest telemetry data genereated by all the microservices.
@architecture

*Push-Model:*
In the Push-Model each microservice has their own agent that actively pushes telemetry-data to the monitoring-system. This is usually done via a simple UDP client-server connection, allowing an easy setup, low latency and horizontal scaling. A problem with this model is that the server doesn't controll which services can push data and implementing authentication can be difficult. 

*Pull-Model:*
In the pull-model the server actively scrapes data from registered clients via a TCP connection. This allows for easier authentication and debugging and provides a more reliable connection. But it requires a more complex setup where the monitoring system has to be aware of the services to scrape and the client has to provide a http endpoint. This model is not suitable for event driven telemetry such as logs and traces.

- Illustration?

Most monitoring tools specialise on one of the models while also providing an intermediary solution to cover jobs that require the other model.
@pushpull1

=== Data Aggregation and Processing Layer
The collected telemetry data has to be effiently stored and aggregated for analysis. This layer commonly uses message brokers for streaming ingestion and centralizing diverse data from different sources. The data is then stored in databases that needs to be both scalable and adaptable to accomodate large amounts of diverse data. Different Solutions are:
- *Relational Databases*: For structured data organized in tables, rows and columns like transaction logs.
- *NoSQL Databases*: For handling large volumes of flexible unstructured data such as metadata.
- *Time Series Databases (TSDBs)*: Optimized for data indexed by time, e.g. metrics.
Each solution comes with their own set of functions and query language to efficently transform the aggregated data in two distinct ways. *Real-time Streaming* enables the system to quickly detect issues and trigger alerts. *Batch Processing* are used for heavier aggregation tasks and historical analysis like debugging. Using both apporaches allows for monitoring immediate and long-term behaviour.
=== Visualization and Alerting Layer
@architecture

== Standarts and Frameworks
Standarts and frameworks are needed to put all the different systems together, standardized formats. Interlink, ..., Compatability between tools, systems and stuff

=== OpenMetrics
OpenMetrics is a *format* for standardizing and exposing these metrics to the monitoring-systems, 
based on the prometheus-format. @openmetrics
Example

=== OpenTelemetry 
OpenMetrics (as name says) only metrics, OpenTel -> more monitoring (observability) for debugging and tracing and stuff, broader approach
OpenTelemetry is an *open-source observability framework and toolkit* 
*Key characteristics:*
- Provides *APIs and SDKs* for generating, exporting, and collecting telemetry data (metrics, logs, traces).
- *Vendor-neutral* and designed to avoid lock-in.
- Enables *instrumentation across languages and environments*.
- Does not store or visualize data itself; relies on backends such as Prometheus or InfluxDB.
- Facilitates *integration of multiple data sources* into a unified observability pipeline.
- Push as standart for all telemetry, pull gateway e.g. for prometheus
Application → OpenTelemetry SDK → Collector → Backend
@opentelemetry

== Key Concepts for Comparison
=== label-based vs hierarchical
=== cardinality
=== tsdb concept and queries
=== Data Acquisition Methods
#pagebreak()