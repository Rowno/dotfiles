#!/usr/bin/env zsh

npm config set sign-git-tag true
yarn config set version-sign-git-tag true

npm install -g \
  npm \
  @rowno/generator-node \
  depcheck \
  diff-so-fancy \
  emoj \
  fkill-cli \
  is-online-cli \
  now \
  np \
  react-benchmark \
  serve \
  source-map-explorer \
  speed-test \
  tcpie \
  to-ico-cli \
  trash-cli \
  webpack-bundle-analyzer \
  webpack-bundle-size-analyzer \
  yo
