#!/bin/sh
 
git filter-branch -f --env-filter '
OLD_EMAIL="47820316+chirag18B@users.noreply.github.com"
CORRECT_NAME="blockmaven"
CORRECT_EMAIL="blockmaven@gmail.com"
 
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
