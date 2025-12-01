#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

#import "/src/meta/terms.typ": *

= Basics
This chapter focuses on the technical basics that are needed to understand the context of metric monitoring tools. The first section introduces the term *cloud-native application* which builds the nature of monitored application. The second seciton explores the principles of *observability* in this space. A big part of observability are *metrics*, explained in the third section. In the 4th section the pull and push approaches of gathering metrics are compared. And the 5th and 6th section gives a short overview over the *Openmetrics* format and *Grafana* tool used to administer metrics.

== Cloud-native Application
Cloud-native applications are concipated to fully utilize the advantages of cloud-platforms like *scalability*, *flexibility* and *cost-effectiveness*. They are usually made up of *microservices*, that run in *containers* and communicate with each other over APIs.

*Advantages and Properties*
- *Indpendent development and deployment*: Different microservices can be developed in different programming languages and updated independently.
- *Continious Integratioon / Continoius Deployment (CI/CD)*: Automatic processes for builds, tests and deployments.
- *On-demand scaling*: Ressources can be allocated dynamically.
- *Resilience and Monitoring*: Loosley coupled systems have a higer tolerance to errors and are easier to monitor.

Continious Integration/Continoius Deployment, a way of designing, creating, deploying and running applications with all advantages of cloud platform -> scalability, cost-effectiveness
compiled of dozens of smaller software/systems (microservices in containers(efficient af) on cloud servers working together)
advntgs: independet developing(e.g. different languages), testing, replacement, on-demand scaling, updating and deployment(different CPUs, servers ...) -> flexibility
loosley coupled systems resilient, manageable, and observable

== Observability
With increasing *complexity* due to microservices, containers and APIs, classic monitoring does not suffice to manage cloud-based applications anymore.
*Observability* means to derive the internal state of a system out of its produced data (telemetry), without direct access to its components.

*Key points*
- Includes *Metrics*, *Logs* and *Traces*
- Goal: *hollistic understanding*  of a systems health and performance
- Enables transparacy and quick debugging in cloud-environments

== Metrics
*Definition*: Metrics are *numerical measurements* with *timestamps* and optional *labels/metadata*. They provide information about the state of a system at a given time period.

*Examples*:
- CPU-Usage
- latency
- number of active users
*Scenarios*
- Base for *Dashboards* and *Alerts*
- Automatic scaling and error-handling

== Pull vs. Push models
*Push-Model:*
- Clients are actively sending data to the server (e.g. via UDP)
- Advantages: easy for short-lived jobs, low latency, easy setup
- Disadvantages: less controll serverside, difficult authenication 
*Pull-Model:*
- Server actively querys data of clients (e.g. via http-scraping)
- Advantages: better reliability, authentication and debugging
- Disadvantages: requires service discovery and client-side http-endpoints

== Grafana
Grafana is a *visualization-tool* that querys data from different sources (e.g. prometheus, InfluxDB) and represents it in dashboards.

*Functonality:*
- Flexible visualization
- Alerting
- Integration of different data-sources

== OpenMetrics
OpenMetrics is a *standart-format* for exposing metrics, based on the prometheus-format.

*Characteristics*
- Text and line-based, easy to read
- independent of transport protocol
- Goal: interopoerability between monitoring systems

#pagebreak()