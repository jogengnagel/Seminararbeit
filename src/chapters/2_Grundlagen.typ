#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

#import "/src/meta/terms.typ": *

= Grundlagen

Cloud-native Application
Continious Integration/Continoius Deployment, a way of designing, creating, deploying and running applications with all advantages of cloud platform -> scalability, cost-effectiveness
compiled of dozens of smaller software/systems (microservices in containers(efficient af) on cloud servers working together)
advntgs: independet developing(e.g. different languages), testing, replacement, scaling, updating and deployment(different CPUs, servers ...) -> flexibility
loosley coupled systems resilient, manageable, and observable

Observability
"Systems" become more detached, capsuled and depend on other systems to work -> Microservices, Complexity, Containers, VMs
Understanding of a System without knowing inner workings, transparacy
More observable by produced/emitted data
determine health/functionality of infrastructure/application

Metrics
numeric measurment, timestamped and metadata of a service at runtime -> snapshot, indicators of availability and performance, e.g. used to alert or automaitcally trigger event (ressource usage, latency, number of users...)

Logs
timestamped text record (with optional metadata)  

Traces
provides insight to request from start to finish as it travels through multiple components of a distributed system/microservices
made up of spans
make it easier to understand root causes, locate bottlenecks

spans
record how long each part takes, with metadata
root span and child spans

openmetrics
standardizes and extends the prometheus exposition format
text-based format to expose metrics for monitoring and scraping, line based
human readable, easy to assemble and line by line parsable
first class wire format, independet of transport


opentelemetry
observability framwork and toolkit
generation, export, collection of telemetry data
open source, vendor-tool-agnostic
not observability backendw itseld (as prometheus is)
enables easy instrumentation of systems regardless of language, infrastructure or environment
backend and frontend are left to other tools
own your data, no vendor-lockin, single set of api and conventions for all systems

#pagebreak()