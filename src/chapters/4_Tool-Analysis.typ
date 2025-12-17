#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

= Monitoring Tools Overview

This chapter describes four widely used metric collection and storage tools—Prometheus, InfluxDB, Graphite, and VictoriaMetrics—across uniform criteria to enable a neutral, technically grounded comparison.

== Prometheus

=== Architecture & Data Model
Prometheus can be run as a single server that *scrapes* metrics from clients via the pull-model, stores them in a *TSDB*, and exposes them via *PromQL* and an HTTP API. It uses the *label-based* *OpenMetrics* data format.@prometheus

=== Scalability & Performance
A single Prometheus instance is able to handle tens of millions of active series efficiently .To achieve long‑term storage and higher cardinality prometheus supports *federation* by using multiple prometheus instances or *remote-write* to external backends. Retention is set to *15 days* by default or can be based on the systems storage-size. 
@remote-write @prometheus

=== Query Functionality
*PromQL* is a functional query language that supports instant queries (e.g., for live monitoring) and range queries (e.g., for analyzing), aggregations, and native histograms. @prometheus

=== Integration
Prometheus integrates with *Kubernetes service discovery* natively, has first‑class support with *Grafana*. Its also able to accept metrics of the *OpenTelemetry* protocol over HTTP at `/api/v1/otlp/v1/metrics` when enabled. @prometheus @grafana

=== Operation & Cost
Prometheus is easy to set up, has a big ecosystem and a strong community supporting it. The server is a *single static binary* with a very small footprint under the *Apache‑2.0* license. It achieves high availability (HA) by running *two or more identical servers* with Alertmanager deduplication. @prometheus @license

=== Use Cases
Prometheus is very good as a *cloud‑native metrics and alerting toolkit* for clusters and microservices, especially in a Kubernetes environment. Its also used as a *scrape engine* feeding long‑term stores via remote-write. @prometheus

== InfluxDB

=== Architecture & Data Model
InfluxDB metrics consist of *tags* (indexed dimensions) and *fields* (values) that are written in *line protocol*, a text-based format. InfluxDB 3 also introduces a *columnar engine* with *Parquet/Arrow/DataFusion* and a focus on recent‑data speed in the open‑source Core. This allows for high performance in exponentially growing systems with very high cardinality. @influx1 @influx2

=== Scalability & Performance
InfluxDB 3 Core goes for *high‑speed ingest and sub‑10 ms last‑value queries* for recent data claiming *“unlimited cardinality”*. Clustering, high-availability, and historical querying depth are only provided in *InfluxDB 3 Enterprise/Cloud*. @influx2 @influx3
In earlier versions *cardinality management* is emphasized because each unique tag creates a new series indexed in memory. @influx4

=== Query Functionality
InfluxDB supports *InfluxQL* and *SQL* in the newer versions. *Flux* remains available for transformation. @influx2 @influx5 @influx6

=== Integration
Grafana offers first‑class *InfluxDB data sources*; *Telegraf* agents cover a wide range of inputs; OpenTelemetry integration is typically via the Collector or bridge components. @grafana
InfluxDB is usually co

=== Operation & Cost
InfluxDB 3 Core is open source under *MIT/Apache‑2.0 dual license*; *Enterprise* adds licensed features for HA, security, and scale. @influx2 @influx7

=== Use Cases
InfluxDB is a fit for *IoT, sensor analytics, and real‑time analytics* where flexible schema and powerful transformations are required. @influx2

== Graphite

=== Architecture & Data Model
Graphite consists of *Carbon* daemons ingesting metrics (push), *Whisper* as a fixed‑size on‑disk time‑series store, and *graphite‑web* for rendering; the data model is typically *hierarchical metric paths* rather than labels. @source15

=== Scalability & Performance
Whisper uses *pre‑allocated archives* with roll‑ups; scaling commonly employs *carbon‑relay* sharding/replication and multiple caches, which works well for steady, moderate loads but is less suitable for very high cardinality. @source17 @source16

=== Query Functionality
Graphite‑web provides numerous *functions* (aggregation, transform) but lacks PromQL’s dimensional selectors; tagging exists but is not as pervasive as label models. @source18

=== Integration
Grafana has long‑standing *Graphite support*; exporters and logics exist broadly, but native *Kubernetes SD* and OTLP are not core Graphite concerns. 
@grafana

=== Operation & Cost
Graphite and Whisper are *Apache‑2.0* open source; operations involve managing *multiple daemons* and disk layouts tuned via storage schemas and aggregation rules. @source19

=== Use Cases
Graphite remains relevant for *legacy and simple monitoring setups* needing straightforward push ingestion and predictable disk usage. @source15

== VictoriaMetrics

=== Architecture & Data Model
VictoriaMetrics offers a *single‑binary TSDB* and a *cluster* edition with *vmstorage/vminsert/vmselect* in a shared‑nothing design; it is *Prometheus‑compatible* for remote-write and querying and extends PromQL with *MetricsQL*. @source20 @source21

=== Scalability & Performance
The project positions single‑node for throughputs *below ~1 M samples/s* and the cluster for horizontal scale; community benchmarks target *high‑ingestion and query performance* on Prometheus‑style workloads. @source20 @source22

=== Query Functionality
VictoriaMetrics supports *PromQL* semantics and *MetricsQL* extensions, enabling drop‑in use with existing dashboards and rules. @source21

=== Integration
Grafana works out‑of‑the‑box; Prometheus *remote-write* and Kubernetes use cases are first‑class, making VM a common *long‑term storage* for Prometheus. @source21

=== Operation & Cost
Distributed as a *single static binary* under *Apache‑2.0*, VM is recognized for lower resource footprint and simple ops compared to multi‑component stacks; the cluster adds independent scaling of roles. @source20 @source21

=== Use Cases
VictoriaMetrics is a strong choice for *long‑retention, high‑cardinality, or cost‑sensitive* Prometheus environments needing scalable storage. @source20

#pagebreak()