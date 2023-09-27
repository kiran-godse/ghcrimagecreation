# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set environment variables for Python and Node.js
ENV PYTHONUNBUFFERED=1
ENV NODE_ENV=development

# Install system-level dependencies
RUN apk update && apk add --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    nodejs \
    npm \
    build-base \
    git \
    && rm -rf /var/cache/apk/*

# Create a non-root user (optional but recommended for security)
RUN adduser -D -u 1000 devuser

# Set the working directory
WORKDIR /app

# Create and activate a virtual environment for Python (optional but recommended)
RUN python3 -m venv /app/venv

# Activate the virtual environment
SHELL ["/bin/ash", "-c", "source /app/venv/bin/activate"]

# Define the command to run when the container starts
CMD ["ash"]
