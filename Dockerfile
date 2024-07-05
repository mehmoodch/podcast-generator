FROM ubuntu:latest

# Update package lists
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git 

# Install pyYAML
RUN pip3 install PyYAML
# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
