# vimrc, zshrc, gitconfig, tmux

## all installed as

		ghar add git@github.com:awole20/dotfiles &&\
		(cd ~/ghar/dotfiles && git submodule update --init) &&\
		ghar install &&\
		vim +PluginInstall! +:qa

## dependencies

+ Tagbar requires http://ctags.sourceforge.net/
+ fugitive requires git
+ screen plugin requires screen/tmux (preference with tmux)
+ you complete me requires ycm compiling, and a later version of vim.
