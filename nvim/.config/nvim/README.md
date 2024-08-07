# Neovim configuration
Configuration files to use with Neovim.

## Getting started
1. Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).
2. (Recommended) Install [Hack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#quick-installation).
3. (Recommended) Install terminal packages with a package manager like apt or brew:
```zsh
$ sudo apt install zsh tmux timewarrior taskwarrior jq dateutils
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. (Recommended) Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k).
5. Install dependencies (language servers can be installed automatically via mason.nvim):
    ```zsh
    $ yarn global add typescript prettier lehre @angular/language-server vscode-css-languageserver-bin graphql-language-service-cli vscode-html-languageserver-bin intelephense vscode-json-languageserver typescript typescript-language-server vls yaml-language-server emmet-ls dockerfile-language-server-nodejs
    $ sudo apt install ripgrep bat fd-find fzf fzy trash-cli
    $ pip3 install ueberzug
    $ mkdir -p ~/.local/bin
    $ ln -s /usr/bin/batcat ~/.local/bin/bat
    $ curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash
    $ pip3 install python-lsp-server
    ```
    Install the language server for Lua by following the instructions on https://luals.github.io/#neovim-install.
    For Java: install jdtls, jdk-openjdk and openjdk-src.
6. Install php-cs-fixer with 'composer global require friendsofphp/php-cs-fixer'.
7. Copy jsdoc_templates/default.js.example to jsdoc_templates/default.js and edit according to your preferences.
8. Copy pdv_templates/function.tpl.example to pdv_templates/function.tpl and edit according to your preferences.
9. Put configuration in ~/.zshrc:
    ```
    PATH=$PATH:~/.local/bin
    plugins=(git laravel ng supervisor yarn composer zsh-autosuggestions vi-mode fzf zsh-syntax-highlighting zsh-interactive-cd)
    export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow --exclude .git"
    ```
10. (Recommended) Use fd-find instead of find for fzf, which gives a better performance: see https://github.com/junegunn/fzf#settings. You might need to change fd to fdfind in the configuration.
11. Copy (or create symbolic links) files for tmux, yabai and skhd:
    ```zsh
    $ cp tmux/.tmux.conf ~/.tmux.conf
    $ cp yabai/.yabairc ~/.yabairc
    $ cp skhd/.skhdrc ~/.skhdrc
    $ mkdir ~/tmux
    $ cp tmux/timew-elapsed-day.sh ~/tmux/
    ```
12. Open tmux in the terminal and install plugins (<kbd>Ctrl</kbd> + <kbd>b</kbd>, <kbd>I</kbd>).
13. Install the Tree-sitter CLI (see https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md).
14. Enjoy!
