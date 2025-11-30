#import "@preview/glossy:0.8.0": *
#import "../data.typ": *


= Methodology of Comparison
defining criteria, weighting and valiation approach

== Goal & Delimitation, What am I comparing and not?
Goal: Comparison of tools for metric collection and visualization in cloudbased applications
Delimitation: Only metrics, not other telemtry like traces, logs, 

== Opentelemetry as Context, Instrumenting, not Main Part
observability framwork and toolkit (protocol?)
generation, export, collection of telemetry data
open source, vendor-tool-agnostic (neutral)
not observability backendw itseld (as prometheus is)
enables easy instrumentation of systems regardless of language, infrastructure or environment
backend and frontend are left to other tools
own your data, no vendor-lockin, single set of api and conventions for all systems
-> easy to integrate multiple data sources into single observability tool

== Why did I choose these tools?

== Criteria
strengths/weaknesses
datamodel & architecture (pull push, labels tags, tsdb cluster)
scalability & performance (cardinality, retention, HA) speed, realtime, scrape-rate, longevity of data
query-functionality (Flux, PromQL, Graphite Functions, VM-Compatability)
integration (grafana, kubernetes, OTel/OTLP, Exporter/Collector)
operation & cost (ressorces, os, licensing, cloud/on-prem, )
setup complexity

== Valuation approach
How and why do I value each criteria,  
qualtiative analysid of each tool
weighted Matrix


#pagebreak()
