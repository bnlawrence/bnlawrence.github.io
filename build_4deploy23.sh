
# Make sure the existing container is stopped, you need a new
# container to ensure you rebuild with the deployment config
export JEKYLL_VERSION=3.8
docker run --name bjekyll --rm \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/../usr_local_bundle:/usr/local/bundle" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  bundle exec jekyll build --config _config-deploy.yml
rsync -v --recursive --exclude='.git/' --filter "protect ./git" --delete-after _site/ ../github-deployed
cd ../github-deployed
git add --all *