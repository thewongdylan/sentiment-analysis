# Set base image (host OS)
FROM python:3.11

# Set the working directory inside the container
WORKDIR /code

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Build h5py package from source
RUN pip install h5py --only-binary h5py

# # Install jupyter
# RUN pip install jupyter

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8888 for Jupyter
EXPOSE 8888

# Copy the contents of local src directory to the working directory
COPY src/ .

# Run Jupyter Notebook when the container launches
CMD jupyter notebook --allow-root --ip 0.0.0.0 --port 8888