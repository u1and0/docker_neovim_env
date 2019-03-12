# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#    $ docker pull u1and0/neovim
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim [filename]

FROM u1and0/archlinux:latest

# Neovim install
RUN sudo -u aur yay -Syy --noconfirm python-neovim\
                                    w3m\
                                    pygmentize\
                                    ctags\
                                    global &&\
    : "Remove all packages cache " &&\
    yes | yay -Scc
# Plugins insall
RUN nvim -c "call dein#install()" -c "q"
# Update plguins & vimproc
RUN nvim +UpdateRemotePlugins +VimProcInstall +q

# Install other packages
RUN pacman -S --noconfirm ripgrep &&\
    : "Remove all packages cache " &&\
    yes | pacman -Scc

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Neovim container. Using my dotfiles. Get plugins by dein. ctags/gtags installed."\
      description.ja="neovimコンテナ。u1and0/dotfiles適用, deinによるプラグイン取得, ctags/gtags導入"\
      version="neovim:v2.1.0"
