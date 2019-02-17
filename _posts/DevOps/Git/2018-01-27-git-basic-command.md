---
layout: post
title: Git Basic Command
date: 2018-01-27 17:47:15.000000000 +08:00
type: post
categories: [DevOps, Git]
author: yylhome
---


## Git Basic Commands

    $ git config --list

    $ git config --global color.ui true

### Adds all new or modified files

    $ git add --all (-a)

### Remove file

    $ git rm (untracked and remove real file)

    $ git rm --cached (only untracked)

### Show Unstaged difference with current files

    $ git diff (HEAD)

    $ git diff --staged

    $ git diff master branch1

### dd all changes from all tracked files

    $ git commit -a(—amend) -m "comments"

### Undo a commit, move head one behind  

    $ git reset —-soft HEAD^

If don’t commit, just HEAD

    $ git reset —-hard HEAD^

### Show remote URL
    $ git remote -v


### Push to remote

    $ git push -u(—set-up-steam) origin master (master:master)

    $ git push origin branch1:branch2 (local:remote)

### Clone Repo

    $ git clone url new_name

### Create Branch

    $ git checkout branch_name

    $ git checkout -b name (create branch and switch to it)

### List branches

    $ git branch
    $ git branch -r (list remote branch)
    $ git branch -a (all)

### Fetch remote branch to local

    $ git fetch
    $ git branch name origin/branchname

### Show remote details

    $ git remote show origin (show details)

### Push and delete remote brach

    $ git push origin branch_name (push branch)

    $ git push origin :branch_name (delete remote branch)

    $ git remote prune origin (clean up remote branch’s)

### Switch and merge branch    

    $ git checkout name (local files will changed)

    $ git checkout master

    $ git merge branch_name (merge branch into master)

If nothing new in the master, this will give a fast-forward merge

    $ git branch -d branch_name (delete branch, after merge)

If have new commits in the master, this will give a recursive merging, that produces a merge commit ....... (git log)

### History

    $ git log —-oneline —-graph —-all

Git pull = git fetch and git mete origin/master

### Tag to commit (after commited, before push commit)

    $ git tag (list all tags)

    $ git tag v0.0.3

    $ git tag -a v0.0.3 -m “version 0.0.3” (add a new tags)

    $ git push origin -—tags (push all tags)

### rebase vs merge

local vs remote

* git rebase (it puts the different away first, then on top of remote master and branches, then commit the different. It does not merge remote to a new commit when new has new commit but without conflicts, but when conflicts, all rebase and merge require dealing with conflict first)

* git merge (merge local and remote master and branch, when remote has new commits, create an merge commit)

Branch vs Branch

Suppose you are in master branch

* git merge branch (merge branch with master to together, create a new commit if they have different commits without conflicts, a fast-forward if one branch have not new commits)

  $ git log —oneline —all —graph can see the branch log (two branch links together on the new merge commits)

* git rebase branch (put different commits away from the branch , commit all new commits from master in branch, then commit the different)

  $ git log will see, two branch become as one branch

### Other settings

    $ git config —global color.ui true

    $ git config —global core.editor emacs

    $ git config —global merge.tool opendiff

    $ git config —list

    $ git log --oneline --stat
