# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
fcd() {
  local dir
  dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf +m) && cd "$dir"
}

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Auto capitalize
autoload -Uz compinit && compinit

# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	aliases
	)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration
alias python=python3

# Obsidian

# Create new note with date + file name in vault
on() {
  if [ -z "$1" ]; then
    echo "Error: A file name must be set"
    return
  fi
  file_name=$(echo "$1" | tr ' ' '-')
  formatted_file_name=${file_name}_$(date "+%Y-%m-%d").md
  # formatted_file_name=${file_name}.md
  cd "/Users/metinyalcinkaya/Documents/Obsidian/Main/"
  touch "inbox/${formatted_file_name}"
  nvim "inbox/${formatted_file_name}"
}

# Processes and categorizes files from uncategorized folder
og() {
  VAULT_DIR="/Users/metinyalcinkaya/Documents/Obsidian/Main"
  SOURCE_DIR="uncategorized"
  DEST_DIR="notes"

  find "$VAULT_DIR/$SOURCE_DIR" -type f -name "*.md" | while read -r file; do
    echo "Processing $file"
    tag=$(awk '/tags:/{getline; print; exit;}' "$file" | sed -e 's/^ *- *//' -e 's/^ *//;s/ *$//')
    echo "Found tag $tag"
    if [ ! -z "$tag" ]; then
      TARGET_DIR="$VAULT_DIR/$DEST_DIR/$tag"
      mkdir -p "$TARGET_DIR"

      mv "$file" "$TARGET_DIR"
      echo "Moved $file to $TARGET_DIR"
    else
      echo "No tag found for $file"
    fi
  done
  echo "Done!"
}

# Obsidian review
alias or="nvim $HOME/Documents/Obsidian/Main/inbox/*.md"

if command -v 'tmux' >/dev/null; then
  # Start tmux.
  alias tm='tmux'

  # Attach to a tmux session.
  alias tma="tmux attach-session"

  # Attach to a tmux session with name.
  alias tmat="tmux attach-session -t"

  # Kill all tmux sessions.
  alias tmks='tmux kill-session -a'

  # List tmux sessions.
  alias tml='tmux list-sessions'

  # Start a new tmux session.
  alias tmn="tmux new-session"

  # Start a new tmux session with name.
  alias tmns="tmux new -s"

  # Start a new tmux session.
  alias tms='tmux new-session -s'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:$HOME/go/bin
