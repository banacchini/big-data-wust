#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 </path/to/Dockerfile>" >&2
  exit 1
fi

DOCKERFILE="$1"
if [ ! -f "$DOCKERFILE" ]; then
  echo "Error: file $DOCKERFILE not found" >&2
  exit 1
fi

: "${DOCKERHUB_USER:?Set the DOCKERHUB_USER variable (login to Docker Hub)}"
IMAGE_NAME="${IMAGE_NAME:-ascii-banner}"
TAG="${TAG:-latest}"

IMAGE="${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}"
CONTEXT="$(dirname "$DOCKERFILE")"

echo ">> Building image ${IMAGE}"
docker build -f "$DOCKERFILE" -t "$IMAGE" "$CONTEXT"

echo ">> Pushing image ${IMAGE} to Docker Hub"
docker push "$IMAGE"

echo ">> Done: https://hub.docker.com/r/${DOCKERHUB_USER}/${IMAGE_NAME}"