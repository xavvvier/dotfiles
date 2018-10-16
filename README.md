# dotfiles

Configuration files based on [Michael Smalley](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)

Includes bash_profile, vimrc, tmux.conf and spacemacs

# Install *Nix

Run these commands in the shell

```sh
git clone https://github.com/xavvvier/dotfiles.git
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

# Install On Windows

```sh
Install curl
cd %USERPROFILE%
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
mklink /H ".vimrc" "dotfiles/vimrc"
```