read -p 'Add commit message :' commit_message

status="git status"
eval $status
add="git add ."
eval $add
commit="git commit -m '$commit_message'"
eval $commit
pu="git push"
eval $pu

git_id="eval $(ssh-agent -s)"
#eval $git_id

git_set="ssh-add ~/.ssh/id_rsa"
#eval $git_set


deploy="bundle exec cap production deploy"
eval $deploy

