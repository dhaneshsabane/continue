# A Dockerfile for quickly building and testing the pyinstaller binary

FROM python:3.9

# Set the working directory to /app

WORKDIR /app

# Copy the current directory contents into the container at /app

COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install pyinstaller

RUN pip install -r /app/continuedev/requirements.txt

RUN pyinstaller continue_server.spec

RUN chmod +x /app/dist/continue_server

CMD ["/app/dist/continue_server"]
