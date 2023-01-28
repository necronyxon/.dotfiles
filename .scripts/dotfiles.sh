git clone --bare https://github.com/necronyxon/.dotfiles.git $HOME/.dotfiles

function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p .config-backup

dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dotfiles.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
