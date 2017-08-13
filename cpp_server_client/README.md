

This demo is coupled with my C++ sandbox, https://github.com/panchul/sb_cpp
creates a server from the sample for daytime client/server.
The server listens on port 13.
 
To build the image:

    $ docker build -t mydaytime .
    ...
        
    $ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
    mydatetime          latest              53911b53e21b        About a minute ago   386MB

To run, map port 13, for example to 8080 (because on Mac some proxy or firewall settings seem to
screw up the low port numbers):

    $ docker run -p 8080:13 --name mydaytime
      
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
    1ac3653c24d7        53911b53e21b        "/bin/server.out "   31 minutes ago      Up 31 minutes       0.0.0.0:8080->13/tcp   mydatetime
      
Connect to it like so:

    $ curl localhost:8080
    Sun Aug 13 10:45:06 2017

