# Use a base image compatible with Binder
FROM phemextradebot/webweb8888

# Expose port 8080 (Binder uses this instead of 80)
EXPOSE 8080

# Start Nginx in the foreground
CMD ["/bin/bash /startweb"]
