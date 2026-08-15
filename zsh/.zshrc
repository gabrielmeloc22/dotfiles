export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="alanpeabody"

HIST_STAMPS="mm/dd/yyyy"

ZSH_CUSTOM=~/.config/oh-my-zsh/

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

alias vpn='sudo openfortivpn -c ~/.config/fortivpn-config'

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NODE_PATH=$NODE_PATH:`npm root -g`

export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

export TMPDIR=$HOME/.tmp


# pnpm
export PNPM_HOME="/Users/gabrielmelo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
