if [ -e ~/.profile ]; then
  source ~/.profile
fi
if [ -d /opt/local/bin ]; then
  export PATH=/opt/local/bin:$PATH
fi
if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH
fi
if [ -d ~/.cabal/bin ]; then
  export PATH=~/.cabal/bin:$PATH
fi
if [ -d ~/flex_sdk_4/bin ]; then
  export PATH=~/flex_sdk_4/bin:$PATH
fi
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin/:$PATH

if [ -d /Library/Frameworks/HaskellPlatform.framework/bin ]; then
  export PATH=/Library/Frameworks/HaskellPlatform.framework/bin:$PATH
fi

typeset -U PATH

