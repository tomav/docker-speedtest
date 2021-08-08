# docker-speedtest-influxdb

This project uses `speedtest-cli` and `influxdb` to get, store and visualize data related to your internet connection speed. 

### Why another speedtest project?

* no grafana here, influxdb can provide powerful dashboards
* lightweight, speedtest image is around 11MB
* no loop function, uses `crond` instead for more flexibility

## Usage

### Docker

* copy `docker-compose-sample.yml` to `docker-compose.yml`
* edit `docker-compose.yml`, especially `ENV` variables
* edit speedtest/crontabs-root to fit your needs
* and then:

```
docker-compose up
```

### Influxdb UI

The provided dashboard assumes your bucket is named `monitoring`.
If this is the case, it should work out the box.

* from `Dashboard > Import`, select `infludb/dashboard/speedtest.json`
