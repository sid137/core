#!/bin/sh

# $Id: youtube.sh 496 2006-06-05 23:37:35Z berto $

if [ "$#" != "1" ]; then
   echo "YouTube Video Downloader"
   echo "Written by Alberto Garcia <agarcia-at-igalia-com>"
   echo "Homepage: http://people.igalia.com/berto/"
   echo
   echo "Usage:"
   echo "   youtube.sh http://www.youtube.com/watch?v=<video_ID>"
   echo " or"
   echo "   youtube.sh <video_ID>"
   echo
   exit 64
fi

VID=$(echo "$1"|sed "s/.*v=\([^&]*\).*/\1/")
URL1="http://www.youtube.com/watch?v=$VID"
echo -n "Getting $URL1 ..."
PARAM="$(wget -q -O - "$URL1"|grep watch_fullscreen|cut -d '&' -f 3)"
echo " done."
URL2="http://www.youtube.com/get_video?video_id=$VID&$PARAM"
echo -n "Getting $URL2 ..."
URL3="$(wget -S "$URL2" 2>&1|sed -n /Location:/s/.*http:/http:/p)"
echo " done."

echo "Video address is $URL3"
exec wget -O "$VID.flv" "$URL3"
