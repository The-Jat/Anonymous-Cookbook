VERSION=5.3.1
TAR=http://www.lua.org/ftp/lua-$VERSION.tar.gz

function recipe_version {
    echo "$VERSION"
    skip=1
}

function recipe_build {
    "$REDOX_MAKE" generic CC="${HOST}-gcc -std=gnu99" -j"$($NPROC)"
    skip=1
}

function recipe_clean {
    "$REDOX_MAKE" clean
    skip=1
}

function recipe_stage {
    mkdir -pv "$1/bin"
    cp src/lua src/luac "$1/bin"
    skip=1
}
