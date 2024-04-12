# Use a base image with NGINX
FROM nginx:alpine

# Copy the HTML file into the NGINX default HTML directory
COPY index.html /usr/share/nginx/html

# Expose port 80 to allow external access
EXPOSE 80
