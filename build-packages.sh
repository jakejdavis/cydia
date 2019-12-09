#!/bin/bash
if test -f "Packages.bz2"; then
    rm Packages.bz2
fi
dpkg-scanpackages -m ./debs > Packages
bzip2 -k Packages
