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

#git clone git@github.com:Kashoo/chef-repo.git
#git clone git@github.com:Kashoo/books.git
#git clone git@github.com:Kashoo/marketplace-integration.git
#git clone git@github.com:Kashoo/oauth2-provider.git
#git clone git@github.com:Kashoo/bovine.git
#git clone git@github.com:Kashoo/tools.git
#git clone git@github.com:Kashoo/invoice-payment-service.git
#git clone git@github.com:Kashoo/blobstore.git
#git clone git@github.com:Kashoo/sync-oauth2.git
#git clone git@github.com:Kashoo/exchange-rate-service.git
#git clone git@github.com:Kashoo/service-repo-coordinator.git
#git clone git@github.com:Kashoo/ops-tools.git
