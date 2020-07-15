#!/bin/bash
header=../page-elements/header.html
footer=../page-elements/footer.html

#links fix
sed1="s/href=\"style.css\"/href=\"..\/style.css\"/g"
sed2="s/href=\"images\/site\/favicon.png\"/href=\"..\/images\/site\/favicon.png\"/g"
sed3="s/src=\"images\/site\/icon.png\"/src=\"..\/images\/site\/icon.png\"/g"
sed4="s/href=\"contact.html\"/href=\"..\/contact.html\"/g"
sed5="s/href=\"index.html\"/href=\"..\/index.html\"/g" 

for content in $(ls ../articles-src -1 | grep .html)
do
	cd ../articles-src/
	
        url_title=$(basename $content .html)
	output=../articles/$url_title.html
	title=$(head -n 1 $content | cut -c 5- | rev | cut -c 6- | rev)
	title+=" - Penguin's Daydreams"

	new_header=$(cat $header | sed "s/<title><\/title>/<title>$title<\/title>/g" | sed $sed1 | sed $sed2 | sed $sed3 | sed $sed4 | sed $sed5)

	if [ -f $output ] ; then
		cat /dev/null > $output
	else
		touch $output
	fi

	echo $new_header >> $output
	cat $content >> $output
	cat $footer >> $output
done
