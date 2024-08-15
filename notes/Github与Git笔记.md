

# Github与Git笔记

使用Desktop创建新repository的时候会自己创建文件夹。因此不要文件夹套文件夹。（我可能使用了错误的方法，正确的方法可能是选择文件夹然后创建库）

注意:Github上的MD必须**空一行才算换行**。

## 参考文献

https://docs.github.com/en/desktop

https://www.runoob.com/git/git-tutorial.html

Pro Git 官方手册中的一章，可学习：Distributed-Git-Maintaining-a-Project https://git-scm.com/book/en/v2/Distributed-Git-Maintaining-a-Project

## 功能学习

Cherry-pick：部分代码变动。用于多人协作，别人在更新，你也在更新。 https://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html
https://docs.github.com/en/desktop/managing-commits/cherry-picking-a-commit-in-github-desktop

Squash：Github可以压缩提交commits

tag用于release的标注

`rebase`：https://juejin.cn/post/7038093620628422669

checkout commit：用于在不新建Branch的情况下查看和debug某个版本。不能修改。

`reset`: https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified
https://blog.csdn.net/qq_39852676/article/details/129094985 后果是会损失之后的commits

`merge`的两种模式：

- git fast-forward总结 https://www.cnblogs.com/mengff/p/15514944.html
- 8.Git merge之 Fast Forward和 No Fast Forward(--no-ff方式)解析 https://blog.csdn.net/lzb348110175/article/details/93479318

## 问题与案例

Working Folder不对劲（版本错乱）怎么办？可以在Github Desktop右键文件（此处应该为三区中的缓冲区）并使用Discard Changes。对应到Git似乎就是`git checkout`。Git三区介绍：https://www.linkedin.com/pulse/staging-area-git-bridge-between-working-directory-repository

git 的`rebase`、`reset`、`revert`区别？https://blog.csdn.net/study_way/article/details/135319451

git如何丢弃/删除末尾的几个commit？（非必要操作）

- GitHub Desktop remove last two commits https://stackoverflow.com/questions/59066993/github-desktop-remove-last-two-commits
- 如何删除 Github 上的项目的某一个 commit? https://notes.iissnan.com/2013/delete-specific-commit-git/
- GitHub 删除某次 commit https://blog.csdn.net/lianshaohua/article/details/108336436
- Git强制推送本地分支到远程仓库 https://www.mulianju.com/git-push-force/