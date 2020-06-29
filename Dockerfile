FROM centos/python-36-centos7
RUN apk add --no-cache python3-dev \
    && pip3 install --upgrade pip

WORKDIR /opt/app
COPY . /opt/app

RUN yum -y update

RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python3"]
CMD ["helloworld.py"]
