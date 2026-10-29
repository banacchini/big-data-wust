ARG BASE_IMAGE=alpine:3.20
FROM ${BASE_IMAGE}

ARG AUTHOR="Dominik"
ENV AUTHOR=${AUTHOR}
ENV GREETING="Siemson! Okejka! Ale tylko friendzona!"

RUN mkdir -p /app

ADD banner.txt /app/banner.txt
ADD entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/banner.txt"]