# Use a base image with Python
FROM python:3.10-slim

# Create a user, as Binder does not run as root
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Set working directory
WORKDIR ${HOME}

# Copy your local web files to the container
COPY . ${HOME}

# Ensure the user owns the files
RUN chown -R ${NB_UID} ${HOME}

# Switch to the non-root user
USER ${NB_USER}

# Expose the port (e.g., 8000)
EXPOSE 8000

# Command to run the web server
CMD ["python3", "-m", "http.server", "8000"]
