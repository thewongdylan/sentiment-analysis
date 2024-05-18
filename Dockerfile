# Set base image (host OS)
FROM python:3.11

# Set the working directory inside the container
WORKDIR /code

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Build h5py package from source
RUN pip install h5py --only-binary h5py

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the contents of local src directory to the working directory
COPY src/ .

# Command to run on container start
CMD ["python"]