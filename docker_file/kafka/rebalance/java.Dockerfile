FROM centos:6.6

#RUN mkdir /etc/yum.repos.d/backup &&\
#	mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/ &&\
#	curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo

RUN yum -y install vim lsof wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel pwgen python-pip

WORKDIR /opt/

RUN mkdir /opt/java &&\
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz -P /opt/java

RUN tar zxvf /opt/java/jdk-8u102-linux-x64.tar.gz -C /opt/java &&\
	JAVA_HOME=/opt/java/jdk1.8.0_102 &&\
	sed -i "/^PATH/i export JAVA_HOME=$JAVA_HOME" /root/.bash_profile &&\
	sed -i "s%^PATH.*$%&:$JAVA_HOME/bin%g" /root/.bash_profile &&\
	source /root/.bash_profile

RUN mkdir /opt/maven &&\
	wget http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -P /opt/maven

RUN tar zxvf /opt/maven/apache-maven-3.3.9-bin.tar.gz -C /opt/maven &&\
	M2_HOME=/opt/maven/apache-maven-3.3.9 &&\
	sed -i "/^PATH/i export MAVEN_OPTS=\"-Xms256m -Xmx512m\"" /root/.bash_profile &&\
	sed -i "s%^PATH.*$%&:$M2_HOME/bin%g" /root/.bash_profile &&\
	source /root/.bash_profile

RUN mkdir /opt/gradle &&\
	wget https://services.gradle.org/distributions/gradle-3.1-bin.zip -P /opt/gradle

RUN unzip /opt/gradle/gradle-3.1-bin.zip -d /opt/gradle/ &&\
	GRADLE_HOME=/opt/gradle/gradle-3.1 &&\
	sed -i "s%^PATH.*$%&:$GRADLE_HOME/bin%g" /root/.bash_profile &&\
	source /root/.bash_profile

ENTRYPOINT ["tail -f /var/log/yum.log"]

