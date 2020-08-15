FROM python:3.8-alpine

ARG VERSION

LABEL io.whalebrew.config.environment '["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "AWS_SESSION_TOKEN"]'
LABEL io.whalebrew.config.working_dir '/home/custodian'
LABEL io.whalebrew.name c7n-org

RUN pip install c7n-org==${VERSION}

WORKDIR /home/custodian
ENTRYPOINT ["/usr/local/bin/c7n-org"]
