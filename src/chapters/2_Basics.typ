#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

#import "/src/meta/terms.typ": *

= Basics
- Short Description of what the chapters are about

== Cloud-native Application
Cloud-native applications are concipated to fully utilize the advantages of cloud-platforms like *scalability*, *flexibility* and *cost-effectiveness*.
They are usually made up of *microservices*, that run in *containers* and communicate with each other over APIs.

*Advantages and Properties*
- *Indpendent development and deployment*: Different microservices can be developed in different programming languages and updated independently.
- *Continious Integratioon / Continoius Deployment (CI/CD)*: Automatic processes for builds, tests and deployments.
- *On-demand scaling*: Ressources can be allocated dynamically,  cost-efficient
- *Resilience and Monitoring*: Loosley coupled systems have a higer tolerance to errors and are easier to monitor.

*Challenges*
Switch from traditional monolithic mindset to cloud mindset for 'older' organizations, challenges organizations face for the first time use:
- Complexity, Learning Curve: complex large applications, microservices introduce even more abstraction and overhead
- scurity and compliance: communication between microservices,  
- managing and maintaining distributed systems: more points of failure, maintaining, coordinating, ephemeral workloads, scaling amount of data
@cloudnative @monitoring

These complex/decoupled/distributed systems with all their advantages introduce challenges that make monitoring so important/indespensible.

== Monitoring in Cloud Environments
Monitoring across complexly distributed systems/applications has to be maintained in order to enabele and fully utilize all the advantages of cloud-native applications and to manage the challenges.

- Goal: *hollistic understanding*  of a systems health and performance
- Enables transparacy and quick debugging in cloud-environments
- *Performance Assurance:* (CPU, Memory, Storage, Network Usage) to detect performance degradation
- *Reliability and Availability:* up-times, response-times, failure-rates
- *Security:* unauthorized access, intrusion attempts, vulnerabilities
@monitoring

This is achieved by collecting and analyzing telemetry data from different microservices. Telemetry data consists of *metrics, logs and traces*.

Merge Cloudbased and Monitoring?

== Telemetry Types
=== Logs
- timestamped text record (with optional metadata) 
- examples?
- Scenarios

=== Traces
- provides insight to request from start to finish as it travels through multiple components of a distributed system/microservices
- made up of spans
- make it easier to understand root causes, locate bottlenecks
- examples
@telemetry

All of this different data needs to be collected, aggregated and visualized. Thats why specific layered architectures and standardized formats are needed for cloud monitoring.

=== Metrics
Metrics are *numerical measurements* with *timestamps* and optional *labels/metadata*. They provide information about the state of a system at a given time period and form the basics for many monitoring-processes.

*Examples*:
- CPU-Usage
- latency
- number of active users
*Scenarios*
- Base for *Dashboards* and *Alerts*
- Automatic scaling and error-handling

Why metrics are central to this paper, or in Chapter3?

== Compononts of Cloud Monitoring Systems
COnsist of Backend, Visualization, APIs, DataFormats, ...
Receiver, Storage, UI
Single-Node vs Clustered, ...
- Centralized, Distributed/hierarchical, Serverless, Clusterd
Dataflow
=== Data Collection Layer
=== Data Aggregation Layer
=== Visualization and Alerting Layer

=== Grafana 
Grafana Bsp Visualisierungslayer (und Alerting ...). Warum hier und in Kapitel3 erwaehnen? Welche Rolle soll es spielen?
Transforming all the data into human readable graphs and stuff
Grafana is a *visualization-tool / observability-platform* that querys data from different sources (e.g. prometheus, InfluxDB) and represents it in dashboards.

*Functonality:*
- Flexible visualization
- Alerting
- Integration of different data-sources

== Data Acquisition Methods
There are two different ways monitoring system ingest telemetry data genereated by all the microservices.

*Push-Model:*
- Clients are actively sending data to the server (via UDP)
- Advantages: easy for short-lived jobs, low latency, easy setup
- Disadvantages: less controll serverside, difficult authenication 

*Pull-Model:*
- Server actively querys data of clients (via HTTP)
- Advantages: better reliability, authentication and debugging
- Disadvantages: requires service discovery and client-side http-endpoints
- not suitable for event driven telemtry such as logs and traces
Most monitoring tools specialise on one of the models but provide an intermediary solution to cover jobs that require the other.

== Standarts and Frameworks
Standarts and frameworks are needed to put all the different systems together, standardized formats. Interlink, ..., Compatability between tools, systems and stuff

Hierarchical vs labelbased

=== OpenMetrics
OpenMetrics is a *format* for standardizing and exposing these metrics to the monitoring-systems, 
based on the prometheus-format. @openmetrics
Example

=== OpenTelemetry 
Why OpenTelemetry
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

== Key Concepts for Comparison
More Concepts from Comparison very short description and examples (oder lieber in Chapter3?)
=== label-based vs hierarchical
=== cardinality
=== tsdb concept

#pagebreak()