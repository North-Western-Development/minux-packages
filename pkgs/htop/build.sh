#!/bin/sh
set -e

(
cd src
./autogen.sh
./configure --host="$_TARGET" --prefix=/usr
"$_MAKE" -j"$_JOBS"
mkdir -p "$_PKGROOT/pkg/usr/bin"
cp htop "$_PKGROOT/pkg/usr/bin"
)

"$_TARGET-strip" pkg/usr/bin/htop

mkdir -p "pkg/usr/share/licenses/$_PKGNAME"
cp src/COPYING "pkg/usr/share/licenses/$_PKGNAME"

cp -r DEBIAN pkg
sed -e "s|@DPKGARCH@|$_DPKGARCH|" DEBIAN/control > pkg/DEBIAN/control
dpkg-deb -b --root-owner-group -Zgzip pkg "$_PKGNAME.deb"
