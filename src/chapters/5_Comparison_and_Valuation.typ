#import "@preview/glossy:0.8.0": *
#import "../data.typ": *




= Scoring & Decision Matrix

This chapter applies the criteria from Chapter 3 to the four tools using a *0–5* scale and a *weighted model*. Weights emphasize scalability in cloud‑native settings.

== Weights

We assign weights as follows: *Architecture & Data Model (0.20)*, *Scalability & Performance (0.25)*, *Query Functionality (0.15)*, *Integration (0.15)*, *Operation & Cost (0.15)*, *Use Cases (0.10)*. These reflect Prometheus‑ecosystem practice (scrape model and label cardinality), the prevalence of Grafana and Kubernetes integrations, and operational simplicity as adoption drivers. 

== Concrete Technical Facts (for traceability)

#table(
  columns: (22%, 19.5%, 19.5%, 19.5%, 19.5%),
  [Fact], [Prometheus], [InfluxDB], [Graphite], [VictoriaMetrics],
  [Ingestion model], [Pull (HTTP /metrics); Push via Push gateway / OTLP receiver (opt-in).], [Push (HTTP line protocol, agents e.g., Telegraf).], [Push to Carbon daemons (plaintext/pickle/AMQP).], [Pull via vmagent or receive Prometheus remote_write (push to storage).],
  [Data model], [Label-based time series in embedded TSDB.], [Measurements with *tags* (indexed) & *fields* (values).], [Hierarchical metric paths; optional tags.], [Prometheus compatible label model (PromQL/MetricsQL).],
  [Default/typical retention], [Time/size retention; default often ~15 days in common setups.], [Retention via buckets/policies; 3.x Core focuses on recent data.], [Fixed-size Whisper archives with roll‑ups.], [Configurable retention; suited for long‑term storage.],
  [Query language], [PromQL.], [InfluxQL/SQL (3.x); Flux available.], [Graphite functions (graphite web).], [PromQL + MetricsQL.],
  [Kubernetes/SD], [Native SD & relabeling.], [Via Telegraf/agents; no SD in DB.], [External agents; no SD.], [Works with Prometheus/vmagent; ecosystem SD.],
  [OTel/OTLP], [OTLP metrics receiver at `/api/v1/otlp/v1/metrics` (flag).], [Via Collector/bridges.], [Not a core focus.], [Ingests OTLP via parsers in components; Prometheus compatibility.],
  [License], [Apache‑2.0.], [MIT/Apache‑2.0 (Core); Enterprise licensed.], [Apache‑2.0.], [Apache‑2.0.],
)

== Scores per Criterion (0–5)

#table(
  columns: (28%, 12%, 12%, 12%, 12%, 12%, 12%),
  align: (left, center, center, center, center, center, center),
  [Criterion], [Weight], [Prometheus], [InfluxDB], [Graphite], [VictoriaMetrics], [Notes],
  [Architecture & Data Model], [0.20], [4.5], [4.0], [3.0], [4.5], [Pull + labels; tags/fields; hierarchical; Prom‑compatible labels. ],
  [Scalability & Performance], [0.25], [4.0], [4.0], [3.0], [4.5], [Prom: scales w/ federation & remote_write; InfluxDB 3 claims high ingest; Graphite needs relays; VM cluster scales horizontally.],
  [Query Functionality], [0.15], [4.5], [4.5], [3.0], [4.5], [PromQL; InfluxQL/SQL/Flux; Graphite functions; MetricsQL.],
  [Integration], [0.15], [5.0], [4.0], [3.5], [4.5], [Grafana + K8s SD + OTLP (Prom); broad Grafana support; VM fits Prom ecosystem.],
  [Operation & Cost], [0.15], [4.0], [3.5], [3.5], [4.0], [Single binary Apache‑2.0 (Prom/VM); Influx Core OSS + Enterprise; Graphite multi‑daemon ops.],
  [Use Cases], [0.10], [4.5], [4.0], [3.5], [4.5], [Cloud‑native monitoring vs. IoT/analytics vs. legacy/simple vs. long‑term Prom storage.],
)

== Weighted Totals

#table(
  columns: (28%, 18%, 18%, 18%, 18%),
  align: (left, right, right, right, right),
  [Tool], [Weighted Score], [Rank], [Focus], [Key Trade‑off],
  [VictoriaMetrics], [4.43], [1], [Prometheus compatible long‑term TSDB], [Excellent scale/efficiency; cluster adds roles to operate.],
  [Prometheus], [4.38], [2], [Cloud‑native scrape + alerting], [Superb ecosystem; long‑term retention needs external storage.],
  [InfluxDB], [4.00], [3], [General purpose TSDB + transformations], [Strong query power; 3.x Core vs Enterprise split for HA/history.],
  [Graphite], [3.20], [4], [Simple push + fixed storage], [Predictable Whisper; less suited to high cardinality/dynamic SD.],
)

== Discussion of Trade‑offs

Prometheus offers the *strongest integration* (Grafana, Kubernetes, OTLP) and a mature *query language*, making it ideal as the *acquisition tool*. However, *cardinality growth* and *long retention* motivate remote storage or federation, which adds components.@grafana @prometheus 

InfluxDB brings *rich transformations* and a *flexible schema*, and later versions emphasizes *speed and cardinality claims* for recent data. The choice between *Core* and *Enterprise/Cloud* introduces an architectural decision point for HA and historical depth.@influx2 

Graphite remains *operationally predictable* with *fixed‑size Whisper* and simple push ingestion, but hierarchical metrics and carbon topology make it *less adaptive* to highly dynamic, label‑rich microservices.@source16 @source17 

VictoriaMetrics aligns tightly with the Prometheus ecosystem, delivering *cost‑efficient long‑term storage* and *horizontal scale* with *PromQL/MetricsQL* compatibility. The cluster’s *role separation* simplifies scaling but introduces *multi‑service operations* compared to single‑node setups.@source20 
 

#pagebreak()
