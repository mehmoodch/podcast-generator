FROM ubuntu:latest
Run apt-get update && apt-get install -y \
python3.10 \
python3-pip \
git

Run pip3 install pyYAML
COPY feed.py /user/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
