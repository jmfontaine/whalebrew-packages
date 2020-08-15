FROM python:3.8-alpine

ARG VERSION

LABEL io.whalebrew.config.environment '["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "AWS_SESSION_TOKEN"]'
LABEL io.whalebrew.config.working_dir '/home/custodian'
LABEL io.whalebrew.name custodian

RUN pip install c7n==${VERSION}

WORKDIR /home/custodian
ENTRYPOINT ["/usr/local/bin/custodian"]
