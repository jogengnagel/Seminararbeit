#import "@preview/glossy:0.8.0": *
#import "../data.typ": *



= Methodology of Comparison

This chapter defines the framework for comparing metric collection and visualization tools for cloud-based applications. It outlines the *goal*, *scope*, *context*, *selection rationale*, *comparison criteria*, and the *valuation approach*.

== Goal & Delimitation
*Goal:*  
To compare tools that focus on *metric collection and visualization* in cloud-native environments, with emphasis on scalability, performance, and integration.

*Delimitation:*  
- The comparison will mainly consider tools for *metric monitoring*, allowing a clear comparison of tools.
- For a possible integration into observability platforms, tools will be examined for their support of *logs* and *traces* or their compatability with the *OpenTelemetry* standart 
- Visualization tools (e.g., Grafana) are included only as part of integration aspects, not as standalone comparison subjects.

== Why These Tools?
TODO: Toolcontext
Many Different Monitoring Solutuions for different Scenarios.
Fully commercial products tailored to specific cloud providers, flexible open source tools vendor-agnostic compatibility.
The selected tools represent widely used solutions for metric collection and storage:
- *Prometheus* – Cloud-native standard for metrics and alerting.
- *InfluxDB* – Specialized time-series database with strong query capabilities.
- *Graphite* – Classic metric storage system, still relevant for legacy and simple setups.
- *VictoriaMetrics* – High-performance, Prometheus-compatible alternative.

These tools differ in *architecture*, *data model*, and *integration capabilities*, making them suitable for comparative analysis.

== Comparison Criteria
The following criteria are used to evaluate each tool:
Why?
- *Architecture & Data Model*  
  (Pull vs. Push, label-based vs. hierarchical, TSDB vs. cluster design)
- *Scalability & Performance*  
  (Cardinality handling, retention, high availability, scrape rate, real-time capability)
- *Query Functionality*  
  (PromQL, Flux, Graphite functions, compatibility with Prometheus ecosystem)
- *Integration*  
  (Grafana support, Kubernetes, OpenTelemetry/OTLP, exporters and collectors)
- *Operation & Cost*  
  (Resource footprint, setup complexity, licensing, cloud/on-prem options)
- *Setup Complexity*  
  (Ease of deployment, configuration overhead)
- *Support for Observability Extensions*
  (Logs, Traces, Spans)
- *Scenarios*
  (systems)

== Valuation Approach
The evaluation combines *qualitative analysis* and a *weighted scoring model*:
- Tools are rated on a *scale (e.g., 0–5)* per criterion.
- Weighted scores are aggregated into a *decision matrix*.
- Results are discussed in terms of *strengths, weaknesses, and trade-offs*.


#pagebreak()
