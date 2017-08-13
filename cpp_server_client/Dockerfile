  
#FROM centos
#RUN yum update -y

#FROM ubuntu:trusty
FROM ubuntu:xenial

RUN echo 'The container for a daytime server from https://github.com/panchul/sb_cpp'

RUN apt-get update
RUN apt-get -y install git
#RUN apt-get -y install gcc
RUN apt-get -y install g++

RUN git clone https://github.com/panchul/sb_cpp
WORKDIR "/sb_cpp" 
RUN cd networking_cli_serv && \
    g++ -o /bin/server.out daytimeserver.cpp  -lresolv -lpthread

EXPOSE 13

#CMD ["executable","param1","param2"]
#CMD /bin/server.out
## or, using ENTRYPOINT, you can do something like this:
##ENTRYPOINT ["/bin/ping","-c","3"]
##CMD ["localhost"]

ENTRYPOINT ["/bin/server.out"]
CMD [""]
