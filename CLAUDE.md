# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

MemShelf is an app for organizing saved messages by topic/time, with AI-assisted natural-language
retrieval. It's meant to replace Telegram's "Saved Messages" (which requires opening Telegram to
search, causing distraction), and will support importing saved messages from other apps.

## Current State

This repository is a fresh scaffold with no working code yet:

- `go.mod` declares module `github.com/nominanga/memshelf` (Go 1.26.4), no dependencies added.
- `services/core/` — intended location for the core service; `Dockerfile` and `migrations/` exist
  but are empty.
- `shared/` — intended location for code shared across services; currently empty.
- `deployment/docker/docker-compose.yml` — incomplete (only a stub `postgres` service entry).

There are no build, lint, or test commands yet because no Go source files, dependencies, or tooling
config exist. As real code and tooling land, this file should be updated with actual commands and
the architecture that emerges (service boundaries, data flow, how `shared/` is consumed by
`services/*`, etc.) rather than a predicted structure.
