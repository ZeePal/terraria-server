FROM alpine:3 AS base
RUN apk add unzip

ARG terraria_version=1423
ADD https://terraria.org/api/download/pc-dedicated-server/terraria-server-${terraria_version}.zip /tmp/server.zip

RUN unzip /tmp/server.zip "${terraria_version}/Linux/*" -d /tmp/extract && \
  mv /tmp/extract/${terraria_version}/Linux /tmp/server && \
  chmod +x /tmp/server/TerrariaServer.bin.x86_64



FROM ubuntu:20.04

EXPOSE 7777
VOLUME /root/.local/share/Terraria/Worlds

COPY --from=base /tmp/server/ /app/

ENTRYPOINT ["/app/TerrariaServer.bin.x86_64"]
