# Operating System for container
FROM ubuntu:latest

# update the instance
RUN apt-get update -y

# install python dependencies + python pkg manager, pip
RUN apt-get install -y python3 python3-distutils python3-pip python3-apt python3-dev

# first copy our requirements to the docker container
COPY ./requirements.txt /app/requirements.txt

# our work directory for this project
WORKDIR /app

# install requirements from requirements.txt file
RUN pip install -r requirements.txt

# copy remaining contents of repo for container
COPY . /app

# declare entry point
ENTRYPOINT ["python3"]

# run our app
CMD ["src/main.py"]

