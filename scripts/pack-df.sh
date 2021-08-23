MY_DATE=`date +%Y-%m%d-%H%M%S`

SNAPSHOT=$HOME/dotfiles/nvim-snapshot

rm -rf $SNAPSHOT
mkdir -p $SNAPSHOT
cp -r ~/.config/nvim $SNAPSHOT/
cp -r ~/.local/share/nvim/site $SNAPSHOT/

XZ_OPT="-9" tar -C ~ -cJf ~/dotfiles-$MY_DATE.tar.xz dotfiles
(cd ~ && split ~/dotfiles-$MY_DATE.tar.xz -b 2M dotfiles-$MY_DATE.tar.xz.split-)
