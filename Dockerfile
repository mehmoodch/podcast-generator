FROM ubuntu:noble

RUN apt-get update \
    && apt-get install -y python3-all-dev python3-dev python3-pip git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y python3.12-venv
# Print Python and pip versions for debugging
RUN python3.12 --version && pip3 --version

# Upgrade pip and setuptools in a virtual environment
RUN python3.12 -m venv /venv \
    && /venv/bin/pip install --upgrade pip setuptools

# Activate the virtual environment
ENV PATH="/venv/bin:$PATH"

# Install PyYAML
RUN pip install PyYAML

RUN python3.12 -m venv /venv \
    && /venv/bin/pip install --upgrade pip setuptools
# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint.sh script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
