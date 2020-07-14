#!/bin/bash
header=../page-elements/header.html
footer=../page-elements/footer.html

for content in $(ls ../articles-src -1 | grep .html)
do
	cd ../articles-src/
	
        url_title=$(basename $content .html)
	output=../articles/$url_title.html
	title=$(head -n 1 $content | cut -c 5- | rev | cut -c 6- | rev)
	title+=" - Penguin's Daydreams"

	new_header=$(cat $header | sed "s/<title><\/title>/<title>$title<\/title>/g")

	if [ -f $output ] ; then
		cat /dev/null > $output
	else
		touch $output
	fi

	echo $new_header >> $output
	cat $content >> $output
	cat $footer >> $output
done
