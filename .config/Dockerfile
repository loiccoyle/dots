FROM archlinux:latest

ARG USERNAME=lcoyle
ARG PASSWORD=dots
ARG REPOSITORY=/home/${USERNAME}/src/github.com/lcoyle

ENV HOME /home/${USERNAME}

RUN pacman -Syu --noconfirm
RUN pacman -S base base-devel --noconfirm

RUN echo dotfiles > /etc/hostname
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN export LANG=C

RUN useradd -m -r -G wheel -s /bin/bash ${USERNAME}
RUN echo "root:${PASSWORD}" | chpasswd
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' | EDITOR='tee -a' visudo

RUN pacman -Syy
RUN pacman -S xdg-user-dirs --noconfirm
RUN pacman -S git --noconfirm
RUN pacman -S curl --noconfirm
RUN pacman -S zsh --noconfirm
RUN pacman -S termite-terminfo --noconfirm

ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}
RUN LANG=C xdg-user-dirs-update --force &&\
	mkdir -p ${REPOSITORY}

USER ${USERNAME}
WORKDIR /tmp
RUN curl -L https://github.com/Jguer/yay/releases/download/v10.1.2/yay_10.1.2_x86_64.tar.gz -O &&\
	tar xzvf yay_10.1.2_x86_64.tar.gz
USER root
RUN cp /tmp/yay_10.1.2_x86_64/yay /usr/bin/yay
RUN chsh -s /usr/bin/zsh lcoyle
USER ${USERNAME}
WORKDIR /home/${USERNAME}
# update yay
RUN yay -S yay
RUN curl -Ls loiccoyle.com/dots/install | bash
# git config causing issues
RUN rm -rf ~/.config/git
CMD ["su", "-", "lcoyle", "-c", "/bin/zsh"]
