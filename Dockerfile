FROM python:3.6-alpine
ENV ELASTALERT_VERSION="v0.2.1"
RUN \
 apk add --no-cache ca-certificates musl libffi libmagic && \
 apk add --no-cache --virtual .build-deps musl-dev libffi-dev gcc && \
 pip install elastalert==$ELASTALERT_VERSION && \
 apk --purge del .build-deps
ENTRYPOINT [ "elastalert" ]