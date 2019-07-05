#!/bin/sh

if [! -f "/tmp/increment_marker.dupa"]; then
  dupa_count=0
else
  dupa_count=`cat /tmp/increment_marker.dupa`
fi

dupa_count=`expr ${dupa_count} + 1`

# Type the text in
xvkbd -delay 50 -no-repeat -text "dupa_${dupa_count} at $(date +'%H:%M:%S')"

# And save it for next time
echo "${dupa_count}" > /tmp/increment_marker.dupa
