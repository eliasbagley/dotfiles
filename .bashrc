export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Utilities for quickly accessing frequently used directories in bash.

source ~/.fzf.bash
