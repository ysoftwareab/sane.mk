# syntax=docker/dockerfile:1

# ARG FROM=ubuntu:24.04
ARG FROM=ghcr.io/homebrew/ubuntu24.04:latest
FROM ${FROM}

ARG LABEL_ORG_OPENCONTAINERS_IMAGE_SOURCE="https://example.com/example/example.git"
LABEL org.opencontainers.image.source=${LABEL_ORG_OPENCONTAINERS_IMAGE_SOURCE}
ARG LABEL_ORG_OPENCONTAINERS_IMAGE_REVISION="0"
LABEL org.opencontainers.image.revision=${LABEL_ORG_OPENCONTAINERS_IMAGE_REVISION}
ARG LABEL_ORG_OPENCONTAINERS_IMAGE_CREATED="1970-01-01T00:00:00Z"
LABEL org.opencontainers.image.created=${LABEL_ORG_OPENCONTAINERS_IMAGE_CREATED}

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

USER root
RUN rm -rf /sane.mk
COPY --exclude=.git --exclude=Makefile.lazy . /sane.mk

RUN cp -Rp -L /sane.mk/Dockerfile.test.sh /Dockerfile.test.sh
# see https://www.camptocamp.com/en/news-events/flexible-docker-entrypoints-scripts
# see https://github.com/camptocamp/docker-git/blob/master/docker-entrypoint.sh
RUN cp -Rp -L /sane.mk/Dockerfile.entrypoint.sh /Dockerfile.entrypoint.sh
RUN cp -Rp -L /sane.mk/Dockerfile.entrypoint.d /Dockerfile.entrypoint.d
# ONBUILD COPY Dockerfile.entrypoint.d/* /Dockerfile.entrypoint.d/
# ONBUILD COPY docker-entrypoint.d/* /Dockerfile.entrypoint.d/ # ?! compat with camptocamp
ENTRYPOINT ["/Dockerfile.entrypoint.sh"]

# disable telemetry
ENV DO_NOT_TRACK=1
ENV DISABLE_TELEMETRY=1
ENV HOMEBREW_NO_ANALYTICS=1

# disable updates
ENV CLOUDSDK_COMPONENT_MANAGER_DISABLE_UPDATE_CHECK=1
ENV GH_NO_UPDATE_NOTIFIER=1
ENV HOMEBREW_NO_AUTO_UPDATE=1
ENV HOMEBREW_NO_ENV_HINTS=1
ENV HOMEBREW_NO_INSTALL_UPGRADE=1

RUN chown -R linuxbrew:linuxbrew /sane.mk /Dockerfile.*
USER linuxbrew
RUN \
  --mount=type=cache,target=/home/linuxbrew/.cache,uid=1000,gid=1000,sharing=locked \
  --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=cache,target=/var/log,sharing=locked \
  /sane.mk/Dockerfile.build.sh
RUN /sane.mk/Dockerfile.test.sh

CMD ["bash"]
