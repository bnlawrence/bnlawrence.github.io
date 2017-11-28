This was lost :-(

Things I now have to do

jekyll build --config _config-deploy.yml
rsync -v --recursive --exclude='.git/' --filter "protect ./git" --delete-after _site/ ../github-deployed

cd ../github-deployed
git add -all *
git commit -m "New Build"
git status
git push
