FROM centos:7

ADD TIB_ems_6.3.0_linux26gl23_x86.tar.gz /tmp/

RUN yum update -y

RUN yum install java-1.6.0-openjdk-devel bc busybox wget glibc.i686 libstdc++.so.6 -y

RUN export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk.x86_64

RUN ./tmp/TIBCOUniversalInstaller-lnx-x86.bin -silent

RUN touch /home/user/tibco/tibco/cfgmgmt/ems/data/datastore/logfile

RUN touch /home/user/tibco/tibco/cfgmgmt/ems/data/datastore/async-msgs.db

RUN touch /home/user/tibco/tibco/cfgmgmt/ems/data/datastore/sync-msgs.db

RUN touch /home/user/tibco/tibco/cfgmgmt/ems/data/datastore/meta.db

RUN chmod 777 /home/user/tibco/tibco/cfgmgmt/ems/data/datastore/*

ENV EMS_PORT 7222

ENV EMS_VERSION 6.3

ENV EMS_CONFIG /home/user/tibco/tibco/cfgmgmt/ems/data/tibemsd.conf

EXPOSE $EMS_PORT

ENTRYPOINT /opt/tibco/ems/6.3/bin/tibemsd -config /home/user/tibco/tibco/cfgmgmt/ems/data/tibemsd.conf