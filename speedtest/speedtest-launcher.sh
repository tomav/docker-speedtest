#!/bin/sh

SPEEDTEST_PARAMS="--accept-license --accept-gdpr"

DATA=$(speedtest $SPEEDTEST_PARAMS --server-id=$SPEEDTEST_SERVER -f json)
TYPE=$(echo $DATA | jq '.type')
echo $DATA
echo $TYPE

case "$TYPE" in
    *"result"*)
		echo "> Got reply, let's push it to InfluxDB @ $SPEEDTEST_DB_URL"
		DOWNLOAD=$(echo $DATA | jq '.download.bandwidth')
		UPLOAD=$(echo $DATA | jq '.upload.bandwidth')
		PING=$(echo $DATA | jq '.ping.latency')
		JITTER=$(echo $DATA | jq '.ping.jitter')
		SERVER=$SPEEDTEST_SERVER
		ISP=$(echo $DATA | jq '.isp')
		EXTERNAL_IP=$(echo $DATA | jq '.interface.externalIp')
		curl -s --request POST "$SPEEDTEST_DB_URL/api/v2/write?org=$SPEEDTEST_DB_ORG&bucket=$SPEEDTEST_DB_BUCKET&precision=s" \
			--header "Authorization: Token $SPEEDTEST_DB_TOKEN" \
			--data-binary "speedtest,host=$SPEEDTEST_HOST download=$DOWNLOAD,upload=$UPLOAD,jitter=$JITTER,ping=$PING,server=$SERVER,isp=$ISP,external_ip=$EXTERNAL_IP"
		echo "> Done."
		;;
    *"log"*)
		echo "> Error:"
		echo $DATA
		;;
    *)
		echo "> Unknown error..."
		echo $DATA
		;;
esac