FROM python:alpine

ARG AWS_VERSION=1.16.140
ARG EB_VERSION=3.15.0

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$AWS_VERSION awsebcli==$EB_VERSION

WORKDIR /app

CMD [sh]
