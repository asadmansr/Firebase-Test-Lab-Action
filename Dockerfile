FROM google/cloud-sdk:283.0.0-alpine

RUN apk update && apk add --no-cache jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]