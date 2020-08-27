#############################
#   Environment VAriables  ##
#############################
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$HOME/.wine/drive_c/users/username/Desktop:$PATH"
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_BMS='c:~/.config/;j:/run/media/OSDisk/Users/mariussw/ARC_Project Dropbox/Marius Wishman/;k:/run/media/;h:~/'
export NNN_PLUG='m:nmount;f:fzcd;o:fzopen;e:suedit;i:preview-tui'

##############################
#####    ALIASES    ##########
##############################
alias update='pamac update'
alias install='pamac install'
alias nm='neomutt'
alias v='vim'
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

# Pywal colors
cat ~/.cache/wal/sequences

###########################
#####   Bindings    #######
###########################
bind --user \e\t forward-char
