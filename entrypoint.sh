#!/bin/sh -l

name="$1"
package="$2"
dest="$3"
arch="$4"
os="$5"
ldflags="$6"
tags="$7"
goxz_version="$8"

archive=goxz_${goxz_version}_linux_amd64

curl -L https://github.com/Songmu/goxz/releases/download/${goxz_version}/${archive}.tar.gz | tar xzf -
sudo cp ./${archive}/goxz /usr/local/bin/
rm -rf ./${archive}

goxz \
  -arch="${arch}" \
  -os="${os}" \
  -build-ldflags="${ldflags}" \
  -build-tags="${tags}" \
  -d="${dest}" \
  -n="${name}" \
  ${package}
