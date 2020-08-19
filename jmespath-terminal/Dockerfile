FROM python:3.8-alpine

LABEL io.whalebrew.name jpterm

ARG VERSION
RUN pip install jmespath-terminal==${VERSION}
ENTRYPOINT ["/usr/local/bin/jpterm"]
