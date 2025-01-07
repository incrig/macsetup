/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Add command to post-setup brew eval commands

brew update && brew upgrade
brew install ctx shasum kube-ps1 zsh-syntax-highlighting watch ftp inetutils
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
