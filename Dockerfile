# syntax = docker/dockerfile:1

FROM oven/bun:1.0.0 as base

ARG PORT=3000

ENV NODE_ENV=production

WORKDIR /src

# Build
FROM base as build

COPY --link package.json bun.lockb .
RUN bun install

COPY --link . .

RUN bun run build
