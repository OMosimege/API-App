FROM python:3.7-alpine
MAINTAINER Onalerona

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# creates empty folder on docker image called this
RUN mkdir /app
# switches above app to this location
WORKDIR /app
# copy from local machine, to app folder in oour image
COPY ./app /app

RUN adduser -D user
USER user
