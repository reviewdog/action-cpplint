FROM python:3.13-alpine

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk --no-cache --update add git \
    && rm -rf /var/cache/apk/*

# install reviewdog
ENV REVIEWDOG_VERSION=v0.20.3
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# install cpplint
RUN pip install cpplint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
