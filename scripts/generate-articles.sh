#!/bin/bash
header=../page-elements/header.html
footer=../page-elements/footer.html
content=../articles-src/Lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html
title=abcd
output=../articles/$title.html
touch $output
#part1=$(cat $header | cut -d '%' -f 2)
title=$(head -n 1 $content | cut -c 4- | rev | cut -c 6- | rev)
title+=" - Penguin's Daydreams"
part1=$(cat $header | sed "s/<title><\/title>/<title>$title<\/title>/g")
echo $part1
#IFS='%' read -a array <<< $(cat $header)
#echo $part1
#echo "${array[0]}"
#cat $(cat $header | sed "s/<title><\/title>/<title>$title<\/title>/g") >> $output
#cat $header >> $output
#cat $content >> $output
#cat $footer >> $output
