# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#    $ docker pull u1and0/neovim
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim nvim [filenames] ...

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
RUN yes | pacman -Syu ripgrep fzf fd &&\
    : "Remove all packages cache " &&\
    yes | pacman -Scc

# update dotfiles
WORKDIR /root
RUN git stash && git pull
    #: "最初と最後の2行を消す突貫工事" &&\
    #sed -e '1d' -e '$d' .gitconfig | sed '$d' > .gitconfig

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="OS=archlinux, neovim+zplug+tmux, u1and0/dotfiles, plugin manager = dein"\
      version="neovim:v3.0.0"
