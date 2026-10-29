#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Użycie: $0 </path/to/Dockerfile>" >&2
  exit 1
fi

DOCKERFILE="$1"
if [ ! -f "$DOCKERFILE" ]; then
  echo "Błąd: nie znaleziono pliku $DOCKERFILE" >&2
  exit 1
fi

: "${DOCKERHUB_USER:?Ustaw zmienną DOCKERHUB_USER (login z Docker Hub)}"
IMAGE_NAME="${IMAGE_NAME:-ascii-banner}"
TAG="${TAG:-latest}"

IMAGE="${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}"
CONTEXT="$(dirname "$DOCKERFILE")"

echo ">> Building image ${IMAGE}"
docker build -f "$DOCKERFILE" -t "$IMAGE" "$CONTEXT"

echo ">> Wysyłanie obrazu ${IMAGE} do Docker Hub"
docker push "$IMAGE"

echo ">> Gotowe: https://hub.docker.com/r/${DOCKERHUB_USER}/${IMAGE_NAME}"