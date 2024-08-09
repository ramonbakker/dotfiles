# Dotfiles
This repository contains dotfiles for several programs. Use stow to propagate them on your system.

## macOS
```
brew install tmux timewarrior dateutils neovim koekeishiya/formulae/yabai koekeishiya/formulae/skhd stow htop jq skhd fzf fd trash-cli ripgrep bat
brew install --cask font-hack spotify karabiner-elements keepassxc
mkdir ~/.config
stow karabiner nvim p10k skhd tmux wezterm yabai
```

### Audio
macOS doesn't let you control the volume of an HDMI audio output. We need a third party app to control the volume:
```
brew install --cask eqmac
```

To use the MacBook Pro internal speakers together with external speakers:
1. Open Audio MIDI setup.
2. Create a Multi-Output Device and add the audio devices you would like to use.
3. Change the audio output to Multi-Output Device.

## General
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '' 's#ZSH_THEME=".*"#ZSH_THEME="powerlevel10k/powerlevel10k"#' ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '' 's/plugins=(.*)/plugins=(git gitfast ng supervisor yarn composer docker docker-compose zsh-autosuggestions vi-mode fzf zsh-syntax-highlighting zsh-interactive-cd)/' ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl https://get.volta.sh | bash
volta install node yarn

npm install tree-sitter-cli

cat <<'EOF' >> ~/.zshrc
alias vim="/usr/local/bin/nvim"

export PATH="$HOME/.local/bin:$PATH"

export VISUAL="/usr/local/bin/nvim"
export EDITOR="/usr/local/bin/nvim"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
EOF
```

## Browser extensions
[KeePassXC-Browser](https://github.com/keepassxreboot/keepassxc-browser?tab=readme-ov-file#download-and-use)
[Ghostery](https://www.ghostery.com/ghostery-ad-blocker)
[uBlock Origin](<https://github.com/gorhill/uBlock?tab=readme-ov-file#installation)
[Surfingkeys](https://github.com/brookhong/Surfingkeys?tab=readme-ov-file#installation)

### Firefox specific
[Firefox Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)

#### PHP
[Xdebug Helper for Firefox](https://addons.mozilla.org/nl/firefox/addon/xdebug-helper-for-firefox/)
