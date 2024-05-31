#!/bin/bash

# Absolute path to the output directory
OUTPUT_DIR="/app/huggingface-report-generator/output"

# Docker image name
IMAGE_NAME="huggingface-report-generator"

# Cron job command
CRON_JOB="0 0 * * * docker run --rm -v $OUTPUT_DIR:/output $IMAGE_NAME"

# Add the cron job to crontab if it doesn't already exist
(crontab -l 2>/dev/null | grep -F "$CRON_JOB") || (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job set to run daily at midnight."
