FROM alpine:latest

RUN apk add --no-cache curl jq && curl https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-x86_64-linux.tgz | tar -xz  -C /usr/local/bin

COPY speedtest-launcher.sh /usr/local/bin
RUN ["chmod", "+x", "/usr/local/bin/speedtest-launcher.sh"]

WORKDIR /usr/local/bin

CMD ["crond", "-f", "-l", "2"]