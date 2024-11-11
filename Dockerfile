FROM collabora/code:24.04.9.2.1 as code

FROM perl:stable-slim AS builder
COPY --from=code /etc/coolwsd/coolwsd.xml /tmp/coolwsd.xml
RUN perl -pi -e "s/<seccomp (.*)>.*<\/seccomp>/<seccomp \1>false<\/seccomp>/" /tmp/coolwsd.xml

FROM code
COPY --from=builder /tmp/coolwsd.xml /etc/coolwsd/coolwsd.xml
