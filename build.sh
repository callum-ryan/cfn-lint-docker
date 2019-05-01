#!/usr/bin/env bash

Usage() {
  echo "$0 [rebuild]"
}

image="cfn-lint"
repo="awslabs/cfn-python-lint"

latest=`curl -sL -H "Authorization: token ${API_TOKEN}"  https://api.github.com/repos/${repo}/tags |jq -r ".[].name" | grep -v "dev" | head -1|sed 's/^v//'`
echo "${image} - lastest release is: ${latest}"

if [[ $1 == "rebuild"  ]];then
  docker build --build-arg VERSION=$latest -t ${image}:${latest} .
  docker tag ${image}:${latest} ${image}:latest
fi
