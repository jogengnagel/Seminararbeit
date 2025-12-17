#import "@preview/glossy:0.8.0": *
#import "../data.typ": *
#import "/src/meta/terms.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: house, hexagon

#let leading = 1.5em
#let leading = leading - 0.75em // "Normalization"
#set block(spacing: leading)
#set par(spacing: leading)
#set par(leading: leading)


= introduction

Modern distributed systems rely on continuous telemetry to maintain reliability, performance, and cost control. As services scale across containers, orchestrators, and managed cloud components, the monitoring stack must ingest high‑cardinality metrics, retain useful history, expose expressive queries, and integrate seamlessly with alerting and visualization. In practice, metric collection and storage form the core of this stack, while dashboards and alerts provide the final operational interface for humans. This paper focuses on the metric layer, establishing a neutral, methodical comparison of widely used tools and assessing their suitability for cloud‑native workloads.

Organizations frequently face overlapping requirements: fast ingestion, long retention, multi‑dimensional queries, and cost‑aware scaling—that cannot be satisfied by a single component without architectural trade‑offs. The ecosystem has matured to separate concerns: collectors and time‑series stores on one side, composable visualization and alerting platforms on the other. To reflect this, visualization is covered as part of integration via Gragana rather than as a stand‑alone subject. This allows the paper to remain metric‑centric while still acknowledging how results are consumed.

Chapter 2 provides background on cloud‑native systems, monitoring and telemetry fundamentals, a layered monitoring architecture, and essential standards (OpenMetrics and OpenTelemetry), as well as a brief introduction to Grafana in the visualization and alerting layer. Chapter 3 defines the methodology of comparison: goal, scope, selection rationale, criteria, and valuation approach. Chapter 4 presents a tool overview along the agreed criteria for Prometheus, InfluxDB, Graphite, and VictoriaMetrics, using neutral language and technical detail. Chapter 5 applies the methodology with concrete values, tables, and a weighted score matrix, and discusses trade‑offs that emerge across architectures and workloads. Chapter 6 concludes with recommendations and an outlook on unified telemetry pipelines and evolving storage engines.

The contribution is a clear, reproducible basis for choosing metric tools in cloud‑native environments. By separating metric collection and storage from visualization, and by grounding the evaluation in explicit criteria and weights, the paper offers actionable guidance for teams designing observability architectures that scale, remain cost‑effective, and integrate cleanly with existing ecosystems.

#pagebreak()