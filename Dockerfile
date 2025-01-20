FROM prom/prometheus:latest

# Copy the Prometheus configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Expose the Prometheus server port
EXPOSE 9090

# Set the entrypoint command
USER root
ENTRYPOINT [ "/bin/prometheus" ]
CMD [ 
  "--config.file=/etc/prometheus/prometheus.yml", 
  "--storage.tsdb.path=/prometheus", 
  "--storage.tsdb.retention.time=365d", 
  "--web.console.libraries=/usr/share/prometheus/console_libraries", 
  "--web.console.templates=/usr/share/prometheus/consoles", 
  "--log.level=info" 
]

 
