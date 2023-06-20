# changes to the config file require stopping the container image
# (and that needs to be done before deployment too)
export JEKYLL_VERSION=3.8
docker run --name bjekyll --rm \
  -d -p 4000:4000 \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/../usr_local_bundle:/usr/local/bundle" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  bundle exec jekyll serve --incremental --host 0.0.0.0
docker logs -f bjekyll
