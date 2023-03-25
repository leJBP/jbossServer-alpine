imageName = jboss_container
containerName = jbossServer
pathToWarFile = ~/Documents/warFile

all: build path

build:
	docker build . -t $(imageName)

run:
	docker run -it -p 8080:8080 -p 8443:8443 -p 9990:9990 -v $(pathToWarFile):/root/EAP-7.0.0/standalone/deployments --name $(containerName) $(imageName)

path:
	mkdir $(pathToWarFile)

clean:
	rm -rf $(pathToWarFile)/*

remove:
	docker rmi $(imageName)

uninstall: clean remove