#!/bin/bash

pushd ~/.vim/bundle

for i in `ls`; do
  pushd "$i"
  echo "Updating $i"
  git pull
  echo "Completed updating $i"
  popd
done

echo "Completed updating all plugins"
popd
