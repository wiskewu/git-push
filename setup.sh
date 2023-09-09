#!/user/bin/env bash
# author: github.com/wiskewu
# date: 2023/09/09

E=$HOME/.bash_profile
D=$HOME/.bashrc
BIN=$HOME/bin
if [ ! -f $E ]; then
    touch $E && echo 'test -f ~/.bashrc && . ~/.bashrc' >> $E;
fi
if [ ! -f $D ]; then
    touch $D;
elif grep -q "alias gp=\"gp.sh\"" "$D"; then
    echo "[GP] already been set."
    cp -f gp.sh $BIN
    exit 0;
fi

echo '
# set alias for git-push
export PATH=$PATH:~/bin
alias gp="gp.sh"
' >> $D && source $D

if [ ! -d "$BIN" ]; then
    mkdir $BIN
    if [ "$?" != "0" ]; then
        echo "[GP] error occured at making directory ~/bin" 1>&2
        exit 1;
    fi
fi

cp -f gp.sh $BIN
if [ "$?" = "0" ]; then
    echo "[GP] setup gp successfully. now you can use \"gp\" on your terminal."
    exit 0;
fi