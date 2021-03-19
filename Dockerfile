FROM collabora/code

USER 0

RUN line=$(grep -n 'perl -pi -e' /start-collabora-online.sh | cut -d : -f 1 | tail -n 1) && \
    (( line++ )) && \
    sed "$line i perl -pi -e \"s/<seccomp (.*)>.*<\\\\/seccomp>/<seccomp \\\\1>false<\\\\/seccomp>/\" /etc/loolwsd/loolwsd.xml" /start-collabora-online.sh

USER 104

EXPOSE 9980

CMD ["/bin/sh" "-c" "bash start-collabora-online.sh"]
