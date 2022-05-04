FROM alpine:latest

RUN apk --no-cache add \
  dovecot \
  dovecot-lmtpd \
  dovecot-submissiond

RUN addgroup -g 888  -S vmail \
  && adduser -h /dev/null -s /sbin/nologin -g "" -G vmail -u 888 -S vmail \
  && mkdir /var/local/vmail \
  && chown vmail:vmail /var/local/vmail

EXPOSE 24
EXPOSE 587
EXPOSE 993

CMD ["sh", "-c", "/usr/sbin/dovecot -F"]
