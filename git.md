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

## git clone git@localhost:git 😸

An interesting document about **ssh** and **git** that permit to keep track from literally everything you do on your computer(s).

### preparation

- You need a running ssh server listening at localhost

- You need an user called git, this where the bare repos will remain.

```sh
ssh-keygen
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/hackit/.ssh/id_ed25519):
Enter passphrase for "/home/*****/.ssh/id_ed25519" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/*****/.ssh/id_ed25519
Your public key has been saved in /home/****/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:***************************************************** ****@****
The key's randomart image is:
+--[ED25519 256]--+
|         .+...   |
|       o Ooo..   |
|      o B O.o    |
|     . = O =     |
|    . o S * o    |
|     o * + . o   |
|      @ + + +    |
|     + @   =     |
|     .*.o   ..E  |
+----[SHA256]-----+
```

```sh
ssh-copy-id git@llocalhost
```

From now you can tweak git user access

```sh
# as root
cat > /home/git/.ashrc <<EOF
echo "Oh nooz, no chocolate for you."
exit 0
EOF
```

You need point this ```~/.ashrc``` at loading from profile script.


Type directly in your shell 😸

```sh
# to preserve the function just store it into your ashrc 😙
git.init() {
  mkdir "$1"
  cd "$1"
  git init --bare
  cd ..
  scp -r ./"$1" git@localhost:
  rm -rf "$1"
  git clone git@localhost:"$1" 
  cd "$1"
  ls -alsh
}
```

### example usage

```sh
git.init stuffed
echo "# Yes we can" > README
git add README
git commit -m "add README"
git push
```

cloning an existing repo

```sh
git clone git@localhost:REPONAME
cd REPONAME
```

Now you are a professional!

# what else 😸
