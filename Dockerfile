# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#     $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim

FROM u1and0/archlinux:v0.4.0

# Neovim install
RUN pacman -Syu --noconfirm python-neovim
# Plugins insall
RUN nvim -c "call dein#install()" -c "q"
# Update python plguins
RUN nvim -c "UpdateRemotePlugins" -c "q"

ENV LANG="ja_JP.UTF8"\
    LC_NUMERIC="ja_JP.UTF8"\
    LC_TIME="ja_JP.UTF8"\
    LC_MONETARY="ja_JP.UTF8"\
    LC_PAPER="ja_JP.UTF8"\
    LC_MEASUREMENT="ja_JP.UTF8"
RUN echo ja_JP.UTF-8 UTF-8 > /etc/locale.gen &&\
    locale-gen && pacman -Syy

# Install CUI web browser
RUN pacman -S --noconfirm w3m lynx

ENTRYPOINT ["/usr/bin/nvim"]

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Neovim container. Using my dotfiles. Get plugins by dein."\
      description.ja="neovimコンテナ。自分用dotfiles適用済み、deinによるプラグイン取得済み"\
      version="neovim:v0.1.0"
