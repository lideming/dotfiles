# The fish version of bashrc in my dotfiles.git
# Place this file in ~/.config/fish/conf.d/

function load-bashrc
	source ~/.config/fish/conf.d/bashrc.fish
end

function sudokwrite
	env EDITOR=kwrite sudoedit $argv
end

function sudocode
	env EDITOR='code -w' sudoedit $argv
end

function gcc-run
  set output "$1.obj"
  if [ -d bin ]; then
    set output "bin/$output"
  end
	gcc $1 -o "$output" && "./$output"
end

function tcc-run
  tcc -run "$1"
end

function mkcd
	mkdir "$1"
	cd "$1"
end

alias cl='clear'

alias ls='ls --color'
alias la='ls -a'
alias ll='ls -l'
alias llh='ls -lh'
alias lla='la -l'

alias lsblk='lsblk -o +fstype,label,uuid'

alias dog=cat

function set-dotnet-vars
  set DOTNET_BASE (dotnet --info | grep 'Base Path' | awk '{print $3}')
  echo "DOTNET_BASE: $DOTNET_BASE"
  
  set DOTNET_ROOT (echo $DOTNET_BASE | sed -E 's/^(.*)(\/sdk\/[^\/]+\/)$/\1/')
  echo "DOTNET_ROOT: $DOTNET_ROOT"
  
  export MSBuildSDKsPath=$DOTNET_BASE"Sdks/"
  export DOTNET_ROOT=$DOTNET_ROOT
  export PATH="$DOTNET_ROOT:$PATH"
end
