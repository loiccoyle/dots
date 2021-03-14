FROM archlinux:latest

ARG USERNAME=lcoyle
ARG PASSWORD=dots
ARG REPOSITORY=/home/${USERNAME}/src/github.com/loiccoyle

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
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' | EDITOR='tee -a' visudo

RUN pacman -Syy
RUN pacman -S xdg-user-dirs --noconfirm
RUN pacman -S git --noconfirm
RUN pacman -S curl --noconfirm
RUN pacman -S zsh --noconfirm
RUN pacman -S termite-terminfo --noconfirm
RUN pacman -S go --noconfirm

ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}
RUN LANG=C xdg-user-dirs-update --force &&\
	mkdir -p ${REPOSITORY}

USER ${USERNAME}
WORKDIR /tmp
USER root
RUN chsh -s /usr/bin/zsh ${USERNAME}
USER ${USERNAME}
# install yay
RUN git clone https://aur.archlinux.org/yay.git && cd yay/ && makepkg -si --noconfirm
WORKDIR /home/${USERNAME}
# update yay
RUN curl -Ls loiccoyle.com/dots/install | bash
# git config causing issues
RUN rm -rf ~/.config/git
CMD ["su", "-", "lcoyle", "-c", "/bin/zsh"]
