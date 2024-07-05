FROM ubuntu:latest

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean

# Ensure python3 and pip3 are correctly linked to python3.10
RUN ln -s /usr/bin/python3.10 /usr/bin/python3 && ln -s /usr/bin/pip3 /usr/bin/pip

# Print python and pip version for debugging
RUN python3 --version && pip3 --version

# Upgrade pip to a specific version
RUN pip3 install --upgrade pip==21.1.3

# Install pyYAML
RUN pip3 install pyYAML

# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint.sh script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]