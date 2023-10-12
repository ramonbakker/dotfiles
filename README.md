# Vimrc configuration
Configuration files to use with Neovim (and some other programs).

## Getting started
1. Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).
2. (Recommended) Install [Hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#quick-installation).
3. (Recommended) Install terminal packages:
```zsh
$ sudo apt install zsh tmux konsole timewarrior taskwarrior jq dateutils
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. (Recommended) Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k).
5. Install dependencies:
```zsh
$ yarn global add typescript prettier lehre @angular/language-server vscode-css-languageserver-bin graphql-language-service-cli vscode-html-languageserver-bin intelephense vscode-json-languageserver typescript typescript-language-server vls yaml-language-server emmet-ls dockerfile-language-server-nodejs
$ sudo apt install ripgrep bat fd-find fzf fzy trash-cli
$ pip3 install ueberzug
$ mkdir -p ~/.local/bin
$ ln -s /usr/bin/batcat ~/.local/bin/bat
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
$ curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash
$ pip3 install python-lsp-server
```
6. Copy (or create a symbolic link) configuration files for Konsole (make sure to edit Konsole settings afterwards):
```zsh
$ cp konsole/Ramon.profile konsole/GreenOnBlack.colorscheme ~/.local/share/konsole/
```
7. Copy UltiSnips/php.snippets.example to UltiSnips/php.snippets and edit according to your preferences.
8. Copy UltiSnips/typescript.snippets.example to UltiSnips/typescript.snippets and edit according to your preferences.
9. Copy jsdoc_templates/default.js.example to jsdoc_templates/default.js and edit according to your preferences.
10. Copy pdv_templates/function.tpl.example to pdv_templates/function.tpl and edit according to your preferences.
11. Put configuration in ~/.zshrc:
```
PATH=$PATH:~/.local/bin
plugins=(git laravel ng supervisor yarn composer zsh-autosuggestions vi-mode fzf zsh-syntax-highlighting)
export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow --exclude .git"
```
12. (Recommended) Use fd-find instead of find for fzf, which gives a better performance: see https://github.com/junegunn/fzf#settings. You might need to change fd to fdfind in the configuration.
13. Copy (or create symbolic links) files for tmux, yabai and skhd:
```zsh
$ cp tmux/.tmux.conf ~/.tmux.conf
$ cp yabai/.yabairc ~/.yabairc
$ cp skhd/.skhdrc ~/.skhdrc
$ mkdir ~/tmux
$ cp tmux/timew-elapsed-day.sh ~/tmux/
```
13. Open tmux (in Konsole) and install plugins (<kbd>Ctrl</kbd> + <kbd>b</kbd>, <kbd>I</kbd>).
14. Execute in Neovim:
```
:PlugInstall
:TSInstall php typescript jsdoc html css graphql yaml json bash regex http lua
```
15. Enjoy!
