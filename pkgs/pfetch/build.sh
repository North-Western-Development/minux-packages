#!/bin/sh
set -e

mkdir -p pkg/usr/bin
cp src/pfetch pkg/usr/bin

mkdir -p "pkg/usr/share/licenses/$_PKGNAME"
cp src/LICENSE "pkg/usr/share/licenses/$_PKGNAME"

cp -r DEBIAN pkg
dpkg-deb -b --root-owner-group -Zgzip pkg "$_PKGNAME.deb"
