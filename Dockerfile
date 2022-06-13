FROM amazonlinux
RUN yum update -y
RUN yum install wget unzip -y
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
RUN rpm -ivh jdk-8u131-linux-x64.rpm
WORKDIR /etc/yum.repos.d/
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins --nogpgcheck -y
#RUN systemctl start jenkins
EXPOSE 8080
CMD ["systemctl start jenkins", "run"]
