img:
			@docker build -t pruizca/42img .

pull:
			@git pull

push:		img
			@docker push pruizca/42img:latest
			@docker image rm pruizca/42img
