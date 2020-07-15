#!/bin/bash
header=../page-elements/header.html
footer=../page-elements/footer.html
output=../index.html

new_header=$(cat $header | sed "s/<title><\/title>/<title>Penguin's Daydreams<\/title>/g")
echo $new_header > $output

echo "<h5><strong>Articles</strong></h5>" >> $output

for content in $(ls ../articles-src -1 | grep .html)
do
	cd ../articles-src/
	
        url_title=$(basename $content .html)
	href="articles/$url_title.html"
	title=$(head -n 1 $content | cut -c 5- | rev | cut -c 6- | rev)
	
	echo "<a href=\"$href\">$title</a><br>" >> $output
	
done

cat $footer >> $output
