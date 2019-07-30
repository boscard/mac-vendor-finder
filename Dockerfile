FROM debian:stretch

RUN apt-get clean && apt-get update && apt-get install -y curl jq
COPY getMacVendor.sh /

ENTRYPOINT ["/getMacVendor.sh"]
