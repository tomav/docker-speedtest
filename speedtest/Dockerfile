FROM alpine:latest

RUN apk add --no-cache curl jq && curl https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-x86_64-linux.tgz | tar -xz  -C /usr/local/bin

COPY speedtest-startup.sh /usr/local/bin
RUN ["chmod", "+x", "/usr/local/bin/speedtest-startup.sh"]
COPY speedtest-measurement.sh /usr/local/bin
RUN ["chmod", "+x", "/usr/local/bin/speedtest-measurement.sh"]

WORKDIR /usr/local/bin

CMD ["speedtest-startup.sh"]
