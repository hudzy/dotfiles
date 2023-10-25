#  ╭──────────────────────────────────────────────────────────╮
#  │                         Commons                          │
#  ╰──────────────────────────────────────────────────────────╯
plugins=(
  # pre-bundled plugin
  docker
  docker-compose
  git
  git-flow
  kubectl
  tmux
  fzf
  # third-party plugin
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
)

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Oh-my-zsh
## misc
export ZSH="$HOME/.oh-my-zsh"
export ZSH_DISABLE_COMPFIX="true"
export ZSH_THEME="powerlevel10k/powerlevel10k"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="true"
export TERM='xterm-256color'
export EDITOR=nvim
export VISUAL="$EDITOR"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BAT_THEME="Monokai Extended"
source $ZSH/oh-my-zsh.sh

## History file configuration
setopt appendhistory     # Append history to the history file (no overwriting)
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed
export HISTSIZE=80000
export SAVEHIST=50000
export PROMPT_COMMAND='history -a; history -n' # sync history accross sessions

## fix broken cursor control
export WORDCHARS=''
bindkey "^u" backward-kill-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

#  ╭──────────────────────────────────────────────────────────╮
#  │                           PATH                           │
#  ╰──────────────────────────────────────────────────────────╯
# ${PATH:+${PATH}:} - use case explain: https://unix.stackexchange.com/a/267513

# use brew installed binaries
export PATH="/usr/local/opt/tcl-tk/bin:/usr/local/opt/sqlite/bin:/usr/local/opt/m4/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/openldap/bin:/usr/local/opt/openssl@3/bin:/usr/local/opt/curl/bin:$PATH"

# add custom kube plugins
export PATH=$PATH:~/.kube/plugins

# add custom commands and binaries
export PATH=$PATH:~/workdir/bin

# add JAVA_HOME: /usr/libexec/java_home -V
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

# remove duplicate path variable entries created by tmux: https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html#:~:text=typeset%20%2DU%20PATH%20path
typeset -U PATH path

#  ╭──────────────────────────────────────────────────────────╮
#  │                         Plugins                          │
#  ╰──────────────────────────────────────────────────────────╯
# zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c5c5c,bold,underline"
autoload -U compinit && compinit -u

# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --no-ignore --follow --type f ."
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="fd --hidden --no-ignore --follow ."
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always {}" --height ~80% --layout=reverse --border --select-1 --exit-0'
export FZF_CTRL_R_OPTS='--height 80% --layout=reverse --border'

# fzf-tab
zstyle ':fzf-tab:*' fzf-pad 4
zstyle ':fzf-tab:*' fzf-min-height 4

# tmux
alias tnew='tmux -f ~/.tmux.conf new-session \; split-window -h \; split-window -v \; attach'
unalias tmux

# init zoxide
eval "$(zoxide init zsh)"
alias j=z
