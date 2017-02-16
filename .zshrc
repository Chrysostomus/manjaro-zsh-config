
# "command not found" hook that will automatically search the official repositories, when entering an unrecognized command. 
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Use autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


## Options section
setopt correct          	                                     	# Auto correct mistakes
setopt extendedglob     	                                     	# Extended globbing. Allows using regular expressions with *
setopt nocaseglob       	                                     	# Case insensitive globbing
setopt rcexpandparam    	                                     	# Array expension with parameters
setopt nocheckjobs      	                                     	# Don't warn about running processes when exiting
setopt numericglobsort  	                                     	# Sort filenames numerically when it makes sense
setopt nohup            	                                     	# Don't kill processes when exiting
setopt nobeep           	                                     	# No beep
setopt appendhistory    	                                     	# Immediately append history instead of overwriting
setopt histignorealldups                                       	# If a new command is a duplicate, remove the older one
setopt autocd 				                                          # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true								              # automatically find new executables in path 
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
export EDITOR=/usr/bin/nano


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key
# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word							                        #
bindkey '^[Od' backward-word						                        #
bindkey '^[[1;5D' backward-word						                      #
bindkey '^[[1;5C' forward-word						                      #
bindkey '^H' backward-kill-word						                      # delete previous word with ctrl+backspace

## Alias section 
alias sudo='sudo '
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias x='startx ~/.xinitrc'                                     # Type name of desired desktop after x, xinitrc is configured for it
alias repoup='repo-add local-repo.db.tar.gz *.pkg.tar.*'


## Theming section  
autoload -U compinit colors zcalc
colors
# This command initializes zsh-completions:
compinit

# Set the window title based on command run
function preexec() {
  title "$1" "%m(%35<...<%~)"
}

function title() {
  # Escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\e]2;$a@$2\a" # plain xterm title
    print -Pn "\ek$a\e\\"      # screen title (in ^A")
    print -Pn "\e_$2   \e\\"   # screen location
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$a@$2\a" # plain xterm title
    ;;
  esac
}

# Prompt similar to default bash prompt, or redhat zsh prompt with colors
PROMPT="%{$fg[green]%}[%n@%m %1~]%{$reset_color%}%(!.#.$) "

# Right prompt with exit status of previous command if not successful
RPROMPT="%{$fg[red]%}%(?..[%?])%{$reset_color%}"
# Right prompt with exit status of previous command marked with ✓ or ✗
#RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Base16 Shell color themes.
# Possible themes: 3024, apathy, ashes, atelierdune, atelierforest, atelierhearth, atelierseaside, bespin, brewer, chalk, codeschool, 
#                  colors, default, eighties, embers, flat, google, grayscale, greenscreen, harmonic16, isotope, londontube, marrakesh, 
#                  mocha, monokai, ocean, paraiso, pop (dark only), railscasts, shapesifter, solarized, summerfruit, tomorrow, twilight
theme="eighties"

# Possible shades: dark and light
shade="dark"

# Start to use the Base16 Shell color, if theme and shade name exist
BASE16_SHELL="/usr/share/zsh/scripts/base16-shell/base16-$theme.$shade.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
