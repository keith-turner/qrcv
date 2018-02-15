#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input> <output>.mp4"
fi

input=$(readlink -f $1)
output=$(readlink -f $2)

tmpdir=$(mktemp -d)

cd "$tmpdir"

# can split up to 2892 bytes, making bigger qrcodes per frame
split -b 504 $input 

counter=0

for f in *; do
    out=$(printf '%04d.png' $counter)
    seq=$(printf '%08x' $counter)
    echo -n $seq | cat - "$f" | qrencode -8 -o $out
    let counter=counter+1
done

ffmpeg -framerate 7 -i '%04d.png' -c:v libx264 -r 30 "$output"

# TODO remove safely
# rm -rf "$tmpdir"
