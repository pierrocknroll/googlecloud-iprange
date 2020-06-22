#!/bin/bash

if ! command -v jq > /dev/null 2>&1; then
  echo jq is not available
  exit 1
fi
if ! command -v curl > /dev/null 2>&1; then
  echo curl is not available
  exit 1
fi

curl -s https://www.gstatic.com/ipranges/cloud.json | jq '.prefixes[] | [.ipv4Prefix, .ipv6Prefix][] | select(. != null)' -r
curl -s https://www.gstatic.com/ipranges/goog.txt

