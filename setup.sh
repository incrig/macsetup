/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo > /Users/$(whoami)/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile

# Start using BREW right now
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install basic packages
brew install zsh kubectx kube-ps1 zsh-syntax-highlighting watch inetutils wget helm k9s awscli

# Install Hyper terminal & config
brew install --cask hyper
wget https://raw.githubusercontent.com/incrig/macsetup/refs/heads/main/config/.hyper.js -O /Users/$(whoami)/.hyper.js

# Install OZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Dbz/kube-aliases.git ~/.oh-my-zsh/custom/plugins/kube-aliases && echo "plugins+=(kube-aliases)" >> ~/.zshrc

echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Install ZSH theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' /Users/$(whoami)/.zshrc

# Install VIM config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Additional stuff
# Make sure kube-ps1 is loaded from your ~/.zshrc and/or ~/.bashrc:
chmod +x "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
echo "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh" >> ~/.zshrc

# Configure .zshrc plugins
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
echo "plugins+=(fzf-tab)" >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "plugins+=(zsh-autosuggestions)" >> ~/.zshrc

echo "plugins+=(aws)" >> ~/.zshrc
echo "plugins+=(terraform)" >> ~/.zshrc
echo "plugins+=(vscode)" >> ~/.zshrc
echo "plugins+=(kubectl)" >> ~/.zshrc
echo "plugins+=(Kube-ps1)" >> ~/.zshrc



# Start hyper terminal. Should be configured at this point
hyper
