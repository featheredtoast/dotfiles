# vimrc, zshrc, gitconfig, tmux

## all installed as

		ghar add git@github.com:awole20/dotfiles &&\
		(cd ~/ghar/dotfiles && git submodule update --init) &&\
		ghar install &&\
		vim +BundleInstall! +:qa

## dependencies

+ Tagbar requires http://ctags.sourceforge.net/
+ fugitive requires git (obviously)
+ screen plugin requires screen/tmux (preference with tmux)
