# Git is powerful hard to tame 😸

## branching changes

```sh
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
## update your repo to include upstream past your work
git pull --rebase origin <ownbranch>
## amend last commit, you should edit the message
git commit --amend
## force push your branch to upstream
git push --force --set-upstream origin <ownbranch>

# more changes?
## update your repo to include upstream past your work
git pull --rebase origin <ownbranch>
# no sure this works need test, it should work if you edit files that didn't change in between your work.
## make changes then git add
git add <files,folders>
git commit --amend
## then push
git push --force --set-upstream origin <ownbranch>

# reset
# If you think your changes are pretty hopeless, you can reset repo with
git checkout -f <master|origin|main>

```

# YaY
