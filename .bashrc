# view changes
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\]$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ENV settings
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:$HOME/bin/"

#general shortcuts
alias la="ls -la"
alias ll="ls -l"
alias lstree="find . -not -path '*/\.*'"

# dotfiles shortcuts
alias vim="nvim"
alias prof="nvim ~/.bash_profile"
alias reprof=". ~/.bash_profile"
alias tconf="nvim ~/.tmux.conf"
alias vimrc="nvim ~/.config/nvim/init.vim"

#file shortcuts
alias cdev="cd ~/dev"

#git shortcuts
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcm="git commit"
alias gcmm="git commit -m"
alias gcl="git clone"
alias gd="git diff"
alias gg="git grep"
alias gl="git log"
alias glo="git log --pretty=oneline"
alias glu="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias ghist="git log --pretty=format:'%Cblue%h%Creset %Cgreen%ad%Creset | %s%C(yellow)%d%Creset [%an]' --graph --date=short --decorate"
alias gr="git remote -v"
alias gra="git remote add"
alias grs="git reset --hard HEAD"
alias grv="git revert"
alias gm="git merge"
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpum="git pull upstream master"
alias gprum="git pull --rebase upstream master"
alias grb="git rebase"
alias gs="git status"

# git go forward/back in commit
alias gback="git checkout HEAD~"
gfwd() {
    git checkout $(git rev-list --topo-order HEAD.."$*" | tail -1)
}

# Haskell / Stack / Cabal / Elm
export STACK_INSTALL_PATH="$HOME/.local/bin/"
export PATH="$PATH:$STACK_INSTALL_PATH"
export PATH="$HOME/.cabal/bin:$PATH"

### GO / GVM
export GOPATH="$HOME/dev/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
alias gowork="cd $GOPATH"
alias gore="cd $GOPATH/src/github.com/trizko"

### Rust
export PATH="$PATH:$HOME/.cargo/bin"

