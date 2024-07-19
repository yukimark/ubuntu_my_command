FROM ubuntu:24.04

RUN apt update

RUN mkdir /app_name
ENV APP_ROOT=/app_name
WORKDIR $APP_ROOT

ADD . $APP_ROOT
