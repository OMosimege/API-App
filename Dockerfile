FROM python:3.7-alpine
MAINTAINER Onalerona

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# creates empty folder on docker image called this
RUN mkdir /app
# switches above app to this location
WORKDIR /app
# copy from local machine, to app folder in oour image
COPY ./app /app

RUN adduser -D user
USER user
