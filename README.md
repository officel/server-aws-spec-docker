# serverspec, awspec on docker

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

## about

* docker base image ruby:alpine
* [Serverspec](http://serverspec.org/)
* [k1LoW/awspec: RSpec tests for your AWS resources.](https://github.com/k1LoW/awspec)

## Build

```
docker build -t server:spec .

# check
docker images
```

## serverspec

```
# init
docker run -it --rm -v $PWD:/work --entrypoint="/usr/local/bundle/bin/serverspec-init" --name spec server:spec

# check(chown if you want)
tree

# -t
docker run -it --rm -v $PWD:/work --name spec server:spec

# spec
docker run -it --rm -v $PWD:/work --name spec server:spec spec:localhost

# alias(if you use original ss command, use another name)
alias ss='docker run -it --rm -v "$PWD":/work --name spec server:spec'
ss spec
```

## awspec

```
# init
docker run -it --rm -v $PWD:/work --entrypoint="/usr/local/bundle/bin/awspec" --name awspec server:spec init

# check(chown if you want)
tree

# make spec/*_spec.rb
# see https://github.com/k1LoW/awspec#step-3-write-spec_specrb

# make sepc/secrets.yml
# see https://github.com/k1LoW/awspec#2-2-use-secretsyml
# echo "spec/secrets.yml" >> .gitignore
# if you want use $HOME/.aws , use -v

# spec
docker run -it --rm -v $PWD:/work --name awspec server:spec spec

# alias(if you use original as command, use another name)
alias as='docker run -it --rm -v "$PWD":/work --name awspec server:spec'
as spec

```

## spec generate

```bash
docker run -it --rm -v $PWD:/work --entrypoint="/usr/local/bundle/bin/awspec" --name awspec server:spec generate --help
docker run -it --rm -v $PWD:/work --entrypoint="/usr/local/bundle/bin/awspec" --name awspec server:spec generate acm --secrets-path=./spec/secrets.yml > spec/acm_spec.rb
docker run -it --rm -v $PWD:/work --entrypoint="/usr/local/bundle/bin/awspec" --name awspec server:spec generate iam_user --secrets-path=./spec/secrets.yml > spec/iam_user_spec.rb
docker run -it --rm -v $PWD:/work --entrypoint="/usr/local/bundle/bin/awspec" --name awspec server:spec generate iam_group --secrets-path=./spec/secrets.yml > spec/iam_group_spec.rb

```
