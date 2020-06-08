# `source` this file in ~/.bashrc

function load-bashrc {
	source ~/.bashrc
}

function sudokwrite {
	EDITOR=kwrite sudoedit $*
}

function gcc-run {
  output="$1.obj"
  if [ -d bin ]; then
    output="bin/$output"
  fi
	gcc $1 -o "$output" && "./$output"
}

function mkcd {
	mkdir "$1"
	cd "$1"
}

alias cl='clear'

alias ls='ls --color'
alias la='ls -a'
alias ll='ls -l'
alias llh='ls -lh'
alias lla='la -l'

alias lsblk='lsblk -o +fstype,label,uuid'

function set-dotnet-vars {
  DOTNET_BASE=$(dotnet --info | grep "Base Path" | awk '{print $3}')
  echo "DOTNET_BASE: ${DOTNET_BASE}"
  
  DOTNET_ROOT=$(echo $DOTNET_BASE | sed -E "s/^(.*)(\/sdk\/[^\/]+\/)$/\1/")
  echo "DOTNET_ROOT: ${DOTNET_ROOT}"
  
  export MSBuildSDKsPath=${DOTNET_BASE}Sdks/ 
  export DOTNET_ROOT=$DOTNET_ROOT
  export PATH=$DOTNET_ROOT:$PATH
}
