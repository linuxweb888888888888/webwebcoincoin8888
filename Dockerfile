# Use a base image compatible with Binder
FROM jupyter/base-notebook:latest

# Switch to root to install nginx and manage files
USER root
RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy your website files
COPY ./index.html /var/www/html/index.html

# Expose port 8080 (Binder uses this instead of 80)
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
