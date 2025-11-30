#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

#import "/src/meta/terms.typ": *

= Basics

== Cloud-native Application
Continious Integration/Continoius Deployment, a way of designing, creating, deploying and running applications with all advantages of cloud platform -> scalability, cost-effectiveness
compiled of dozens of smaller software/systems (microservices in containers(efficient af) on cloud servers working together)
advntgs: independet developing(e.g. different languages), testing, replacement, on-demand scaling, updating and deployment(different CPUs, servers ...) -> flexibility
loosley coupled systems resilient, manageable, and observable

== Observability
"Systems" become more detached, capsuled and depend on other systems to work -> Microservices, Complexity, Containers, VMs, APIs,
shifht from basic monitoring to comprehensive observability, entails all telemetry uniefied
hollisitc Understanding of the internal state of a System (jhealth/performance) based on the data they emit/produce without knowing inner workings, transparacy
enables cloudbased advantages
More observable by produced/emitted data

== Metrics
numeric measurment, timestamped and metadata of a service at runtime -> snapshot, indicators of availability and performance, e.g. used to alert or automaitcally trigger event (ressource usage, latency, number of users...)

== Pull vs. Push
Push (UDP) 
temporary connections, a little bit more performant
anything can push to server
easy to have 1:n client server connection with exact replicated data
easy to model shortlived batch jobs, where pull based might loose some short lived metrics

Pull(Http)
reliability
Authenticity due to tcp
Known number of targets
Easy encription tls serverside
on demand data retrieving and debug cause of silence (network or client down?)

== Grafana
query, visualize, alert on, and explore your metrics, and more (not needed in this frame)

== Openmetrics
standardizes and extends the prometheus exposition format
text-based format to expose metrics for monitoring and scraping, line based
human readable, easy to assemble and line by line parsable
first class wire format, independet of transport


== Opentelemetry
observability framwork and toolkit (protocol?)
generation, export, collection of telemetry data
open source, vendor-tool-agnostic (neutral)
not observability backendw itseld (as prometheus is)
enables easy instrumentation of systems regardless of language, infrastructure or environment
backend and frontend are left to other tools
own your data, no vendor-lockin, single set of api and conventions for all systems
-> easy to integrate multiple data sources into single observability tool

#pagebreak()