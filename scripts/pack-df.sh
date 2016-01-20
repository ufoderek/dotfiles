MY_DATE=`date +%Y-%m%d-%H%M%S`
rm -rf ~/dotfiles/vim-snapshot
cp -r ~/.vim ~/dotfiles/vim-snapshot
rm -rf `find ~/dotfiles/vim-snapshot -name \.git`
tar -C ~ -czf ~/dotfiles-$MY_DATE.tar.xz dotfiles
