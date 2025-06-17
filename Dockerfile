# Use Python 3.10 base image from dockerhub
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies. '.' shows root directory
COPY requirements.txt .  
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of application code
# Copies everything in current host directory
COPY . .

# Expose the application port
EXPOSE 8000

# Command to start FastAPI application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
# this will run when container starts: uvicorn app:app --host 0.0.0.0 --port 8000

