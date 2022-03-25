FROM bitnami/minideb

RUN install_packages \
      clang \
      curl \
      git \
      iputils-ping \
      make \
      python3-pip \
      python3-setuptools \
      vim \
      wget \
      zsh && \

      sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
        -t https://github.com/denysdovhan/spaceship-prompt \
        -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
        -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
        -p git \
        -p https://github.com/zsh-users/zsh-autosuggestions \
        -p https://github.com/zsh-users/zsh-completions \
        -p https://github.com/zsh-users/zsh-syntax-highlighting && \

      pip3 install norminette

ENV SHELL /usr/bin/zsh

CMD zsh
