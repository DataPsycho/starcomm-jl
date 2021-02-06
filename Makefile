.PHONY: serve post postth serve buildso serveso removeso removed buildd served

app_name = starcomm-jl:latest
local_app_name = StarComm

post:
	curl -X POST -H "Content-Type: application/json" -d '{"from": "Saru", "message": "Saru to Discovery. Over!"}' http://0.0.0.0:8080/discovery

postth:
	curl -X POST -H "Content-Type: application/json" -d '{"from": "Saru", "message": "Saru to Discovery. Over!"}' http://0.0.0.0:8080/discovery-threaded

serve:
	clear
	bash ./app_starter.sh

buildso:
	rm -rf ./$(local_app_name).so & \
	julia deploy/packagecompile.jl

serveso:
	julia --threads 2 -J$(local_app_name).so -e "$(local_app_name).run()"

removeso:
	rm -rf *.so
	clear

buildd:
	docker build -t $(app_name) .

served:
	sudo docker run --detach -p 8080:8080 $(app_name)


killd:
	@echo 'Killing container...'
	docker ps | grep $(app_name) | awk '{print $$1}' | xargs -r docker stop


removed:
	docker ps -a | grep $(app_name) | awk '{print $$1}' | xargs docker rm




