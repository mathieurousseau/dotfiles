# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_IGNORED=(
# 	sporty_256
# 	geoffgarside
# 	linuxonly
# 	alanpeabody
# 			
# )

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
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

if [ ! -f "/etc/arch-release" ]; then
  eval "$(/opt//homebrew/bin/brew shellenv)"
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
	git
	macos
	asdf
	brew
	docker
	fzf-tab
	)

if [ -f "/etc/arch-release" ]; then
  # FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
else
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
autoload -Uz compinit add-zsh-hook
compinit
source $ZSH/oh-my-zsh.sh

# bindkey -M menuselect '^M' .accept-line
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh


if [ -f "/etc/arch-release" ]; then
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
else
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

GIT_EDITOR='nvim'
VISUAL='nvim'

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
export DIRENV_LOG_FORMAT=""
# if [ -f /etc/arch-release ]; then
#   export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# else
#   export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# fi

conditional_asdf() {
  if [[ -f .tool-versions ]]; then
    # remove any existing asdf entries then prepend them
    path=(${path:#$HOME/.asdf/shims})
    path=(${path:#$HOME/.asdf/bin})
    path=($HOME/.asdf/shims $HOME/.asdf/bin $path)
  else
    # remove asdf entries when not in a project with .tool-versions
    path=(${path:#$HOME/.asdf/shims})
    path=(${path:#$HOME/.asdf/bin})
  fi
}

# run on directory change and before prompt (covers cd and other cases)
add-zsh-hook chpwd conditional_asdf
add-zsh-hook precmd conditional_asdf

conditional_asdf

eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



alias gfs='git fetch && git status'

alias mixw='mix test.watch --seed=0 '
alias icat="kitten icat"

alias clean_staging_repo='git branch  | grep -v staging | xargs git branch -D'
alias repo_clean="git branch --merged develop | grep -v develop | xargs  git branch --delete"

alias c_nvim="NVIM_APPNAME=c_nvim nvim"
alias f_nvim="NVIM_APPNAME=f_nvim nvim"
alias lvim="NVIM_APPNAME=lazyvim nvim"

export PATH=$PATH:~/.bin

# precmd () {print -Pn "\e]0;tota\a"}
# precmd () {print -Pn "\e]0;tota\a"} 
# unsetopt auto_name_dirs

vip() {
  original_dir=$PWD
  if [ -n "$1" ]; then
    cd "$1"
  fi
  local name="${2:-$(basename "$PWD")}"   # 2nd arg wins, else folder name
  print -Pn "\e]0;${name}\a"
  nvim .
  cd "$original_dir"
# ======= mac mini had this
#   print -Pn "\e]0;`basename $PWD`\a"
#   "${EDITOR:-nvim}" .
#   cd $original_dir
# >>>>>>> Stashed changes
}

vil() { vip . "$1"; }   # vil dev_tools  →  open . as tab "dev_tools"

alias mixw="mix test.watch --seed 0"
alias gfs="git fetch && git status"

if [ -f "/etc/arch-release" ]; then
  alias ls='ls --group-directories-first --color=auto'
  eval $(ssh-agent)
else
  alias ls='gls --group-directories-first --color=auto'
fi

git config --global alias.prune-gone '!git fetch --prune && git for-each-ref --format='"'"'%(refname:short) %(upstream:track)'"'"' refs/heads | awk '"'"'$2=="[gone]" && $1!="main" && $1!="master" && $1!="develop" {print $1}'"'"' | xargs -r git branch -d'

git config --global alias.list-gone '!git fetch --prune && git for-each-ref --format='"'"'%(refname:short) %(upstream:track)'"'"' refs/heads | awk '"'"'$2=="[gone]" && $1!="main" && $1!="master" && $1!="develop" {print $1}'"'"''

if [ $USER = "Mathieu.Rousseau" ]; then
  cat << "EOF"
 __    __              ____                                  
/\ \__/\ \            /\  _`\                                
\ \ ,_\ \ \___      __\ \,\L\_\    ___    ___   _ __    __   
 \ \ \/\ \  _ `\  /'__`\/_\__ \   /'___\ / __`\/\`'__\/'__`\ 
  \ \ \_\ \ \ \ \/\  __/ /\ \L\ \/\ \__//\ \L\ \ \ \//\  __/ 
   \ \__\\ \_\ \_\ \____\\ `\____\ \____\ \____/\ \_\\ \____\
    \/__/ \/_/\/_/\/____/ \/_____/\/____/\/___/  \/_/ \/____/
                                                             
EOF

#export GPG_TTY=$(tty)
#GPG_TTY=$(tty) && export GPG_TTY
eval $(ssh-agent)

alias kstg='kubectx | grep "aws*staging" | xargs -I{} kubectx {}'
alias kprd='kubectx | grep production | xargs -I{} kubectx {}'
alias klocal='kubectx docker-desktop'

alias opta_tunnel='kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 443 kubectl -n optimus exec -i {} -- nc api.performfeeds.com 443'
alias optimus_iex='optimus_staging=`kubectl -n optimus  get pods  -o name --no-headers=true` ; kubectl -n optimus exec -t -i $optimus_staging --  /app/bin/optimus remote'

export GPG_TTY=$TTY

alias gcp_mysql_dev='kubectx gke_scoremedia-dev_us-central1-a_scoremedia-dev; kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 7771 kubectl -n optimus exec -i {} -- nc 10.96.5.7 3306'
alias gcp_mysql_staging='kubectx gke_scoremedia-staging_us-central1-a_scoremedia-staging; kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 7772 kubectl -n optimus exec -i {} -- nc 10.96.5.11 3306'
alias gcp_mysql_ps='kubectx gke_scoremedia-ps_us-central1-a_scoremedia-ps; kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 7773 kubectl -n optimus exec -i {} -- nc 10.96.1.239 3306'
alias gcp_postgres_dev='kubectx gke_scoremedia-dev_us-central1-a_scoremedia-dev; kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 8881 kubectl -n optimus exec -i {} -- nc 10.96.1.33 5432'
alias gcp_postgres_staging='kubectx gke_scoremedia-staging_us-central1-a_scoremedia-staging; kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 8882 kubectl -n optimus exec -i {} -- nc 10.96.1.61 5432'
alias gcp_postgres_ps='kubectx gke_scoremedia-ps_us-central1-a_scoremedia-ps; kubectl -n optimus  get pods  -o name --no-headers=true | grep optimus-worker | xargs -I{} sudo tcpserver -v 127.0.0.1 8883 kubectl -n optimus exec -i {} -- nc 10.96.1.231 5432'

alias k_dev='kubectx scoremedia-dev && k9s'
alias k_staging='kubectx scoremedia-staging && k9s'
alias k_ps='kubectx scoremedia-ps && k9s'
alias k_prod='kubectx scoremedia-production && k9s'

alias g_check='./gradlew spotlessCheck'
alias g_apply='./gradlew spotlessApply'
alias g_run='./gradlew quarkusDev'
alias g_test='direnv exec / ./gradlew test'
alias r_test='direnv exec / ./gradlew test  --tests'
alias rr_test='r_test --rerun-tasks'

alias lstr="ls -ltr"

export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/Users/Mathieu.Rousseau/bin/jdk-21.0.6.jdk/Contents/Home"
export PATH="/Users/Mathieu.Rousseau/bin/jdk-21.0.6.jdk/Contents/Home/bin/:$PATH"
export PATH="$PATH:/Applications/IntelliJ IDEA CE.app/Contents/MacOS"
export PATH="$PATH:/opt/homebrew/opt/libpq/bin"
export PATH="/Users/Mathieu.Rousseau/.local/share/bob/nvim-bin:$PATH"
fi


# if [ $USER = "mathieu"  ]; then
#   cat << "EOF"
#   
#  ███▄ ▄███▓ ▄▄▄     ▄▄▄█████▓ ██░ ██  ██▓▓█████  █    ██ 
# ▓██▒▀█▀ ██▒▒████▄   ▓  ██▒ ▓▒▓██░ ██▒▓██▒▓█   ▀  ██  ▓██▒
# ▓██    ▓██░▒██  ▀█▄ ▒ ▓██░ ▒░▒██▀▀██░▒██▒▒███   ▓██  ▒██░
# ▒██    ▒██ ░██▄▄▄▄██░ ▓██▓ ░ ░▓█ ░██ ░██░▒▓█  ▄ ▓▓█  ░██░
# ▒██▒   ░██▒ ▓█   ▓██▒ ▒██▒ ░ ░▓█▒░██▓░██░░▒████▒▒▒█████▓ 
# ░ ▒░   ░  ░ ▒▒   ▓▒█░ ▒ ░░    ▒ ░░▒░▒░▓  ░░ ▒░ ░░▒▓▒ ▒ ▒ 
# ░  ░      ░  ▒   ▒▒ ░   ░     ▒ ░▒░ ░ ▒ ░ ░ ░  ░░░▒░ ░ ░ 
# ░      ░     ░   ▒    ░       ░  ░░ ░ ▒ ░   ░    ░░░ ░ ░ 
#        ░         ░  ░         ░  ░  ░ ░     ░  ░   ░     
#                                                          
# EOF
#
#   export PATH=$PATH:/Users/mathieu/development/flutter/bin:/Users/mathieu/Library/Android/sdk/platform-tools/
#   alias postgres="/opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14"
# fi




if [[ -e /etc/arch-release && $USER = "mathieu" && $HOST = "arch" ]]; then
  cat << "EOF"
  
 ███▄ ▄███▓ ▄▄▄     ▄▄▄█████▓ ██░ ██  ██▓▓█████  █    ██     ▄▄▄▄   ▄▄▄█████▓ █     █░
▓██▒▀█▀ ██▒▒████▄   ▓  ██▒ ▓▒▓██░ ██▒▓██▒▓█   ▀  ██  ▓██▒   ▓█████▄ ▓  ██▒ ▓▒▓█░ █ ░█░
▓██    ▓██░▒██  ▀█▄ ▒ ▓██░ ▒░▒██▀▀██░▒██▒▒███   ▓██  ▒██░   ▒██▒ ▄██▒ ▓██░ ▒░▒█░ █ ░█ 
▒██    ▒██ ░██▄▄▄▄██░ ▓██▓ ░ ░▓█ ░██ ░██░▒▓█  ▄ ▓▓█  ░██░   ▒██░█▀  ░ ▓██▓ ░ ░█░ █ ░█ 
▒██▒   ░██▒ ▓█   ▓██▒ ▒██▒ ░ ░▓█▒░██▓░██░░▒████▒▒▒█████▓    ░▓█  ▀█▓  ▒██▒ ░ ░░██▒██▓ 
░ ▒░   ░  ░ ▒▒   ▓▒█░ ▒ ░░    ▒ ░░▒░▒░▓  ░░ ▒░ ░░▒▓▒ ▒ ▒    ░▒▓███▀▒  ▒ ░░   ░ ▓░▒ ▒  
░  ░      ░  ▒   ▒▒ ░   ░     ▒ ░▒░ ░ ▒ ░ ░ ░  ░░░▒░ ░ ░    ▒░▒   ░     ░      ▒ ░ ░  
░      ░     ░   ▒    ░       ░  ░░ ░ ▒ ░   ░    ░░░ ░ ░     ░    ░   ░        ░   ░  
       ░         ░  ░         ░  ░  ░ ░     ░  ░   ░         ░                   ░    
                                                                  ░                   
EOF


wopen() {
  XDG_RUNTIME_DIR=/run/user/$(id -u) \
  WAYLAND_DISPLAY=${WAYLAND_DISPLAY:-wayland-0} \
  DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus \
  "$@" >/dev/null 2>&1 &
}

screenshot_select() {
  emulate -L zsh

  local prefix="sshot_"
  local ext="png"
  local max=0
  local file number

  for file in ${prefix}[0-9][0-9][0-9][0-9].${ext}(N); do
    number=${file#${prefix}}
    number=${number%.${ext}}
    (( 10#$number > max )) && max=$((10#$number))
  done

  grim -g "$(slurp)" "${prefix}$(printf '%04d' $((max + 1))).${ext}"
}

alias sshot='screenshot_select'

export PATH="/home/mathieu/.local/bin:/home/mathieu/dev/flutter/bin:/home/mathieu/dev/bin:$PATH"
export PATH="/home/mathieu/.local/share/bob/nvim-bin:$PATH"



fi

if [[ $USER = "mathieu" && ${HOST:l} == mac*mini* ]]; then
  cat << "EOF"
███╗   ███╗ █████╗  ██████╗    ███╗   ███╗██╗███╗   ██╗██╗
████╗ ████║██╔══██╗██╔════╝    ████╗ ████║██║████╗  ██║██║
██╔████╔██║███████║██║         ██╔████╔██║██║██╔██╗ ██║██║
██║╚██╔╝██║██╔══██║██║         ██║╚██╔╝██║██║██║╚██╗██║██║
██║ ╚═╝ ██║██║  ██║╚██████╗    ██║ ╚═╝ ██║██║██║ ╚████║██║
╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝
EOF

  export EDITOR="/Users/mathieu/.local/share/bob/v0.11.7/bin/nvim"
  export VISUAL="$EDITOR"
  export GIT_EDITOR="$EDITOR"
  alias nvim="$EDITOR"
  export PATH=$PATH:/Users/mathieu/dev/flutter/bin

fi
