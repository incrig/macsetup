/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo > /Users/$(whoami)/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile

# Start using BREW right now
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install zsh kubectx kube-ps1 zsh-syntax-highlighting watch inetutils wget

# Install Hyper terminal & config
brew install --cask hyper
wget https://raw.githubusercontent.com/incrig/macsetup/refs/heads/main/config/.hyper.js -O /Users/$(whoami)/.hyper.js

# Install OZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Dbz/kube-aliases.git ~/.oh-my-zsh/custom/plugins/kube-aliases && echo "plugins+=(kube-aliases)" >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Install VIM config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

# Additional stuff
# Make sure kube-ps1 is loaded from your ~/.zshrc and/or ~/.bashrc:
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
echo "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh" >> ~/.zshrc
echo "PS1='$(kube_ps1)'$PS1" >> ~/.zshrc

# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#   export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# Start hyper terminal. Should be configured at this point
hyper
