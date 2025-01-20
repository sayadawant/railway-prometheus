FROM prom/prometheus:latest
USER root
RUN apk add --no-cache gettext
COPY prometheus.yml.template /etc/prometheus/prometheus.yml.template
EXPOSE 9090
ENTRYPOINT ["/bin/sh", "-c"]
CMD envsubst < /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml && \
    /bin/prometheus \
      --config.file=/etc/prometheus/prometheus.yml \
      --storage.tsdb.path=/prometheus \
      --storage.tsdb.retention.time=365d \
      --web.console.libraries=/usr/share/prometheus/console_libraries \
      --web.console.templates=/usr/share/prometheus/consoles \
      --log.level=info
