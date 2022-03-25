# ⛺️ dockerhub-42img

Small sized docker image to program 42 projects in a linux environment. Based on [@darodrig's devimage](https://github.com/d-r-e/devimage).

## Features:
 - [Lightweight Debian](https://github.com/bitnami/minideb)
 - Compressed image size ~270MB
 - Norminette
 - Clang, curl, git, iputils, make, pip, vim, wget
 - Default shell: zsh
 - Ohmyzsh:
   - [Spaceship theme](https://github.com/denysdovhan/spaceship-prompt)
   - [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   - [Completions](https://github.com/zsh-users/zsh-completions)
   - [Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Usage:
One line command:
`docker run --name 42img -v ${PWD}:/workdir -it pruizca/42img`

You also can set some extra rules in your makefile:

```Makefile
##
# Docker container rules
##

start:
					@echo "Starting ${NAME} container"
					@docker start ${NAME} >/dev/null 2>&1 || docker run -d --name ${NAME} -v ${PWD}:/${NAME} -it pruizca/42img >/dev/null
					@docker exec -it ${NAME} zsh -c "cd /${NAME}; zsh"

stop:
					@echo "Stopping ${NAME} container"
					@docker stop --time=0 ${NAME} >/dev/null 2>&1 || true

rm:					stop
					@echo "Removing ${NAME} container"
					@docker rm ${NAME} >/dev/null 2>&1 || true
```
