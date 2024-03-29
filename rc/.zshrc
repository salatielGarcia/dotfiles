# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/salatiel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode extract fzf ripgrep zsh-interactive-cd)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# SGM config
# ZSH exclusive
autoload -U compinit
# autoload -U colors && colors
autoload -U promptinit && promptinit
# zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# Regular config
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
# set -o vi
alias ls='exa -lh'
alias cat='bat'
alias ..='cd ..'
alias vi=nvim
alias ra=ranger
alias pacman='sudo pacman --color always'
alias rg='rg --color always --column --heading --ignore-case --include-zero --multiline'
alias bat='bat --paging never --color always --decorations always'
# alias nvim='nvim'
alias ed='nvim `fzf`'
alias of='xdg-open `fzf`'
# alias cf='cd `fd -H -t d . | fzf --preview="bat {}" --preview-window=right:50%:wrap --layout=reverse --inline-info`'
alias cf='cd `fd -t d . | fzf `'
mkd(){ mkdir "$1" && cd "$1" ; }
export EDITOR=nvim
# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#     nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
# export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#     nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
export PAGER="nvim -c 'Man!' -o -"
export MANPAGER="nvim -c 'Man!' -o -"
export FZF_DEFAULT_COMMAND="rg --files --glob '!.git/**'"
# export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --margin=10% --preview='bat --paging never --color always --decorations always {}' --preview-window=right:50%:wrap"
export FZF_DEFAULT_OPTS="--preview='bat {}' --preview-window=right:50%:wrap --layout=reverse --inline-info"
export PATH=$PATH:/home/salatiel/scripts/:/home/salatiel/.local/bin/ # Add for nvr revease search in zathura
export PATH=$PATH:/usr/local/MatLab/R2021a/bin/ # Add for nvr revease search in zathura
export JAVA_HOME=/home/salatiel/android-studio/jre/
export PATH=$PATH:/home/salatiel/Android/Sdk/platform-tools/
export PATH=$PATH:/home/salatiel/texlab/target/release/
export LUA_PATH=/home/salatiel/.libs/lua/?.lua
export PYTHONPATH=/home/salatiel/Documents/circuitOptimization/libs/

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias luamake=/home/salatiel/.cache/nvim/nlua/sumneko_lua/lua-language-server/3rd/luamake/luamake


######################################
# Temp elden ring config: REMOVE
alias bak='cp -v /home/salatiel/.steam/steam/steamapps/compatdata/1245620/pfx/drive_c/users/steamuser/Application\ Data/EldenRing/76561198280697366/ER0000.sl2 ~/docs/'
alias rest='cp -v ~/docs/ER0000.sl2 /home/salatiel/.steam/steam/steamapps/compatdata/1245620/pfx/drive_c/users/steamuser/Application\ Data/EldenRing/76561198280697366/'
#####################################
# Temp Matlab config: REMOVE
alias matl="sh ~/.matlab/bin/matlab"
#####################################


eval "$(starship init zsh)"
