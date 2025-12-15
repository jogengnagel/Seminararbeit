#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

= Monitoring Tools Overview

This chapter describes four widely used metric collection and storage tools—Prometheus, InfluxDB, Graphite, and VictoriaMetrics—across uniform criteria to enable a neutral, technically grounded comparison.

== Prometheus

=== Architecture & Data Model
Prometheus runs as a single server that *pulls* metrics from targets, stores them in an embedded *TSDB*, and exposes them via *PromQL* and an HTTP API; its data model is *label-based* (multi‑dimensional). [1](https://devopscube.com/prometheus-architecture/)[2](https://prometheus.io/docs/prometheus/latest/querying/basics/)

=== Scalability & Performance
A single Prometheus instance can handle *tens of millions of active series* with appropriate resources, but long‑term storage and very high cardinality typically rely on *federation* or *remote_write* to external backends; default retention is *15 days* (time or size based). [3](https://prometheus.io/docs/introduction/faq/)[1](https://devopscube.com/prometheus-architecture/)
Prometheus implements a tunable *remote_write* pipeline (e.g., default `capacity: 10000`, `max_samples_per_send: 2000`) and documents memory/CPU implications as volume grows. [4](https://prometheus.io/docs/practices/remote_write/)

=== Query Functionality
*PromQL* is a functional query language supporting instant and range queries, aggregations, and native histograms in recent releases. [2](https://prometheus.io/docs/prometheus/latest/querying/basics/)

=== Integration
Prometheus integrates natively with *Kubernetes service discovery*, has first‑class support in *Grafana*, and since v3 can accept *OTLP metrics* over HTTP at `/api/v1/otlp/v1/metrics` when enabled. [5](https://grafana.com/docs/grafana/latest/datasources/)[6](https://prometheus.io/docs/guides/opentelemetry/)

=== Operation & Cost
The server is a *single static binary* under the *Apache‑2.0* license; high availability is achieved by running *two or more identical servers* with Alertmanager deduplication. [3](https://prometheus.io/docs/introduction/faq/)[7](https://github.com/prometheus/prometheus/blob/main/LICENSE)

=== Use Cases
Prometheus excels as a *cloud‑native metrics and alerting toolkit* for clusters and microservices, and as a *scrape engine* feeding long‑term stores via remote_write. [3](https://prometheus.io/docs/introduction/faq/)

== InfluxDB

=== Architecture & Data Model
InfluxDB models measurements with *tags* (indexed dimensions) and *fields* (values) written in *line protocol*; InfluxDB 3 introduces a *columnar engine* with *Parquet/Arrow/DataFusion* and a focus on recent‑data speed in the open‑source Core. [8](https://github.com/influxdata/flux/blob/master/docs/new_flux_ideas_and_guide.md)[9](https://www.influxdata.com/products/influxdb-core/)

=== Scalability & Performance
InfluxDB 3 Core targets *high‑speed ingest and sub‑10 ms last‑value queries* for recent data with claims of *“unlimited cardinality”*; clustering, HA, and historical querying depth are provided in *InfluxDB 3 Enterprise/Cloud*. [9](https://www.influxdata.com/products/influxdb-core/)[10](https://gilbane.com/2025/04/influxdata-releases-influxdb-3-core-and-influxdb-3-enterprise/)
Earlier guidance emphasizes *cardinality management* because each unique tag set creates a series indexed in memory. [11](https://docs.influxdata.com/influxdb/v2/write-data/best-practices/resolve-high-cardinality/)

=== Query Functionality
InfluxDB supports *InfluxQL* and *SQL* in 3.x, while *Flux* remains available (in maintenance) and powerful for transformation. [9](https://www.influxdata.com/products/influxdb-core/)[12](https://docs.influxdata.com/flux/v0/)[13](https://www.influxdata.com/blog/the-plan-for-influxdb-3-0-open-source/)

=== Integration
Grafana offers first‑class *InfluxDB data sources*; *Telegraf* agents cover a wide range of inputs; OpenTelemetry integration is typically via the Collector or bridge components. [5](https://grafana.com/docs/grafana/latest/datasources/)

=== Operation & Cost
InfluxDB 3 Core is open source under *MIT/Apache‑2.0 dual license*; *Enterprise* adds licensed features for HA, security, and scale. [9](https://www.influxdata.com/products/influxdb-core/)[14](https://github.com/influxdata/influxdb/blob/main/LICENSE-APACHE)

=== Use Cases
InfluxDB is a fit for *IoT, sensor analytics, and real‑time analytics* where flexible schema and powerful transformations are required. [9](https://www.influxdata.com/products/influxdb-core/)

== Graphite

=== Architecture & Data Model
Graphite consists of *Carbon* daemons ingesting metrics (push), *Whisper* as a fixed‑size on‑disk time‑series store, and *graphite‑web* for rendering; the data model is typically *hierarchical metric paths* rather than labels. [15](https://graphiteapp.org/)[16](https://graphite.readthedocs.io/en/latest/whisper.html)

=== Scalability & Performance
Whisper uses *pre‑allocated archives* with roll‑ups; scaling commonly employs *carbon‑relay* sharding/replication and multiple caches, which works well for steady, moderate loads but is less suitable for very high cardinality. [16](https://graphite.readthedocs.io/en/latest/whisper.html)[17](https://s905060.gitbooks.io/site-reliability-engineer-handbook/content/graphite.html)

=== Query Functionality
Graphite‑web provides numerous *functions* (aggregation, transform) but lacks PromQL’s dimensional selectors; tagging exists but is not as pervasive as label models. [18](https://buildmedia.readthedocs.org/media/pdf/graphite/latest/graphite.pdf)

=== Integration
Grafana has long‑standing *Graphite support*; exporters and logics exist broadly, but native *Kubernetes SD* and OTLP are not core Graphite concerns. [5](https://grafana.com/docs/grafana/latest/datasources/)

=== Operation & Cost
Graphite and Whisper are *Apache‑2.0* open source; operations involve managing *multiple daemons* and disk layouts tuned via storage schemas and aggregation rules. [19](https://github.com/graphite-project/whisper)

=== Use Cases
Graphite remains relevant for *legacy and simple monitoring setups* needing straightforward push ingestion and predictable disk usage. [15](https://graphiteapp.org/)

== VictoriaMetrics

=== Architecture & Data Model
VictoriaMetrics offers a *single‑binary TSDB* and a *cluster* edition with *vmstorage/vminsert/vmselect* in a shared‑nothing design; it is *Prometheus‑compatible* for remote_write and querying, and extends PromQL with *MetricsQL*. [20](https://docs.victoriametrics.com/victoriametrics/cluster-victoriametrics/)[21](https://github.com/VictoriaMetrics/VictoriaMetrics)

=== Scalability & Performance
The project positions single‑node for throughputs *below ~1 M samples/s* and the cluster for horizontal scale; community benchmarks target *high‑ingestion and query performance* on Prometheus‑style workloads. [20](https://docs.victoriametrics.com/victoriametrics/cluster-victoriametrics/)[22](https://github.com/VictoriaMetrics/prometheus-benchmark)

=== Query Functionality
VictoriaMetrics supports *PromQL* semantics and *MetricsQL* extensions, enabling drop‑in use with existing dashboards and rules. [21](https://github.com/VictoriaMetrics/VictoriaMetrics)

=== Integration
Grafana works out‑of‑the‑box; Prometheus *remote_write* and Kubernetes use cases are first‑class, making VM a common *long‑term storage* for Prometheus. [21](https://github.com/VictoriaMetrics/VictoriaMetrics)

=== Operation & Cost
Distributed as a *single static binary* under *Apache‑2.0*, VM is recognized for lower resource footprint and simple ops compared to multi‑component stacks; the cluster adds independent scaling of roles. [21](https://github.com/VictoriaMetrics/VictoriaMetrics)[20](https://docs.victoriametrics.com/victoriametrics/cluster-victoriametrics/)

=== Use Cases
VictoriaMetrics is a strong choice for *long‑retention, high‑cardinality, or cost‑sensitive* Prometheus environments needing scalable storage. [20](https://docs.victoriametrics.com/victoriametrics/cluster-victoriametrics/)

#pagebreak()