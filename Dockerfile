# Neovim container
# *Using my dotfiles
# *Get plugins by dein
# * Inherit from u1and0/archlinux <- archlinux/base
#
# Usage:
#    $ docker pull u1and0/neovim
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim nvim [filenames] ...

FROM u1and0/archlinux:latest

# Neovim install
# USER u1and0 or somebody except root
RUN yay -Syyu --noconfirm neovim\
                        python-neovim\
                        fd\
                        fzf\
                        ripgrep\ 
                        w3m\
                        pygmentize\
                        ctags\
                        global \
                        man \
                        man-pages-ja &&\
    : "Remove all packages cache " &&\
    yay -Scc --noconfirm

# Plugins insall
# Install & Update plguins & vimproc
RUN nvim +UpdateRemotePlugins +VimProcInstall +q

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="OS=archlinux, editor=neovim, dotfiles=u1and0/dotfiles, plugin manager=dein"\
      version="neovim:v5.0.0"
