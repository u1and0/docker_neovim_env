# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#    $ docker pull u1and0/neovim
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim [filename]

FROM u1and0/archlinux:latest

# Neovim install
RUN pacman -Sy --noconfirm python-neovim make
# Plugins insall
RUN nvim -c "call dein#install()" -c "q"
# Update python plguins
RUN nvim -c "UpdateRemotePlugins" -c "q"

# Install CUI web browser
RUN pacman -S --noconfirm w3m

# Install ctags
RUN pacman -S  --noconfirm ctags
# Install gtags
RUN pacman -S --noconfirm gcc pygmentize &&\
    cd /tmp &&\
    curl -L http://tamacom.com/global/global-6.6.3.tar.gz | tar zx &&\
    cd ./global-6.6.3 &&\
    ./configure &&\
    make &&\
    make install &&\
    rm -rf /tmp/global-6.6.3

# vimproc install ###issue### <- Does not work `make` in lazy.toml why?
RUN nvim -c "VimProcInstall" -c "q"

# Disable suspend keybind <C-Z>. Use docker detach keybind <C-P><C-Q> instead.
ENTRYPOINT ["/usr/bin/nvim", "-c","nn <C-Z> <nop>"]

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Neovim container. Using my dotfiles. Get plugins by dein. ctags/gtags installed."\
      description.ja="neovimコンテナ。u1and0/dotfiles:v1.13.3適用, deinによるプラグイン取得, ctags/gtags導入"\
      version="neovim:v1.0.0"
