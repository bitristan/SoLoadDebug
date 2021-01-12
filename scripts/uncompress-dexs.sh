#!/bin/bash

# Usage: sh uncompress.sh source.apk
# 
# 在source.apk中寻找*.dex文件，如果存在并且压缩了的话，那么将其导出，并以不压缩的方式重新打包

zipinfo $1 '*.dex' 2>/dev/null | grep -v ' stor ' >/dev/null
if [ $? -ne 0 ]; then
    echo "dex is stored, no need to uncompress, exit."
else
    echo "dex is deflate, uncompress it."
    rm -rf $1.tmpdir && mkdir $1.tmpdir
    unzip -q $1 '*.dex' -d $1.tmpdir
    zip -qd $1 '*.dex'
    (cd $1.tmpdir && find . -type f | sort | zip -qD -X -0 ../$1 -@)
    rm -rf $1.tmpdir
    echo "success uncompress, output file is $1."
fi
