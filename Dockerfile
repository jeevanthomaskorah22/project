# Use official Python image
FROM python:3.9

#define environment variable for working directory
ENV HOME_DIR=/newproject

# Set working directory
WORKDIR $HOME_DIR

# Copy Python script into container
COPY . $HOME_DIR

#create the directory inside the container
RUN mkdir -p $HOME_DIR/app

# Run the script when the container starts
CMD ["python", "hello_world.py"]
