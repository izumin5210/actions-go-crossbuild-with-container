FROM alpine:3.10

COPY LICENSE README.md /

ENV GOXZ_VERSION v0.4.1

RUN apk add --update --no-cache --virtual .deps curl && \
   archive=goxz_${GOXZ_VERSION}_linux_amd64; \
   curl -sfL https://github.com/Songmu/goxz/releases/download/${GOXZ_VERSION}/${archive}.tar.gz | \
   tar xzf - && \
   cp ./${archive}/goxz /usr/local/bin/ && \
   rm -rf ./${archive} && \
   apk del .deps

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
