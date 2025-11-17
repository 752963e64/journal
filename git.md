# Git is powerful hard to tame 😸

## branching changes

```
# You are very careful about the use case from your roaming needs...
# you decide to pull the very last version(full version at the time you pick it) from the repo
git clone <repo> --depth 1
# you move in, cd <folder> is skipped... I dunno even why I do speak about it...
# make your own branch to work outside the upstream repo.
git checkout -b <ownbranch>
# from there you are into your realm you can perform your modification...
git add <files,folders>
git commit -m "<message>"
# push changes
git push --set-upstream origin <ownbranch>
# commit message wrong?
git pull --rebase origin <ownbranch>
git commit --amend
git push --force --set-upstream origin <ownbranch>
# more changes?
git pull --rebase origin <ownbranch>
# no sure this works need test
# make changes then git add
git add <files,folders>
git commit --amend
# then push
git push --force --set-upstream origin <ownbranch>
```

# YaY
