Dockerfile for [u1and0/neovim](http://hub.docker.com/r/u1and0/neovim)

![screen](https://raw.githubusercontent.com/u1and0/docker_neovim_env/u1and0-screenshot/Screenshot%20from%202019-01-27%2014-29-20.png)

# Install & Run


```
docker pull u1and0/neovim
docker run -it --rm -v `pwd`:/work -w /work u1and0/neovim
```


# Description
* Archlinux コンテナベース([u1and0/archlinux](http://hub.docker.com/r/u1and0/archlinux))
* `python-neovim` インストール済み
  * `nvim --version`

    ```
    NVIM v0.3.4
    Build type: Release
    LuaJIT 2.0.5
    Compilation: /usr/bin/cc -march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong -fno-plt -Wconversion -O2 -DNDEBUG -DMIN_LOG_LEVEL=3 -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wimplicit-fallthrough -Wvla -fstack-protector-strong -fdiagnostics-color=auto -Wno-array-bounds -DINCLUDE_GENERATED_DECLARATIONS -D_GNU_SOURCE -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -I/build/neovim/src/build/config -I/build/neovim/src/neovim-0.3.4/src -I/usr/include -I/build/neovim/src/build/src/nvim/auto -I/build/neovim/src/build/include
    Compiled by builduser

    Features: +acl +iconv +jemalloc +tui
    See ":help feature-compile"

          システム vimrc: "$VIM/sysinit.vim"
           省略時の $VIM: "/usr/share/nvim"

    Run :checkhealth for more info
    ```

* プラグインインストール済み(詳細は[u1and0/dotfiles](https://github.com/u1and0/dotfiles/tree/master/.config/dein))


# Plugins
1. Shougo/neomru.vim
2. Shougo/neoyank.vim
3. zchee/deoplete-jedi
4. davidhalter/jedi-vim
5. lambdalisue/vim-pyenv
6. w0rp/ale
7. thinca/vim-quickrun
8. yuta-masano/hz_ja.vim
9. fatih/vim-go
10. zchee/deoplete-go
11. yuratomo/w3m.vim
12. itchyny/lightline.vim
13. maximbaz/lightline-ale
14. mgee/lightline-bufferline
15. Shougo/dein.vim
16. osyo-manga/vim-precious
17. Shougo/context_filetype.vim
18. w0ng/vim-hybrid
19. tpope/vim-fugitive
20. airblade/vim-gitgutter
21. cespare/vim-toml
22. vim-jp/vimdoc-ja
23. terryma/vim-multiple-cursors
24. t9md/vim-quickhl
25. tomtom/tcomment_vim
26. scrooloose/nerdtree
27. tpope/vim-obsession
28. tpope/vim-surround
29. tpope/vim-repeat
30. jiangmiao/auto-pairs
31. terryma/vim-expand-region
32. hynek/vim-python-pep8-indent
33. bronson/vim-trailing-whitespace
34. Yggdroot/indentLine
35. Shougo/neocomplcache
36. Shougo/neosnippet
37. Shougo/neosnippet-snippets
38. ervandew/supertab
39. majutsushi/tagbar
40. junegunn/fzf.vim
41. jszakmeister/markdown2ctags
42. lambdalisue/vim-gista
43. tpope/vim-abolish
44. tpope/vim-unimpaired
45. vim-scripts/YankRing.vim
46. alvan/vim-closetag
47. kshenoy/vim-signature
48. thinca/vim-ref
49. mojako/ref-sources.vim
50. mfumi/ref-dicts-en.git
51. tokuhirom/jsref
52. mustardamus/jqapi
53. Shougo/deoplete.nvim
54. Shougo/denite.nvim
55. Shougo/vimproc.vim
56. ozelentok/denite-gtags
57. roxma/nvim-yarp
58. roxma/vim-hug-neovim-rpc
59. Shougo/defx.nvim
60. sjl/gundo.vim
61. fedorenchik/VimCalc3
62. vim-airline/vim-airline
63. vim-airline/vim-airline-themes

# Version
* v5.1.0          [mod] base from u1and0/archlinux v4.1.0 rebuild
* v5.0.0          [mod] from u1and0/archlinux user u1and0
* v4.0.0          [mod] default shell zsh, parent image u1and0/zplug
* v3.1.0          [mod] base image u1and0/archlinux:v3.0.0
* v3.0.1          [mod] FROM image latest
* v3.0.0          [add] fd install zplug, tmux, pull all dotfiles
* v2.2.2          [mod] usr /usr/sbin/nvim
* v2.2.1          update my dotfiles
* v2.1.1          [add] install fzf
* v2.1.0          [mod] release merge
* v2.0.1          [mod] remove cache must after yay -Sy
* v2.0.0          yay installed version
* v1.0.1          fix README
* v1.0.0          ditfiles version v1.13.3 applied & <C-Z> disabled
* v0.2.1          install vimproc
* v0.2.0          [add] ctags/gtags
* v0.1.1          [rm] lynx no need [add] comment versions info
* v0.1.0           Neovim container v0.1.0
