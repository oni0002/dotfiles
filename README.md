# dotfiles

ドットファイルス

## brew(mac)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
```
## zsh(必須ではない)
macにははじめから入ってる
linuxでは.bashrcに`exec fish`書く

### zplugin(zsh使うなら)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
```

## fish
```
brew install fish

sudo apt install fish
```

### fisher
```
fish curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

brew install fzf
fish fisher install jethrokuan/fzf
fish fisher install rstacruz/fish-asdf
fish fisher install justinmayer/virtualfish
```

## python
```
sudo apt install -y python-dev python-pip python3-dev python3-pip

バージョン分け必要ならasdf使う
```

## neovim
```
brew install neovim

sudo apt install -y neovim
```

### pynvim
```
pip3 install --upgrade pynvim
```

### node, npm
```
バージョン分け必要ならasdf
sudo apt install -y nodejs npm

npm install -g neovim
```

### vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
sh link.sh
```
