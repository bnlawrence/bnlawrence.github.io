rsync -v --recursive --exclude='.git/' --filter "protect ./git" --delete-after _site/ ../github-deployed
cd ../github-deployed
git add --all *
