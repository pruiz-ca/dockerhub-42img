img:
		@docker build -t pruizca/42img .

pull:
		@git pull

login:
		@docker login

logout:
		@docker logout

push:	img
		@docker push pruizca/42img:latest
		@docker image rm pruizca/42img

multi:
		@docker buildx create --use default
		docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag pruizca/42img:latest .
