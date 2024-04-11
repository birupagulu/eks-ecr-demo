# Use a lightweight Python image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Python script into the container at /app
COPY hello.py /app

# Install Flask, a lightweight WSGI web application framework
RUN pip install Flask

# Expose port 5000 to the outside world
EXPOSE 5000

# Define the command to run the application when the container starts
CMD ["python", "hello.py"]

