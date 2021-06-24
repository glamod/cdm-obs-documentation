#!/bin/bash

apt-get update
apt-get -y install git rsync python3-sphinx python3-sphinx-rtd-theme graphviz texlive

# Build documentation
# ===================
make -C ./docs clean # clean previous version
#./build_tables.sh # we need to update code tables (this pulls tables from another repo, converts etc)
make -C ./docs html # now build the docs

# setup environment
# =================
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "dyb@noc.ac.uk"

# create temporary directory to work in
working_directory=`mktemp -d`

# copy docs to working directory and cd there
rsync -av "docs/build/html/" "${working_directory}/"
pushd "${working_directory}" # use pushd so we can return to current directory easily

# now set up
git init
git remote add deploy "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git checkout -b docs
touch .nojekyll
# add readme
cat > README.md <<EOF
Branch containing documentation for repo.
EOF

# add pages to repo
git add .

# commit new files
git commit -am "update of pages"

# deploy
git push deploy docs --force

# return to start dir
popd

# now exit
exit 0
