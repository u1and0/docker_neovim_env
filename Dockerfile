# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#    $ docker pull u1and0/neovim
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim nvim [filenames] ...

FROM u1and0/archlinux:v3.0.0

# Neovim install
RUN sudo -u aur yay -Syyu --noconfirm neovim\
                                    python-neovim\
                                    fd\
                                    fzf\
                                    ripgrep\ 
                                    w3m\
                                    pygmentize\
                                    ctags\
                                    global &&\
    : "Remove all packages cache " &&\
    yay -Scc --noconfirm

# Plugins insall
RUN nvim -c "call dein#install()" -c "q"
# Update plguins & vimproc
RUN nvim +UpdateRemotePlugins +VimProcInstall +q

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="OS=archlinux, neovim+zplug+tmux, u1and0/dotfiles, plugin manager = dein"\
      version="neovim:v3.0.0"
