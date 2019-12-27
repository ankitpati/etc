mesg n || true

function sanitize_path
{
    # Utility function to sanitize PATH-like specifications.
    # Do not allow repeated elements, repeated, starting, or ending `:`.
    echo -n "$1" | awk -v 'RS=:' -v 'ORS=:' '!seen[$0]++' \
                 | sed 's/::*/:/g' | sed 's/^://' | sed 's/:$//'
}

export PERL_CPANM_OPT='--mirror https://cpan.metacpan.org/'
export PERLBREW_CPAN_MIRROR='https://cpan.metacpan.org/'
export PYENV_ROOT="$HOME/.pyenv"
export POWERSHELL_TELEMETRY_OPTOUT='1'

export HISTSIZE=''
export HISTCONTROL='ignorespace:ignoredups'

alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -I .git'
alias cpan-outdated='cpan-outdated --mirror="$PERLBREW_CPAN_MIRROR"'
alias podchecker='podchecker -warnings -warnings -warnings'
alias bat='bat --paging=never --style=plain --wrap=never --'
alias tohex="hexdump -ve '1/1 \"%.2x\" '"
alias unchomp='sed -i -e \$a\\ '
alias ssh='exec ssh'
alias telnet='exec telnet'
alias mosh='exec mosh'
alias git-sh='exec git-sh'
alias ssh-copy-id='ssh-copy-id -oPasswordAuthentication=yes'

function _git_pick
{
    _git_branch
}

function _git_publish
{
    _git_branch
}

function _git_files
{
    _git_branch
}
