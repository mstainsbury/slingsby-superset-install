FROM centos/python-36-centos7
RUN pip3 install --upgrade pip

WORKDIR /opt/app
COPY . /opt/app

RUN yum -y update &&\
    yum clean all &&\
    yum -y install httpd &&\
    yum clean all &&\
    systemctl enable httpd.service &&\
    yum -y install gcc &&\
    yum clean all &&\
    yum -y install openssl-devel &&\
    yum clean all &&\
    yum -y install epel-release &&\
    yum clean all &&\
    yum -y install python-pip &&\
    yum clean all &&\
    yum -y upgrade python-setuptools &&\
    yum clean all &&\
    yum -y install gcc-c++ &&\
    yum clean all &&\
    yum -y libffi-devel &&\
    yum clean all &&\
    yum -y python-devel &&\
    yum clean all &&\
    yum -y python-pip &&\
    yum clean all &&\
    yum -y python-wheel &&\
    yum clean all &&\
    yum -y openssl-devel &&\
    yum clean all &&\
    yum -y cyrus-sasl-devel &&\
    yum clean all &&\
    yum -y openldap-devel &&\
    yum clean all &&\
    yum -y install python3-devel &&\
    yum clean all

COPY requirements.txt /opt/app/requirements.txt

RUN pip3 --no-cache-dir install -r requirements.txt

RUN export FLASK_APP=superset
#RUN export FLASK_APP=superset &&\
#    superset fab create-admin
#RUN superset db upgrade  &&\
#    superset load_examples  &&\
RUN superset init

EXPOSE 8080

ENTRYPOINT ["superset"]
CMD ["run" "-p 8080","--with-threads","--reload", "--debugger"]
