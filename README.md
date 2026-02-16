# dotfiles

macOS development environment configuration files.

## Structure

```
ghostty/          Ghostty terminal config, shaders, and custom theme
zsh/              Zsh configuration (Prezto + pure prompt)
starship/         Starship prompt theme (black & yellow)
git/              Git global configuration
vim/              Vim configuration
mac/              macOS system preferences script
editor/           EditorConfig
```

## Setup

```bash
# Ghostty
ln -sf $(pwd)/ghostty/config ~/.config/ghostty/config
ln -sf $(pwd)/ghostty/themes ~/.config/ghostty/themes
ln -sf $(pwd)/ghostty/shaders ~/.config/ghostty/shaders

# Zsh
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc

# Starship
ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml

# Git
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig

# Vim
ln -sf $(pwd)/vim/.vimrc ~/.vimrc

# EditorConfig
ln -sf $(pwd)/editor/.editorconfig ~/.editorconfig

# macOS defaults
bash mac/.macos
```
