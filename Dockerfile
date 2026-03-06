# Use a base image compatible with Binder, e.g., Jupyter base-notebook
FROM jupyter/base-notebook:latest

# Switch to root to install packages and configure SSH
USER root

# Install SSH server and other necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Set up SSH configuration (allow root login, set a password)
RUN mkdir /var/run/sshd
RUN echo 'root:mybinder' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose port 22 for SSH
EXPOSE 22

# Start SSH service in the background (can be added to a startup script)
# For Binder, usually a user-level process manager is needed
# Instead of overwriting CMD, you might need to use a notebook extension
# or entrypoint script to start SSHD.

# Revert to default jovyan user
USER ${NB_USER}
