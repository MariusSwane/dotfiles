#############################
#   Environment VAriables  ##
#############################
export EDITOR="vim"
export PATH="$HOME/.local/bin:$PATH"
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_BMS='c:~/.config/;j:/run/media/OSDisk/Users/mariussw/ARC_Project Dropbox/;k:/run/media/OSDisk/;h:~/'
export NNN_PLUG='m:nmount;f:fzcd;o:fzopen;e:suedit;i:preview-tui'

##############################
#####    ALIASES    ##########
##############################
alias update='pamac update'
alias install='pamac install'
alias nm='neomutt'
alias v='vim'
alias n='nnn -cax'
alias wall='$HOME/Scripts/wall'
alias pui='sudo pacman -Syu'
alias p='sudo pacman'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'
alias mkdir='mkdir -pv'
alias ls="ls -hN --color=auto --group-directories-first" 
alias grep="grep --color=auto"
alias diff="diff --color=auto" 
alias ccat="highlight --out-format=ansi"
alias dotfile='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Pywal colors
cat ~/.cache/wal/sequences
