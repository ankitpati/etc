mesg n || true

function sanitize_path
{
    # Utility function to sanitize PATH-like specifications.
    # Do not allow
    # 1. repeated elements,
    # 2. repeated, starting, or ending `:`, and
    # 3. repeated `/`.
    echo -n "$1" | awk -v 'RS=:' -v 'ORS=:' '!seen[$0]++' \
                 | sed 's/::*/:/g' | sed 's/^://' | sed 's/:$//' \
                 | sed 's_//*_/_g'
}

export PERL_CPANM_OPT='--mirror https://cpan.metacpan.org/'
export PERLBREW_CPAN_MIRROR='https://cpan.metacpan.org/'
export PERL5LIB="$HOME/lib/perl5/"
export PYENV_ROOT="$HOME/.pyenv/"
export NPM_PACKAGES="$HOME/.npm/packages/"
export SDKMAN_DIR="$HOME/.sdkman/"
export DOTNET_CLI_TELEMETRY_OPTOUT='1'
export POWERSHELL_TELEMETRY_OPTOUT='1'
export ANDROID_HOME="$HOME/Android/Sdk/"

shopt -s histappend
export HISTSIZE=''
export HISTFILESIZE=''
export HISTCONTROL='ignoreboth'
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

export EDITOR='vim'
export MERGE='vimdiff'

manpath="$MANPATH"
unset MANPATH
export MANPATH="$(sanitize_path "$manpath:$(manpath)")"

alias tree='tree -I ".git|node_modules"'
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
