# Use the official Python image as a parent image
FROM python:3.8-slim

# Set the working directory
WORKDIR /workspace

# Copy the current directory contents into the container
COPY . /workspace

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install additional dependencies for YOLOv7
RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Expose port for Jupyter Notebook
EXPOSE 8888

# Define the default command to run when starting the container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
