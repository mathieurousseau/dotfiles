### Homebres installs

brew install zsh \
direnv \
asdf \
neovim \
ripgrep lazygit gh font-hack-nerd-font ydiff \
zsh-completions \
git \
gh \
gnupg \
gnu-sed \
hq \
jq \
k9s \
nnn \
stow \
wget \
tree-sitter \
openssl@1.1 \
zsh-autosuggestions \
zsh-syntax-highlighting \
fzf \


brew tap FelixKratz/formulae
brew install borders
brew install --cask nikitabobko/tap/aerospace 


# Arch linux (package list not up to date. some to install through paru)
pacman -S kitty \
direnv \
asdf \
neovim \
ripgrep lazygit gh font-hack-nerd-font ydiff \
zsh-completions \
git \
gh \
gnupg \
gnu-sed \
hq \
jq \
k9s \
nnn \
stow \
wget \
tree-sitter \
openssl@1.1 \
zsh-autosuggestions \
zsh-syntax-highlighting \
fzf
 

# theScore specific

brew install google-cloud-sdk redis kubectx

# oh my zsh plugins
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# Enable ctrl+cmd+click window

`defaults write -g NSWindowShouldDragOnGesture -bool true`

## disabling it:
`defaults delete -g NSWindowShouldDragOnGesture`

# Bluetooth Logitech + Headset issue:

`sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid`

## disabling it:
`sudo defaults delete /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt`

# nvim html language server
`npm i -g vscode-langservers-extracted`
