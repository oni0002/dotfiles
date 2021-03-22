# dotfiles

```bash
git clone git@github.com:lynd2299/dotfiles.git
cd dotfiles
sh link.sh
```

## asdf setting
```bash
# install
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# completion
mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# add to config.fish
. ~/.asdf/asdf.fish

# python
asdf plugin add python
asdf install python 3.x.x
asdf global python 3.x.x

# node
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs [choose from suggenst]

# direnv
asdf plugin add direnv
asdf install direnv latest
asdf global direnv [choose from suggenst]
# add to config.fish
asdf exec direnv hook fish | source
```
