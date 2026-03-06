# Use a base image compatible with Binder
FROM phemextradebot/webweb8888

# Switch to root to install nginx and manage files
USER root

# Copy your website files
COPY ./index.html /var/www/html/index.html

# Expose port 8080 (Binder uses this instead of 80)
EXPOSE 8080

# Start Nginx in the foreground
CMD ["/bin/bash /start"]
