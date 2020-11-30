# dotfiles

このリポジトリはドットファイルのみ管理しているので，必要なツールはOSごとに適宜インストールする

## brew(mac)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
```

## zsh
```
macにははじめから入ってる

sudo apt install -y zsh
chsh -s /usr/bin/zsh
```

### zplugin
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
```

## fish
```
brew install fish

sudo apt install fish
chshせずに.zshrcにexec fishしたほうがいいってarchwikiに書いてある
```

### fisher
```
fish curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish     

brew install fzf
fish fisher add jethrokuan/fzf

fish fisher add jethrokuan/z

fish fisher add rafaelrinaldi/pure
```

## python
```
brew install python
brew install python2

sudo apt install -y python-dev python-pip python3-dev python3-pip

pyenvは必要ない
```

## neovim
```
brew install neovim

sudo apt install -y neovim
```

### pynvim
```
venvでHOMEにnvim用環境つくる
pip2 install --upgrade pynvim
pip3 install --upgrade pynvim
pip2がなければpython2のpynvimはなくてもいい
```

### node, npm
```
brew install nodebrew
要path追記
nodebrew install-binary stable
nodebrew use vXX.XX.XX

sudo apt install -y nodejs npm

npm install -g neovim
```

### vim-plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

:PlugInstall
:UpdateRemotePlugins
```

## alacritty
```
日本語入力に難ありなのでしばらくは下記のkittyを使う(名前とアイコンもkittyのがいい)
brew install alacritty

sudo apt install alacritty
```

## kitty
```
brew install kitty

sudo apt install kitty
```

## dotfiles
```
git clone git@github.com:lynd2299/dotfiles.git
cd dotfiles
sh symlink.sh
```
