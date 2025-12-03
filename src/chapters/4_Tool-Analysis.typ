#import "@preview/glossy:0.8.0": *
#import "../data.typ": *
= Monitoring Tools Overview
neutral descriptions and technical details

== Prometheus
- Short: 
opensource Cloud-native metrics & alerting toolkit, Pull-based scraping of instrumented services/exporters, Big ecosystem, 
- architecture: 
single binary, local tsdb, federation&remote-write for high availability and long term storage, Push Gateway
- datamodel: 
metrics consist of name and labels (multi-dimensional time-series), exposition via http '/metrics' ednpoint, openmetrics data format, human readable
- scalability:

- performance:

- query: 
PromQL (Rate/irate, Histogram-Support, Label‑Operations) highly efficient for real-time querys, felxible query
- integration: 
Grafana, Kubernetes (Service Discovery), Exporter, OTel
- operation & cost: 
open source easy start, strong community, small footprint (???especially in client code)
- weaknesses: longtime retention and high availability needs additional components -> not full on solution but toolkit 
- scenarios: Kubernetes-Monitoring, Microservices, Realtime KPIs
- observability: 

*Characteristics*
- Text and line-based, easy to read
- independent of transport protocol
- Goal: interopoerability between monitoring systems

== InfluxDB
- Short: tsdb with high writing performance, Pull-based
- architecture: single node (os) or cluster (enterprise)
- datamodel: metrics with tags & fileds, line protocol, nanosecond timestamps
- scalability & performance: high-writing-performance, strong time-series-functionality, good horizontal scaling
- query: flux or influxql
- integration: grafana-data-source, kapacitor(alertmanager)
- Opereration & Cost: open-source standalone base with exte features ha/redundancy, clustering in enterprise open-core model
- Observability: 
- scenarios: Telemetry, longtime metrics



== Graphite
- Short: Classic for Metric-TimeSeries, usually Push-based with fixed intervals
- architecture: carbon (receiver), whisper (storage), Grafana (UI), StatsD?
- datamodel: hierarchical dotted metric-names (instead of labels)
- scalability: limits on high cardinality, inflexible labeling thus less transparacy and flexibility,
- performance:
- query: Graphite-Functions (Aggregations, Transformations)
- integration: Grafana-Plugins, Carbon-Relays
- operation: Easy Setup, proven
- cost:   
- observability:
- scenarios: legacy-systems (clustered), simple metric-pipelines
Klassischer Ansatz, Limitierungen

passive tsdb, query language, graphing features
simple metrics, implicitly encoded dimensions, aggregated data over all instances (prometheus preserves instance data)

== VictoriaMetrics
- Short:
- architecture:
- datamodel:
- scalability:
- performance:
- query:
- integration:
- operation:
- cost:
- observability:
- scenarios:

Performance-Fokus, Kompatibilität mit Prometheus

#pagebreak()