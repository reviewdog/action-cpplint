FROM python:3.8-alpine

RUN apk --no-cache --update add git \
    && rm -rf /var/cache/apk/*

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/
RUN pip install cpplint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]