FROM python:3.10-alpine

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache --update add git \
    && rm -rf /var/cache/apk/*

# install reviewdog
ENV REVIEWDOG_VERSION=v0.13.0
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# install cpplint
RUN pip install cpplint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
