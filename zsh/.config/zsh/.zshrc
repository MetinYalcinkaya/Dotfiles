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

##############
# Dir Colors #
##############
# eval "$(gdircolors -b $ZDOTDIR/dircolors)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

###########
# Aliases #
###########
source "$ZDOTDIR/aliases/aliases"

##########
# Prompt #
##########
source "$ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme"

#######
# FZF #
#######
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########
# Plugins #
###########
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # Syntax highlighting
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" # Autosuggestions

autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
