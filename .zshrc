# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                             
# Automatically cd into typed directory.
setopt autocd

# Disable ctrl-s to freeze terminal.
stty stop undef	

# Interactive comments
setopt interactive_comments

# Flex on newbs
printf "\n"
pfetch

# If not running interactively, don't flex
[[ $- != *i* ]] && return

# History
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Enable vim-keys
bindkey -v

# Completion nicked from Brodie
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

# Completion from history
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Launching Spaceship with Antigen
source /usr/share/zsh/share/antigen.zsh
antigen theme denysdovhan/spaceship-prompt

# Spaceship settings
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true

# Autosuggest
antigen bundle zsh-users/zsh-autosuggestions

# Strategies to use to fetch a suggestion
# Will try each strategy in order until a suggestion is returned
(( ! ${+ZSH_AUTOSUGGEST_STRATEGY} )) && {
	typeset -ga ZSH_AUTOSUGGEST_STRATEGY
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)
}

antigen apply

#############################
#   Environment Variables  ##
#############################
export EDITOR="nvim"
export BROWSER="qutebrowser"
export TERMINAL="kitty"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_Data_HOME="$HOME/.local/share"
export PATH="$HOME/scripts:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.wine/drive_c/users/username/Desktop:$HOME/.emacs.d/bin:$PATH"
export NNN_BMS='c:~/.config/;m:/run/media/;h:~/;w:~/work/;r:~/work/R/;p:~/work/POL2012/'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='m:nmount;f:fzcd;o:fzopen;e:suedit;p:preview-tabbed;i:preview-tui'
export NNN_COLORS='1234' 
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export YTFZF_CONFIG_DIR=$HOME/.config/ytfzf
export ACCESS_KEY='SRJIpDVJ4V9T9RmThcH1'
export EMAIL_ADDRESS='marius.wishman@ntnu.no'
export NOT_CRAN='TRUE'
export PF_INFO="ascii os host kernel pkgs memory wm shell editor palette"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
#export QT_STYLE_OVERRIDE="Adwaita-Qt"
export QT_QPA_PLATFORMTHEME=qt5ct

##############################
#####    ALIASES    ##########
##############################
alias nm='neomutt'
alias abook="abook --datafile $XDG_DATA_HOME/abook/addressbook"
alias nv='nvim'
alias nb='newsboat'
alias pui='sudo pacman -Syu'
alias p='paru'
alias cp='cp -riv'
alias mv='mv -iv'
alias rm='rm -rvI'
alias mkdir='mkdir -pv'
alias ls="ls -hN --color=auto --group-directories-first" 
alias grep="grep --color=auto"
alias diff="diff --color=auto" 
alias ccat="highlight --out-format=ansi"
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias lf='lfub'
alias tc='tty-clock -c'
alias ncmp='ncmpcpp ; yams'
alias mpdas="mpdas -d -c $XDG_CONFIG_HOME/mpdasrc"
#alias cc="CALCURSE_CALDAV_PASSWORD=$(pass show seedboxes.cc | head -n1) calcurse-caldav"
alias SUAW='potato -s -w 45 -b 15 | toilet -t -f "ANSI Shadow"'
alias yt='ytfzf --subs=1 -t'
alias zathura='devour zathura'
alias sxiv='devour sxiv'

# Pywal colors
(cat ~/.cache/wal/sequences &)

# Icons-in-terminal
#source ~/.local/share/icons-in-terminal/icons_bash.sh

# lf icons
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=❗:\
*.txt=✍️:\
*.mom=✍️:\
*.me=✍️:\
*.ms=✍️:\
*.png=🖼️:\
*.webp=🖼️:\
*.ico=🖼️:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼️:\
*.svg=🖼️:\
*.tif=🖼️:\
*.tiff=🖼️:\
*.xcf=🖌️:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨️:\
*.java=♨️:\
"

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

