build:
	docker build . -t jboss_container

run:
	docker run -it -p 8080:8080 -p 8443:8443 -p 9990:9990 -v ~/Documents/warFile:/root/EAP-7.0.0/standalone/deployments --name jbossServer jboss_container

clean:
	docker rmi jboss_container