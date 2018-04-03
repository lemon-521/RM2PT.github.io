---
layout: post
title: Git Basic Command
date: 2018-01-27 17:47:15.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Git]
tags: []
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: ''
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>Git config —list</p>
<p>git config —golobal color.ui true</p>
<p>git add —all (-a) // adds all new or modified files</p>
<p>git diff (HEAD)// show unstaged difference with current files</p>
<p>git diff —staged</p>
<p>git diff master branch1</p>
<p>git commit -a(—amend) -m “comments” // add all changes from all tracked files</p>
<p>git reset —soft HEAD^ //undoing a commit, move head one behind</p>
<p>git reset —hard HEAD^ (If don’t commit, just HEAD)</p>
<p>git remote -v</p>
<p>git push -u(—set-up-steam) origin master (master:master)</p>
<p>git push origin branch1:branch2 (local:remote)</p>
<p>&nbsp;</p>
<p>git clone url new_name</p>
<p>git branch branch_name (create branch)</p>
<p>git branch -b name (create branch and switch to it)</p>
<p>git branch -r (list remote branch)</p>
<p>git branch -b name origin/branchname (fetch remote branch to local)</p>
<p>git remote show origin (show details)</p>
<p>&nbsp;</p>
<p>git push origin branch_name (push branch)</p>
<p>git push origin :branch_name (delete remote branch)</p>
<p>git remote prune origin (clean up remote branch’s)</p>
<p>git checkout name (local files will changed)</p>
<p>&nbsp;</p>
<p>git checkout master</p>
<p>git merge branch_name (merge branch into master)</p>
<p>If nothing new in the master, this will give a fast-forward merge</p>
<p>git branch -d branch_name (delete branch, after merge)</p>
<p>If have new commits in the master, this will give a recursive merging, that is a merge commit ....... (git log)</p>
<p>git log —oneline —graph —all</p>
<p>Git pull = git fetch and git mete origin/master</p>
<p>&nbsp;</p>
<p>git tag (list all tags)</p>
<p>git tag -a v0.0.3 -m “version 0.0.3” (add a new tags)</p>
<p>git push —tags (push tags)</p>
<p>&nbsp;</p>
<p>git fetch</p>
<p>rebase vs merge</p>
<p>local vs remote</p>
<p>git rebase (it puts the different away first, then on top of remote master and branches, then commit the different. It does not merge remote to a new commit when new has new commit but without conflicts, but when conflicts, all rebase and merge require dealing with conflict first)</p>
<p>git merge (merge local and remote master and branch, when remote has new commits, create an merge commit)</p>
<p>Branch vs Branch</p>
<p>Suppose you are in master branch</p>
<p>git merge branch (merge branch with master to together, create a new commit if they have different commits without conflicts, a fast-forward if one branch have not new commits)</p>
<p>git log —oneline —all —graph can see the branch log (two branch links together on the new merge commits)</p>
<p>git rebase branch (put different commits away from the branch , commit all new commits from master in branch, then commit the different)</p>
<p>git log will see, two branch become as one branch</p>
<p>git config —global color.ui true</p>
<p>git config —global core.editor emacs</p>
<p>git config —global merge.tool opendiff</p>
<p>git config —list</p>
<p>git log —oneline —stat</p>
<p>git rm (untracked and remove real file)</p>
<p>git rm —cached (only untracked)</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
