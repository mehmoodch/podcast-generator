FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

RUN pip3 install pyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint.sh script is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]