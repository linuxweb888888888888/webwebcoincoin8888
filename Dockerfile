# Start from a Jupyter base image
FROM phemextradebot/webweb8888

# Switch to root to install system dependencies if needed
USER root
# RUN apt-get update && apt-get install -y <package>

# Install Python packages
# RUN pip install --no-cache-dir <package>

# Set up user and home directory
ARG NB_USER=jovyan
ARG NB_UID=1000
RUN adduser --disabled-password --gecos "Default user" --uid ${NB_UID} ${NB_USER}
WORKDIR /home/${NB_USER}

# Copy repository contents
COPY . /home/${NB_USER}
RUN chown -R ${NB_UID} /home/${NB_USER}

# Switch back to the user
USER ${NB_USER}
