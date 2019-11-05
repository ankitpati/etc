# Append to the history file, don’t overwrite it
shopt -s histappend

# Debian-specific wrappers for `less`
eval "$(SHELL='/bin/sh' lesspipe)"

# Ubuntu-specific colourful prompt
PS1='${debian_chroot:+($debian_chroot)}[\u@\h \W]\$ '
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

eval "$(dircolors -b)"
