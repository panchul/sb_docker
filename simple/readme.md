

Here's how it works. Build it first, lik so:

    $ docker build -t demo .
    Sending build context to Docker daemon  3.072kB
    Step 1/3 : FROM ubuntu:trusty
     ---> 54333f1de4ed
    Step 2/3 : RUN echo 'I like Docker, and it works!'
     ---> Using cache
     ---> 80d20f25ed1f
    Step 3/3 : CMD ping localhost
     ---> Using cache
     ---> ccbf2fe19e1d
    Successfully built ccbf2fe19e1d
    Successfully tagged demo:latest


Run it like so:

    $ docker run -d demo
    45e7934ce7354c232e2124f0e54acf49e7bc84a530a2552200173389b9664c77
    

Observe that it works:

    $ docker ps -l
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    45e7934ce735        demo                "/bin/sh -c 'ping ..."   46 seconds ago      Up 45 seconds                           adoring_mccarthy

See what it is outputting:

    $ docker logs demo
    Error response from daemon: No such container: demo
    swing:simple apanchul$ docker logs 45e7934ce735
    PING localhost (127.0.0.1) 56(84) bytes of data.
    64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.034 ms
    64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.036 ms
    ...
    
    
    