# Dockerfile for installing and running Nginx

# Select ubuntu as the base image
FROM debian:testing

MAINTAINER Nianhua.Wei

# Install depends
RUN echo "deb http://mirrors.163.com/debian/ testing main contrib non-free" >/etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python python-dev python-pip libmysqlclient-dev python-distribute libmysqlclient-dev python-m2crypto python-crypto
RUN apt-get clean && apt-get autoclean
RUN mkdir -pv /.pip
RUN echo "[global]" >/.pip/pip.conf
RUN echo "index-url = http://pypi.douban.com/simple" >>/.pip/pip.conf

# copy source dir
ADD requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Publish port
#EXPOSE 

# workdir
#WORKDIR 

# Start when container starts
#CMD python run.py
