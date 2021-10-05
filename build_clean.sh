export JEKYLL_VERSION=3.8
docker run --name bjekyll --rm \
  -d -p 4000:4000 \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/../usr_local_bundle:/usr/local/bundle" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll clean
docker logs -f bjekyll
