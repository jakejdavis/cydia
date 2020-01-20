#!/bin/bash
find . -name ".DS_Store" -delete
cd debs
for f in *; do
    if [ -d "$f" ]; then
       echo $f
       dpkg-deb -b $f > Packages
    fi
done
cd ..
if test -f "Packages.bz2"; then
    rm Packages.bz2
fi
dpkg-scanpackages -m ./debs > Packages
bzip2 -k Packages
