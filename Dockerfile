FROM prom/prometheus
# copy the Prometheus configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml
# expose the Prometheus server port
EXPOSE 9090
# set the entrypoint command
USER root
ENTRYPOINT [ "/bin/prometheus" ]
CMD /bin/sh -c "sed -i 's/\${GRAFANA_PASS}/$GRAFANA_PASS/' /etc/prometheus/prometheus.yml && \
    exec /bin/prometheus --config.file=/etc/prometheus/prometheus.yml \
                       --storage.tsdb.path=/prometheus \
                       --storage.tsdb.retention.time=365d \
                       --web.console.libraries=/usr/share/prometheus/console_libraries \
                       --web.console.templates=/usr/share/prometheus/consoles \
                       --log.level=info"
