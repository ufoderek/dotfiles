MY_DATE=`date +%Y-%m%d-%H%M%S`

rm -rf ~/dotfiles/nvim-snapshot
cp -r ~/.config/nvim ~/dotfiles/nvim-snapshot
rm -rf `find ~/dotfiles/nvim-snapshot -name \.git`

XZ_OPT="-9" tar -C ~ -cJf ~/dotfiles-$MY_DATE.tar.xz dotfiles
(cd ~ && split ~/dotfiles-$MY_DATE.tar.xz -b 2M dotfiles-$MY_DATE.tar.xz.split-)
