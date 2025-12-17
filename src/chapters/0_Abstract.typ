#import "@preview/glossy:0.8.0": *
#import "../data.typ": *
#import "/src/meta/terms.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: house, hexagon

#show "raytracing": [@rt[raytracing]]


= Abstract

Cloud‑native applications generate vast, rapidly changing telemetry that must be collected, stored, queried, and surfaced to operators with predictable cost and reliability. This paper compares four metric‑centric tools—Prometheus, InfluxDB, Graphite, and VictoriaMetrics—under a common framework that emphasizes ingestion model, data model, scalability, query capabilities, ecosystem integration, operational effort, and typical use cases. Visualization is treated as an integration layer rather than a primary comparison domain. Grafana serves as the representative front end for dashboards and alerting where relevant. The study proceeds with background concepts (Chapter 2) and a methodology of comparison (Chapter 3), then offers neutral, technical descriptions of the tools (Chapter 4) and a weighted decision matrix with concrete values and scores (Chapter 5). The analysis highlights strengths, weaknesses, and trade‑offs in cloud‑native environments, guiding practitioners toward reference architectures that separate metric collection from long‑term storage and visualization. The conclusion summarizes the comparative outcomes and outline future directions for unified telemetry via OpenMetrics and OpenTelemetry.


#pagebreak()