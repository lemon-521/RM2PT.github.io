---
layout: post
title: Git Basic Command
date: 2018-01-27 17:47:15.000000000 +08:00
type: post
categories: [DevOps, Git]
author: yylhome
---

git config —list

git config —golobal color.ui true

git add —all (-a) // adds all new or modified files

git diff (HEAD)// show unstaged difference with current files

git diff —staged

git diff master branch1

git commit -a(—amend) -m “comments” // add all changes from all tracked files

git reset —soft HEAD^ //undoing a commit, move head one behind

git reset —hard HEAD^ (If don’t commit, just HEAD)

git remote -v

git push -u(—set-up-steam) origin master (master:master)

git push origin branch1:branch2 (local:remote)



git clone url new_name

git checkout branch_name (create branch)

git checkout -b name (create branch and switch to it)

git branch -r (list remote branch)

git branch -b name origin/branchname (fetch remote branch to local)

git remote show origin (show details)

git push origin branch_name (push branch)

git push origin :branch_name (delete remote branch)

git remote prune origin (clean up remote branch’s)

git checkout name (local files will changed)

git checkout master

git merge branch_name (merge branch into master)

If nothing new in the master, this will give a fast-forward merge

git branch -d branch_name (delete branch, after merge)

If have new commits in the master, this will give a recursive merging, that is a merge commit ....... (git log)

git log —oneline —graph —all

Git pull = git fetch and git mete origin/master

git tag (list all tags)

git tag -a v0.0.3 -m “version 0.0.3” (add a new tags)

git push —tags (push tags)

git fetch


rebase vs merge

local vs remote

git rebase (it puts the different away first, then on top of remote master and branches, then commit the different. It does not merge remote to a new commit when new has new commit but without conflicts, but when conflicts, all rebase and merge require dealing with conflict first)

git merge (merge local and remote master and branch, when remote has new commits, create an merge commit)

Branch vs Branch

Suppose you are in master branch

git merge branch (merge branch with master to together, create a new commit if they have different commits without conflicts, a fast-forward if one branch have not new commits)

git log —oneline —all —graph can see the branch log (two branch links together on the new merge commits)

git rebase branch (put different commits away from the branch , commit all new commits from master in branch, then commit the different)

git log will see, two branch become as one branch

git config —global color.ui true

git config —global core.editor emacs

git config —global merge.tool opendiff

git config —list

git log —oneline —stat

git rm (untracked and remove real file)

git rm —cached (only untracked)
