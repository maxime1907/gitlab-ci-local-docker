# gitlab-ci-local Docker Images repository

This repository defines the unofficial gitlab-ci-local docker image.

* [ubuntu](ubuntu/)

which are published to [ghcr.io](https://github.com/maxime1907/gitlab-ci-local-docker/pkgs/container/gitlab-ci-local).


__note__ - requires latest docker to be installed and available

## Using Images

### get docker image

```bash
docker pull ghcr.io/maxime1907/gitlab-ci-local:latest
```

### run docker image

```bash
docker run --rm \
	ghcr.io/maxime1907/gitlab-ci-local-docker:latest \
	--version
```

### run specific jobs
```bash
docker run --rm \
	-v $PWD:/app \
	-v $HOME/.ssh:/root/.ssh \
	-v /var/run/docker.sock:/var/run/docker.sock  \
	-v $(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
	ghcr.io/maxime1907/gitlab-ci-local-docker:latest \
	mysuperjob
```

### building docker image

```bash
export GITLAB_CI_LOCAL_VERSION="4.41.2"
docker build --build-arg GITLAB_CI_LOCAL_VERSION=$GITLAB_CI_LOCAL_VERSION -t gitlab-ci-local:$GITLAB_CI_LOCAL_VERSION ubuntu/latest
```
