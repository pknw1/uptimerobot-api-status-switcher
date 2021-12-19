FROM alpine
RUN apk update && apk add curl bash
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/entrypoint.sh"]

