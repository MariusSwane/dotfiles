#############################
#   Environment Variables  ##
#############################
export EDITOR="nvim"
export PATH="$HOME/Scripts:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.wine/drive_c/users/username/Desktop:$PATH"
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_BMS='c:~/.config/;j:/run/media/OSDisk/Users/mariussw/ARC_Project Dropbox/Marius Wishman/;k:/run/media/;h:~/'
export NNN_PLUG='m:nmount;f:fzcd;o:fzopen;e:suedit;i:preview-tui'
export BW_SESSION="Tno0HMCJs3s3v2fd9xXLowOYxyApOi0j4WS0vQagH9knW6SZSpVwh1Tv/OTsl2LY33WQi8zr8N/Bkvkz611XLg=="

##############################
#####    ALIASES    ##########
##############################
alias update='pamac update'
alias install='pamac install'
alias nm='neomutt'
alias v='nvim'
alias n='nnn -cax'
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
alias starti3='startx $HOME/.i3/.xinitrc'
alias startsowm='startx $HOME/.sowm/.xinitrc'

# Pywal colors
cat ~/.cache/wal/sequences

###########################
#####   Bindings    #######
###########################
bind --user \e\t forward-char
