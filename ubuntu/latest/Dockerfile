FROM ubuntu:22.04

RUN apt update && apt install -y curl gzip git openssh-client rsync docker.io

ARG GITLAB_CI_LOCAL_VERSION

ENV BIN_PATH "/usr/local/bin"
ENV TMP_PATH "/tmp"

RUN curl -L https://github.com/firecow/gitlab-ci-local/releases/download/$GITLAB_CI_LOCAL_VERSION/linux.gz -o $TMP_PATH/gitlab-ci-local.gz

RUN gzip -df $TMP_PATH/gitlab-ci-local.gz && cp $TMP_PATH/gitlab-ci-local $BIN_PATH/gitlab-ci-local && chmod +x $BIN_PATH/gitlab-ci-local

WORKDIR /app

RUN git config --global --add safe.directory /app

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
