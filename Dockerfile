FROM alpine:latest

# setup user, sudo, directories
RUN set -ex \
		&& apk add --update sudo \
		&& addgroup -S dev \
		&& adduser -S -G dev dev

COPY sudoers /etc/sudoers
COPY init.vim /home/dev/.config/nvim/init.vim
COPY .tmux.conf /home/dev/.tmux.conf
COPY .bashrc /home/dev/.bashrc

RUN set -x \
		&& chown -R dev: /home/dev \
		&& mkdir -p /home/dev/go /home/dev/bin /home/dev/lib /home/dev/include

USER dev
WORKDIR /home/dev/

RUN set -ex \
		&& sudo apk add --update \
				bash \
				curl \
				dumb-init \
				git \
				man \
				neovim \
				tmux

RUN set -ex \
		&& curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
				https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ENV SHELL /bin/bash

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "exec tmux"]
