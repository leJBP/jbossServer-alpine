imageName = jboss_container
containerName = jbossServer

build:
	docker build . -t $(imageName)

run:
	docker run -it -p 8080:8080 -p 8443:8443 -p 9990:9990 -v ~/Documents/warFile:/root/EAP-7.0.0/standalone/deployments --name $(containerName) $(imageName)

clean:
	docker rmi $(imageName)