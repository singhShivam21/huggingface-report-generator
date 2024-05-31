FROM ubuntu:20.04

# Prevents interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Make directory for output
RUN mkdir /output

# Run the generate_report.py script


CMD ["python3", "main.py"]
CMD ["chmod +x setup_cron.sh"]
CMD ["./setup_cron.sh"]