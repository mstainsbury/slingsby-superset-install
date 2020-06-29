FROM centos/python-36-centos7
RUN pip3 install --upgrade pip

WORKDIR /opt/app
COPY . /opt/app

RUN yum -y update &&\
    yum clean all &&\
    yum -y install httpd &&\
    yum clean all &&\
    systemctl enable httpd.service

RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python3"]
CMD ["helloworld.py"]
