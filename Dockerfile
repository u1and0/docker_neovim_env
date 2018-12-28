# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim
# Versions:
#    v0.1.1
#    521ee1e [rm] lynx no need
#    v0.1.0
#    0ce760a [add]cui browser install
#    8cd8aa9 [add] docker neovim initial commit

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
RUN pacman -S --noconfirm w3m

# Install ctags
RUN pacman -S  --noconfirm ctags
# Install gtags
RUN pacman -S --noconfirm make gcc pygmentize &&\
    cd /tmp &&\
    curl -L http://tamacom.com/global/global-6.6.3.tar.gz | tar zx &&\
    cd ./global-6.6.3 &&\
    ./configure &&\
    make &&\
    make install &&\
    rm -rf /tmp/global-6.6.3

ENTRYPOINT ["/usr/bin/nvim"]

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Neovim container. Using my dotfiles. Get plugins by dein. ctags/gtags installed."\
      description.ja="neovimコンテナ。自分用dotfiles適用, deinによるプラグイン取得, ctags/gtags導入"\
      version="neovim:v0.2.0"
