# Dotfiles
A collection of my dotfiles

## Prerequisites
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## Getting Started
1. [Creating a personal access token for the command line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
2. Use the following `curl` command to download the desired dot file
```
TOKEN="<INSERTACCESSTOKENHERE>"
OWNER="n7down"
REPO="dotfiles"
PATH="<FILE>"
FILE="https://api.github.com/repos/$OWNER/$REPO/contents/$PATH"

curl --header 'Authorization: token $TOKEN' \
     --header 'Accept: application/vnd.github.v3.raw' \
     --remote-name \
     --location $FILE
```
