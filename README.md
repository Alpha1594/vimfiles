vimfiles
========
A collection of my vim settings and plug-ins.

Have now switched to neocomplete, below git commands no longer relevant.

If all goes to plan this will use a submodule system.> {{{

NOTE if following instructions that refer to `origin` substitute `real`. Not for personal preference but  because git couldn't take it.

##Sub-module commands
[http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

###New Submodule
	EXAMPLE git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
	git submodule add <Git-ADD-URL> <PathToStoreUnder>
	git add .
	git commit -m "Install Fugitive.vim bundle as a submodule."

### Loading Submodules on a new machine
	git clone <Git-URL> ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc		#Add symbollic links for g?vimrc
	cd ~/.vim
	git submodule init
	git submodule update

### Updating subodules
	cd $BUNDLES
	git submodule foreach git pull origin master> }}}
