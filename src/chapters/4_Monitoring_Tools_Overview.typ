#import "@preview/glossy:0.8.0": *
#import "../data.typ": *

= Monitoring Tools Overview

== Prometheus
Prometheus is a technology, that collects and stores time series data (metrics and labels)
Open source systems monitoring and alerting toolkit
scrape and store
popular in kubernetes based environments
built around multi-dimensional datamodel and time-series datdabase
pull-based model scrapes metrics from instrumented services/exporters (http)
highly efficient database for optimized for real-time queries (PromQL)
can generate alerts (notifications and actions)

data format (predeseccor of openmetrics) and software (scrape, store, query)
e.g. system endpoints produce prometheusdata and expose metrics at url
prometheus software or other (like grafana alloy) to scrape the data

Architektur, Stärken, Schwächen


== InfluxDB

Zeitreihenoptimierung, Flux-Query


== Graphite

Klassischer Ansatz, Limitierungen


VictoriaMetrics

Performance-Fokus, Kompatibilität mit Prometheus

#pagebreak()