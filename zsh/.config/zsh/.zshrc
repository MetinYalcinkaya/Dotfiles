# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

###########
# History #
###########

HIST_STAMPS="yyyy/mm/dd"
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
export HISTSIZE=10000
export SAVEHIST=10000
export SHELL_SESSIONS_DISABLE=1

###############
# Environment #
###############
export EDITOR="nvim"
export VISUAL="nvim"

export CLICOLOR=1

# Bat colorscheme
export BAT_THEME="tokyonight_night"

# FZF ToykoNight
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

# Use fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

############
# Sourcing #
############
typeset -a sources
sources+="$ZDOTDIR/aliases/aliases" # Aliases
for file in $ZDOTDIR/scripts/*; do
  sources+="$file"
done
# Plugins
sources+="$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # Syntax highlighting
sources+="$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" # Autosuggestions
# Prompt
sources+="$ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme"

for file in $sources[@]; do
  if [[ -a "$file" ]]; then
    source "$file"
  fi
done

#######
# FZF #
#######
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
