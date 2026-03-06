# Use a base image, e.g., Ubuntu or Alpine
FROM ubuntu:22.04

# Install necessary packages (SSH and ttyd for web terminal)
RUN apt-get update && apt-get install -y \
    openssh-server \
    ttyd \
    && rm -rf /var/lib/apt/lists/*

# Set up SSH (optional, if you need actual SSH access)
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd # Set a temporary password
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose port for ttyd
EXPOSE 7681

# Run ttyd to provide web terminal access
CMD ["ttyd", "-p", "7681", "bash"]
