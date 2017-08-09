#!/bin/sh

KASHOO_DEV_HOME=~/development/kashoo
mkdir -p "$KASHOO_DEV_HOME"
cd "$KASHOO_DEV_HOME"

git_clone() {
  name=$1
  if [ ! -d "$KASHOO_DEV_HOME/$name" ] ; then
    git clone "git@github.com:Kashoo/$name.git"
  fi
}

git_clone 'chef-repo'
git_clone 'books'
git_clone 'marketplace-integration'
git_clone 'oauth2-provider'
git_clone 'bovine'
git_clone 'tools'
git_clone 'invoice-payment-service'
git_clone 'blobstore'
git_clone 'sync-oauth2'
git_clone 'exchange-rate-service'
git_clone 'service-repo-coordinator'
git_clone 'ops-tools'
git_clone 'kashoo-document-definitions'
