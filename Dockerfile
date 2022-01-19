FROM collabora/code
RUN perl -pi -e "s/<seccomp (.*)>.*<\/seccomp>/<seccomp \1>false<\/seccomp>/" /etc/coolwsd/coolwsd.xml
