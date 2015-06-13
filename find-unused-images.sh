#!/bin/sh

PROJ=`find . -name '*.xib' -o -name '*.[mh]' -o -name '*.storyboard' -o -name '*.mm' -o -name '*.html' `

echo "Looking for in files: $PROJ"

out_put=./$(date)

echo finding unused images is in processing plz wait...
find . -iname '*.png' -print0 | while read -d $'\0' png
do
	name=`basename -s .png "$png"`
	name=`basename -s @2x $name`
	name=`basename -s @3x $name`

	if grep -qhs "$name" $PROJ; then
		echo >>$out_put  "used - $png"
	else
		echo >>$out_put "!!!UNUSED - $png"
	fi
done
echo done
