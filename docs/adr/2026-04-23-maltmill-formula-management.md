---
title: Maltmill formula management
date: 2026-04-23
agent_model: GPT-5.4 (gpt-5.4)
status: accepted
---

# Context

The tap now maintains more than one formula. A custom shell generator was handling release metadata, asset names, binary names, and test behavior, but the update logic was becoming more complex as formula-specific exceptions increased.

# Decision

Use `maltmill` as the formula update engine for `Formula/*.rb`.

`maltmill -w Formula/*.rb` becomes the single update path invoked by `make update` and the scheduled GitHub Actions workflow.

# Consequences

- Formula version, URL, and checksum updates are delegated to `maltmill`.
- Formula-specific `install` and `test` blocks stay in the Ruby formula files.
- The update workflow must install `maltmill` before running `make update`.
- Local maintainers need `maltmill` installed when running `make update`.
