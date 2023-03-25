# JBOSS-7.0.0 server on alpine

This project is a simple container with an alpine distribution which is use to create a JBOSS server.

## About the container

To allow you to access the jboss server from the host jboss is launch with the `-b 0.0.0.0` argument. This argument means the container is listen on all his port if someone is trying to connect to the server.

## Build the container

You can simply build the container with `make build` command.

## Start the container

To start the container you can use `make run` command. Furthermore, this command associate the port 8080 of the host to the port 8080 of the container. Same thing with ports 9990 and 8443. The container is named jbossServer.

## Delete the container

If you want to delete the container the `make clean` is here for you.