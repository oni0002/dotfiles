# dotfiles

makeとかしてもいいけど設定ファイルだけ管理したい(めんどくさい)ので手動にした

1. brew(mac)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew install caskroom/cask/brew-cask
要path追記
```

1. zsh
```
sudo apt install -y zsh
chsh -s /usr/bin/zsh
```

    1. zplugin
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
    ```

1. fish
```
brew install fish

sudo apt install fish
chshせずに.zshrcにexec fish

```
    1. fisher
    ```
    fish curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish     

    brew install fzf
    fish fisher add jethrokuan/fzf

    fish fisher add jethrokuan/z

    fish fisher add rafaelrinaldi/pure

    ```

1. python
```
brew install python
brew install python2

sudo apt install -y python-dev python-pip python3-dev python3-pip

pyenvは必要ない
```

1. neovim
```
brew install neovim

sudo apt install -y neovim
```

    1. pynvim
    ```
    venvでHOMEにnvim用環境つくる
    pip2 install --upgrade pynvim
    pip3 install --upgrade pynvim
    pip2がなければpython2のpynvimはなくてもいい
    ```

    1. node, npm
    ```
    brew install nodebrew
    要path追記
    nodebrew install-binary stable
    nodebrew use vXX.XX.XX

    sudo apt install -y nodejs npm

    npm install -g neovim
    ```

    1. vim-plug
    ```
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    :PlugInstall
    :UpdateRemotePlugins
    ```

1. alacritty
```
brew cask install alacritty

sudo apt install alacritty
```

1. dotfiles
```
git clone git@github.com:lynd2299/dotfiles.git
cd dotfiles
sh symlink.sh
```
