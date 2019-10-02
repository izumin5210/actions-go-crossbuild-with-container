#!/bin/sh -l

name="$1"
package="$2"
dest="$3"
arch="$4"
os="$5"
ldflags="$6"
tags="$7"

goxz \
  -arch="${arch}" \
  -os="${os}" \
  -build-ldflags="${ldflags}" \
  -build-tags="${tags}" \
  -d="${dest}" \
  -n="${name}" \
  ${package}
