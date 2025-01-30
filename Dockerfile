# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set non-interactive mode to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory inside the container
WORKDIR /app

# Copy all files to the container
COPY . .

# Update system packages and install dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget ffmpeg sox megatools python3-pip mediainfo && \
    rm -rf /var/lib/apt/lists/*  # Clean up APT cache

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make the start script executable
RUN chmod +x start.sh

# Run the bot
CMD ["bash", "start.sh"]
