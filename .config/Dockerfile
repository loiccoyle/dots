FROM archlinux:latest

ARG USERNAME=dots
ARG PASSWORD=dots
ARG REPOSITORY=/home/${USERNAME}/src/github.com/loiccoyle

ENV HOME /home/${USERNAME}

RUN pacman -Syu --noconfirm --noprogressbar
RUN pacman -S base base-devel --noconfirm --noprogressbar

RUN echo dotfiles > /etc/hostname
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN locale-gen
RUN export LANG=C

RUN useradd -m -r -G wheel -s /bin/bash ${USERNAME}
RUN echo "root:${PASSWORD}" | chpasswd
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' | EDITOR='tee -a' visudo

RUN pacman -Syy
RUN pacman -S xdg-user-dirs --noconfirm --noprogressbar
RUN pacman -S git --noconfirm --noprogressbar
RUN pacman -S curl --noconfirm --noprogressbar
RUN pacman -S zsh --noconfirm --noprogressbar
RUN chsh -s /usr/bin/zsh ${USERNAME}

ENV HOME /home/${USERNAME}
WORKDIR /home/${USERNAME}
USER ${USERNAME}
RUN LANG=C xdg-user-dirs-update --force &&\
	mkdir -p ${REPOSITORY}
RUN git clone https://aur.archlinux.org/paru.git ~/src/paru && cd ~/src/paru/ && makepkg -si --noconfirm
RUN curl -L loiccoyle.com/dots/install | bash
CMD ["su", "-", "dots", "-c", "/bin/zsh"]
