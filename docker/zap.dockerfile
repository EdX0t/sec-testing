FROM owasp/zap2docker-stable:latest

USER root

COPY docker/certs/cacert.pem /usr/local/share/ca-certificates/cacert.crt
RUN chmod 444 /usr/local/share/ca-certificates/cacert.crt \
    && update-ca-certificates

USER zap
