# 什么是gp？

`gp` 是 `git push`的首字母组合。用于解决在新建一个分支时并提交commit到远程仓库时，烦人的提示"fatal: 当前分支 master 没有对应的上游分支"。

`gp`将自动使用与本地待提交分支相同的分支名设置远端仓库分支，并推送代码至远端分支。

实际上就是自动运行了一遍`git push -u <remote-name> <branch-name>`。

## 使用

拉取仓库到本地-进入文件夹-执行初始化脚本

```bash
# install
git clone git@github.com:wiskewu/git-push.git
cd git-push
bash setup.sh

# usage
# 假设你的仓库是 xx-repo 新分支名是 dev/test
cd xx-repo
# 使用 gp 代替git push
gp
```

## License

MIT.
