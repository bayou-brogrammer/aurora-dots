shell=`ps -p $$ | awk 'NR>1  {print $4}' | sed 's/-//g'`
SCRIPT_PATH="$HOME/.fleek"
if ! [ -x "$(command -v brew)" ]; then
  return
fi
case $(basename $shell) in
     "zsh" )
            . $SCRIPT_PATH/zsh/.zshrc
           ;;
     "bash" )
            . $SCRIPT_PATH/bash/.bashrc
           ;;
     * )
           ;;
esac

source $SCRIPT_PATH/scripts.sh

# bat
# bat --plain for unformatted cat
alias catp='bat -p'

# replace cat with bat
alias cat='bat'

# zoxide
# zoxide for smart cd
alias cd='z'

# eza
# eza for ls
alias ls='eza'

# eza for ls -a
alias lsa='eza -a'

# eza for ls
alias ll='eza -l --git --header'

# eza for ls -la
alias lla='eza -la --git --icons --header'

