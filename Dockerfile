# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy custom configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Create a directory to store custom HTML file
RUN mkdir -p /usr/share/nginx/html

# Copy custom HTML file to the container
COPY index.html /usr/share/nginx/html

