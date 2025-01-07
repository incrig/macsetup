/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Add command to post-setup brew eval commands
# echo >> /Users/---USERNAME---/.zprofile
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/---USERNAME---/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"


brew update && brew upgrade


brew install zsh kubectx kube-ps1 zsh-syntax-highlighting watch inetutils wget
brew install --cask warp

source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Dbz/kube-aliases.git ~/.oh-my-zsh/custom/plugins/kube-aliases\necho "plugins+=(kube-aliases)" >> ~/.zshrc
wget https://raw.githubusercontent.com/incrig/macsetup/refs/heads/main/config/hyper.js -o /Users/---USERNAME---/.hyper.js

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\n
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab\n
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions\n
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

vi .zshrc

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime\n

# Additional stuff
# Make sure kube-ps1 is loaded from your ~/.zshrc and/or ~/.bashrc:
#   source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
#   PS1='$(kube_ps1)'$PS1
# To activate the syntax highlighting, add the following at the end of your .zshrc:
#   source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#   export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
