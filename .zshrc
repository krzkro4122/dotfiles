# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors

EDITOR=vim

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

alias ll='ls --color=always -la'
alias vi='nvim'
alias KRK='curl wttr.in/krakow\?m'
alias WWA='curl wttr.in/warsaw\?m'
alias TEMPS='sudo powermetrics'

alias secrets_openstack='scp -i ~/kiper.pem -o UserKnownHostsFile='/dev/null' ~/Downloads/secrets.sh admin@10.190.55.38:/home/admin/'
alias secrets_vsphere='scp -i ~/kiper.pem -o UserKnownHostsFile='/dev/null' ~/Downloads/secrets.sh admin@10.146.131.161:/home/admin/'

alias VVSSH='ssh -i ~/kiper.pem admin@10.146.131.161'
alias VCSSH='ssh -i ~/kiper.pem root@10.146.131.176'
alias VSSSH='ssh -i ~/kiper.pem root@10.146.131.175'

alias OVSSH='ssh -i ~/kiper.pem admin@10.190.55.38'
alias OSSSH='ssh -i ~/kiper.pem root@10.190.55.30'
alias OCSSH='ssh -i ~/kiper.pem root@10.190.55.37'

alias BRUH='ssh -i ~/kiper.pem root@192.168.1.200'

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

source ~/powerlevel10k/powerlevel10k.zsh-theme

[ -f "$HOME/zsh/aliasrc" ] && source "$HOME/zsh/aliasrc"

# Load ; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export OS_AUTH_URL=http://10.190.54.11:5000/v2.0
export OS_PROJECT_NAME=kkrol
export OS_USERNAME=kkrol
export OS_PASSWORD=Dupa123!
export OS_IDENTITY_API_VERSION=2

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
