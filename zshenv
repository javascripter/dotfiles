if [ -e ~/.profile ]; then
  source ~/.profile
fi
if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH
fi
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin/:$PATH
