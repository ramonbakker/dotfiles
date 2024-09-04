# Dotfiles
This repository contains dotfiles for several programs. Use stow to propagate them on your system.

## macOS
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo export HOMEBREW_NO_AUTO_UPDATE=1 >> ~/.zshrc

brew install tmux taskwarrior-tui timewarrior dateutils neovim koekeishiya/formulae/yabai koekeishiya/formulae/skhd stow htop jq skhd fzf fd trash-cli ripgrep bat tree-sitter mariadb php-cs-fixer
 tree
brew install --cask docker font-hack mtmr spotify karabiner-elements keepassxc wezterm libreoffice

mkdir ~/.config
stow karabiner mtmr nvim p10k skhd tmux wezterm yabai

sudo nvram AutoBoot=%00

# Optional
pip3 install visidata

brew install openjdk
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc

brew install --cask apache-directory-studio
```

Follow installation instructions for yabai: <https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)>. Disable System Integrity Protection: <https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection#how-do-i-disable-system-integrity-protection>.

### Audio
macOS doesn't let you control the volume of an HDMI audio output. We need a third party app to control the volume:
```zsh
brew install --cask eqmac
```

To use the MacBook Pro internal speakers together with external speakers:
1. Open Audio MIDI setup.
2. Create a Multi-Output Device and add the audio devices you would like to use.
3. Change the audio output to Multi-Output Device.

## General
```zsh
ssh-keygen -t rsa -b 4096 -N '' ~/.ssh/id_rsa
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '' 's#ZSH_THEME=".*"#ZSH_THEME="powerlevel10k/powerlevel10k"#' ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '' 's/plugins=(.*)/plugins=(git gitfast ng supervisor yarn composer docker docker-compose zsh-autosuggestions vi-mode fzf zsh-syntax-highlighting zsh-interactive-cd)/' ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl https://get.volta.sh | bash
volta install node yarn

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
- [Dark Reader](https://darkreader.org/)
- [KeePassXC-Browser](https://github.com/keepassxreboot/keepassxc-browser?tab=readme-ov-file#download-and-use)  
- [Ghostery](https://www.ghostery.com/ghostery-ad-blocker)  
- [uBlock Origin](https://github.com/gorhill/uBlock?tab=readme-ov-file#installation)  
- [Surfingkeys](https://github.com/brookhong/Surfingkeys?tab=readme-ov-file#installation)  
Custom settings:
```
settings.tabsThreshold = 0;
```


### Firefox specific
- [Firefox Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)  

#### PHP
- [Xdebug Helper for Firefox](https://addons.mozilla.org/nl/firefox/addon/xdebug-helper-for-firefox/)  
