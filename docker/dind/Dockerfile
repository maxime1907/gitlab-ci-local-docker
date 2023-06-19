FROM docker:24.0.2-dind

RUN apk add gcompat libstdc++ libgcc curl gzip git openssh-client rsync bash

ARG GITLAB_CI_LOCAL_VERSION

ENV BIN_PATH "/usr/local/bin"
ENV TMP_PATH "/tmp"

RUN curl -L https://github.com/firecow/gitlab-ci-local/releases/download/$GITLAB_CI_LOCAL_VERSION/linux.gz -o $TMP_PATH/gitlab-ci-local.gz

RUN gzip -df $TMP_PATH/gitlab-ci-local.gz && cp $TMP_PATH/gitlab-ci-local $BIN_PATH/gitlab-ci-local && chmod +x $BIN_PATH/gitlab-ci-local

RUN git config --global --add safe.directory /app

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/entrypoint.sh" ]
