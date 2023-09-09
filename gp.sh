#!/user/bin/env bash
# author: github.com/wiskewu
# date: 2023/09/09
# version: V0.0.1

ERR_CODE="128"
CUR_REMOTE=
CUR_BRANCH=`git branch --show-current`
if [ "$?" = $ERR_CODE ]; then
    echo "[GP] current folder (or parent folder) is not a git repo" 1>&2
    exit 1;
fi
git push
RES="$?"
if [ $RES = "0" ]; then
    exit 0;
elif [ $RES = $ERR_CODE ]; then
    CUR_REMOTE=`git remote show`
else
    echo "[GP] Unhandle case. Aborting..." 1>&2
    exit 1;
fi

if [ "$CUR_REMOTE" = "" ]; then
    echo "[GP] remote url not set." 1>&2
    exit 1;
fi
echo "[GP] warning: the current branch $CUR_BRANCH has no upstream branch."
echo "[GP] auto set-upstream..."
git push --set-upstream $CUR_REMOTE $CUR_BRANCH
if [ "$?" = "0" ]; then
    exit 0;
fi
echo "[GP] error occured at set-upstream." 1>&2
exit 1;