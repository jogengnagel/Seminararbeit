#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

= Monitoring Tools Overview
neutral descriptions and technical details

== Prometheus
- Short: opensource Cloud-native metrics & alerting toolkit, Pull-based scraping of instrumented services/exporters, Big ecosystem, 
- architecture: single binary, local tsdb, federation&remote-write for high availability and long term storage, Push Gateway
- datamodel: metrics consist of name and labels (multi-dimensional time-series), exposition via http '/metrics' ednpoint, openmetrics data format, human readable
- query: PromQL (Rate/irate, Histogram-Support, Label‑Operations) highly efficient for real-time querys, felxible query
- integration: Grafana, Kubernetes (Service Discovery), Exporter, OTel
- strengths: easy start, strong community, small footprint (especially in client code)
- weaknesses: longtime retention and high availability needs additional components -> not full on solution but toolkit 
- scenarios: Kubernetes-Monitoring, Microservices, Realtime KPIs
- 

== InfluxDB
- Short: tsdb with high writing performance, Pull-based
- architecture: single node (os) or cluster (enterprise)
- datamodel: tags & fileds, line protocol, nanosecond timestamps
- query: flux or influxql
- integration: grafana-data-source, kapacitor(alertmanager)
- strengths: high-writing-performance, strong time-series-functionality, good horizontal scaling and ha/redundancy in enterprise, event logging
- scenarios: Telemetry, longtime metrics



== Graphite
- Short: Classic for Metric-TimeSeries, usually Push-based with fixed intervals
- architecture: carbon (receiver), whisper (storage), Grafana (UI), StatsD?
- datamodel: hierarchical dotted metric-names (instead of labels)
- query: Graphite-Functions (Aggregations, Transformations)
- integration: Grafana-Plugins, Carbon-Relays
- strengths: Easy Setup, proven
- weaknesses: limits on high cardinality, inflexible labeling thus less transparacy and flexibility, 
- scenarios: legacy-systems (clustered), simple metric-pipelines
Klassischer Ansatz, Limitierungen

passive tsdb, query language, graphing features
simple metrics, implicitly encoded dimensions, aggregated data over all instances (prometheus preserves instance data)

== VictoriaMetrics
- Short:
- architecture:
- datamodel:
- query:
- integration:
- strengths:
- weaknesses:
- scenarios:

Performance-Fokus, Kompatibilität mit Prometheus

#pagebreak()