# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                             
#The following lines were added by compinstall

#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle ':completion:*' file-sort name
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' original true
#zstyle ':completion:*' verbose true
#zstyle :compinstall filename '/home/mariuswis/.zshrc'
#
#autoload -Uz compinit
#compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
#setopt extendedglob
# End of lines configured by zsh-newuser-install

# Enable colors and change prompt:
autoload -U colors && colors

# Custom promt
#PROMPT='%F{green}%n%F{white}@%m %(?..%?) %3~> '
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(?..%? )%~%{$fg[red]%}] >%b "

# Automatically cd into typed directory.
setopt autocd

# Disable ctrl-s to freeze terminal.
stty stop undef	

# Interactive comments
setopt interactive_comments

# Flex on newbs
printf "\n"
neofetch

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
compinit
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

# Spaceship Prompt
#autoload -U promptinit; promptinit
#prompt spaceship

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

antigen apply

# NNN Stuff
nnn_cd()                                                                                                   
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi  
}

trap nnn_cd EXIT

#############################
#   Environment Variables  ##
#############################
export EDITOR="nvim"
export TERMINAL="kitty"
export PATH="$HOME/scripts:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.wine/drive_c/users/username/Desktop:$PATH"
#export NNN_OPENER=home/mariussw/.config/nnn/plugins/nuke
export NNN_BMS='c:~/.config/;k:/run/media/;h:~/'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='m:nmount;f:fzcd;o:fzopen;e:suedit;p:preview-tabbed;i:preview-tui'
export NNN_COLORS='1234' 
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export BW_SESSION="FdY38AHlf9+yDciqwUxWmZ1nuxacTCRRXBF9AhODvfTS3VBmEsu9AFK1iHGRFtwuVhIoQxVFENbfGd2sPBUURQ=="

##############################
#####    ALIASES    ##########
##############################
alias nm='neomutt'
alias nv='nvim'
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
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias starti3='startx $HOME/.i3/.xinitrc'
alias startsowm='startx $HOME/.sowm/.xinitrc'
alias f='fff'
alias n='nnn -eaxP i'
#alias r='ranger'
alias arc='autorandr -c'
alias ttyc='tty-clock -c'
alias ncmp='ncmpcpp ; yams'
alias mpdas='mpdas -d -c .config/mpdasrc'

# Pywal colors
cat ~/.cache/wal/sequences

# Icons-in-terminal
#source ~/.local/share/icons-in-terminal/icons_bash.sh

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

PATH="/home/mariussw/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mariussw/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mariussw/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mariussw/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mariussw/perl5"; export PERL_MM_OPT;
