FROM python:3.8-alpine
# styleguide cpplint not support python3
# FROM python:2.7-alpine

RUN apk --no-cache --update add git \
    && rm -rf /var/cache/apk/*

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/

# RUN	git clone https://github.com/google/styleguide.git cpplint \
# 	&& cp cpplint/cpplint/cpplint.py /usr/local/bin/cpplint.py \
# 	&& rm -rf cpplint
RUN pip install cpplint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]