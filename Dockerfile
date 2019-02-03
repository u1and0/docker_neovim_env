# Neovim container
# Using my dotfiles
# Get plugins by dein
#
# Usage:
#    $ docker pull u1and0/neovim
#    $ docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim [filename]

FROM u1and0/archlinux:latest

# Neovim install
RUN sudo -u aur yay -Sy --noconfirm python-neovim w3m pygmentize ctags global
# Plugins insall
RUN nvim -c "call dein#install()" -c "q"
# Update plguins & vimproc
RUN nvim +UpdateRemotePlugins +VimProcInstall +q &&\
    : "Remove all packages cache " &&\
    yes | yay -Scc

# Disable suspend keybind <C-Z>. Use docker detach keybind <C-P><C-Q> instead.
ENTRYPOINT ["/usr/bin/nvim", "-c","nn <C-Z> <nop>"]

LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Neovim container. Using my dotfiles. Get plugins by dein. ctags/gtags installed."\
      description.ja="neovimコンテナ。u1and0/dotfiles:v1.13.3適用, deinによるプラグイン取得, ctags/gtags導入"\
      version="neovim:v1.0.0"
