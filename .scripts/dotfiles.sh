#!/bin/bash

git clone --bare https://github.com/necronyxon/.dotfiles.git $HOME/.dotfiles

function dotfiles {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p .config-backup

dotfiles checkout 
if [ $? = 0 ]; then
  echo "------------------------------------------------------------"
  echo "Checked out config";
  echo "------------------------------------------------------------"
else
  echo "------------------------------------------------------------"
  echo "Backing up pre-existing dotfiles...";
  echo "------------------------------------------------------------"

  current_location=`dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'}` 
  echo "$current_location" | while read file; do
    backup_file=`echo "$file" | sed 's#^#.config-backup/#'`

    [ -d "$file" ] || mkdir -p `echo "$backup_file" | grep '.*\/' -o`

    echo "Moving $file to $backup_file"
    mv "$file" "$backup_file"
  done 

  echo "------------------------------------------------------------"
fi;
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
