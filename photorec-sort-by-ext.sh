#!/bin/bash

recup_dir="${1%/}"

[ -d "$recup_dir" ] || {
    echo "Usage: $0 recup_dir";
    echo "Mirror files from recup_dir into recup_dir.by_ext, organized by extension";
    exit 1
};

find "$recup_dir" -type f | while read k; do
    #ext="${k##*.}";
    ext=$( echo $k | grep -Po "(?!.*\/)(?<=\.).+");
    ext_dir="$HOME/${recup_dir##*/}.by_ext/$ext";
    [ -d "$ext_dir" ] || mkdir -p "$ext_dir";
    echo "${k%/*}"
    ln -s "$k" "$ext_dir";

done
