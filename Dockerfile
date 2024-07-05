FROM ubuntu:latest

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-distutils \
    python3-dev \
    python3-pip \
    git \
    && apt-get clean

# Install pip for Python 3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Print python and pip version for debugging
RUN python3.10 --version && pip --version

# Upgrade pip to a specific version
RUN pip install --upgrade pip==21.1.3

# Install pyYAML
RUN pip install pyYAML

# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint.sh script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
