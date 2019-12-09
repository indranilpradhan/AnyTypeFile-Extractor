#!/bin/bash

filename=$1
echo $filename
tar=`echo "$filename" | grep -E -c -i "^.*\.(tar)$"`
tarxz=`echo "$filename" | grep -E -c -i "^.*\.(tar.xz)$"`
targz=`echo "$filename" | grep -E -c -i "^.*\.(tar.gz)$"`
if [[ $targz == 0 ]] ; then
gz=`echo "$filename" | grep -E -c -i "^.*\.(gz)$"`
else
gz=0
fi
tarbz2=`echo "$filename" | grep -E -c -i "^.*\.(tar.bz2)$"`
if [[ $tarbz2 == 0 ]] ; then
bz2=`echo "$filename" | grep -E -c -i "^.*\.(bz2)$"`
else
bz2=0
fi
zip=`echo "$filename" | grep -E -c -i "^.*\.(zip)$"`
sevenz=`echo "$filename" | grep -E -c -i "^.*\.(7z)$"`

if [[ $tar -ge 1 ]] ; then
	tar -xvf "$filename"
elif [[ $tarxz -ge 1 ]] ; then
	tar -xf "$filename"
elif [[ $targz -ge 1 ]] ; then
	tar -xzvf "$filename"
elif [[ $gz -ge 1 ]] ; then
	gunzip "$filename"
elif [[ $tarbz2 -ge 1 ]] ; then
	tar -xjvf "$filename"
elif [[ $bz2 -ge 1 ]] ; then
	bzip2 -d "$filename"
elif [[ $zip -ge 1 ]] ; then
	unzip "$filename"
elif [[ $sevenz -ge 1 ]] ; then
	7z x "$filename"
else
	echo "Unable to extract"
fi
