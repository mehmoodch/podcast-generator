from ubuntu: latest
run apt-get update && apt-get install -y \
python3.10 \
python3-pip \
git

Run pip3 install pyYAML
copy feed.py /user/bin/feed.py
copy entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
