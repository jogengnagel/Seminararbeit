#import "@preview/glossy:0.8.0": *
#import "../data.typ": *



= Methodology of Comparison

This chapter defines the framework for comparing metric collection tools, while considering visualization as part of the tools integration. It outlines the *goal*, *scope*, *context*, *selection rationale*, *comparison criteria*, and the *valuation approach*.

== Goal & Delimitation
*Goal:*  
To compare tools that focus on *metric collection* in cloud-native environments with emphasis on scalability, performance, and integration.

*Scope & Delimitation:*  
The comparison will mainly consider tools for *metric monitoring*. This allows a clear comparison of tools.
The primary focus will lay on metric collecting and storage tools, whereas visualization tools are not evaluated as standalone slutions, but considered for the tools integration capabilities. The tools will also be assessed for their compatibility with *logs*, *traces*, and *OpenTelemetry* standards. 
The comparison excludes fully integrated commercial observability platforms that are tailored to specific cloud-providers as they often create vendor-lockin. 
The emphasis will remain on flexible metric-centric solutions that build the foundation for complex cloud-monitoring.

== Tool Selection Rationale
The selected tools represent widely used metric collection and storage systems in both modern and established systems. They are mostly open-source and vary in architecure and integration-models making them suitable for comparative analysis:

- *Prometheus* – Cloud-native standard for metrics and alerting.
- *InfluxDB* – Time-series database with strong query capabilities.
- *Graphite* – Established metric storage system for legacy and simple setups.
- *VictoriaMetrics* – High-performance, Prometheus-compatible alternative.

== Comparison Criteria
The evaluation of the tools is based on the following dimensions:
The criteria are selected to reflect the *technical capabililties*, *operational complexity* and *ecosystem integration* of the tools ensuring a complete evaluation of their respective strengths and weaknesses.

*Architecture & Data Model*
The underlying architecture determines how metrics are ingested, stored, and queried.
Pull vs. Push models affect scalability and network overhead, Label-based vs. hierarchical models influence flexibility in metric organization and TSDB design impacts retention and query performance.

*Scalability & Performance*
Cloud-native environments often involve high cardinality and dynamic workloads. The Ability to handle millions of time-series data efficiently, scale horizontally and options to cluster for large deployments are often essential to ensure performance under high scrape rates and real-time requirements.

*Query Functionality*
Advanced queries with either *Real-time Streaming* or *Batch Processing* capabililties enable deep insights and custom dashboards.

*Integration*
Tools often need work together, integration with standarts like OpenTelemetry and visualization platforms like Grafana is critical for cloud-based monitoring solutions.

*Operation & Cost*
Operational overhead and licensing cost affect adoption of monitroing tools. It is important to maintain efficiency a small resource footprint. The complexity of setup and maintance aswell as the licensing-model are also a big cost factor.

*Use Case Scenarios*
Different tools excel in different contexts like microservices, legacy systems or hybrid environments.

== Valuation Approach
The evaluation combines *qualitative analysis* and a *weighted scoring model* to ensure transparacy and reproducability. 
The qualitative analysis contains a discussion of each tool's strengths, weaknesses and considerations of architectural trade-offs. 
The weighted scoring assigns each criterion a weight based on its importance in cloud-native monitoring (e.g., scalability > setup complexity). The tools are rated on a scale (0-5) per criterion. The weighted scores are aggregated into a decision matrix for visual comparison. 
This matrix higlights relative strenghts, identifies trade-offs and supports recommendations for different scenarios.

#pagebreak()
