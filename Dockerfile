FROM ubuntu:22.04

LABEL maintainer="pruiz-ca@student.42madrid.com" \
      version="0.1" \
      description="Custom Docker image for 42 School projects."

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -q -y \
      clang-12 \
      valgrind \
      gdb \
      lldb-12 \
      nasm \
      curl \
      git \
      build-essential \
      iputils-ping \
      make \
      python3-pip \
      python3-setuptools \
      vim \
      wget \
      zsh && \
      rm -rf /var/lib/apt/lists/* && \
      apt-get clean && \
      sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
      -t robbyrussell \
      -p git \
      -p https://github.com/zsh-users/zsh-autosuggestions \
      -p https://github.com/zsh-users/zsh-completions \
      -p https://github.com/zsh-users/zsh-syntax-highlighting && \
      pip3 install norminette && \
      ln -sf /usr/bin/clang-12 /usr/bin/clang && \
      ln -sf /usr/bin/clang /usr/bin/cc && \
      ln -sf /usr/bin/clang++-12 /usr/bin/clang++ && \
      ln -sf /usr/bin/clang++ /usr/bin/c++ && \
      ln -sf /usr/bin/gcc-10 /usr/bin/gcc && \
      ln -sf /usr/bin/g++-10 /usr/bin/g++ && \
      ln -sf /usr/bin/lldb-12 /usr/bin/lldb && \
      echo 'PROMPT="%{%{$fg_bold[magenta]%}42docker%}%{$fg_bold[cyan]%} %c $(git_prompt_info)%{$reset_color%}"' >> /root/.zshrc

ENV SHELL /usr/bin/zsh

CMD zsh
