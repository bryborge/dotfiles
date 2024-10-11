#!/bin/bash

set -euo pipefail

# Main function
main() {
  dot_your_eyes .bash_aliases
  dot_your_eyes .bashrc
  dot_your_eyes .gitcompletion
  dot_your_eyes .gitconfig
  dot_your_eyes .gitignore
  dot_your_eyes .gitprompt
  dot_your_eyes .vim
  dot_your_eyes .vimrc

  printf "\n"

  cleanup_aisle_five
}

# 1) Ask if user wants to backup, destroy or ignore target.
dot_your_eyes() {
  printf "\n"

  if [[ -f ~/$1 || -d ~/$1 || -L ~/$1 ]]; then
    echo "    \"~/$1\" already exists! Backup (b), Destroy (d), or Ignore (i)?"
    read -p "        Enter [b/d/i] : " opt
    printf "\n"
    cross_your_tease $opt $1
    ftw $1
  else
    ftw $1
  fi
}

# 2a) Handle request from the user on the target.
cross_your_tease() {
  if [[ "i" == $1 ]]; then
    echo "    Ignoring. Proceed ..."
  elif [[ "b" == $1 ]]; then
    create_config_bak
    mv ~/$2 ~/config_bak
    echo "    backup created in \"~/config_bak/$2\""
  elif [[ "d" == $1 ]]; then
    rm ~/$2
    echo "    \"~/$2\" was destroyed."
  else
    echo "    Doing nothing. Proceed ... \"~/$2\""
  fi
}

# 2b) Create symlink for target.
ftw() {
  ln -s ~/code/dotfiles-linux/$1 ~/$1
  echo "    \"~/$1\" symlink created!"
}

# 3) Create ~/config_bak dir if it doesn't already exist.
create_config_bak() {
  if [ ! -d ~/config_bak ]; then
    mkdir ~/config_bak
  fi
}

# 4) Prompt user to remove all the config backup from preceeding step(s).
cleanup_aisle_five() {
  echo "    Want to remove your backups now?"
  read -p "        Enter [y/n]: " opt

  if [[ "y" == $opt ]]; then
    rm -rf ~/config_bak
  else
    printf "\n"
    echo "    Cool beans. You're all set. \o/"
  fi
}

# Do it.
main
