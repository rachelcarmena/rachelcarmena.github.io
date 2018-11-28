#!/bin/bash

for cover in `ls img/cards/posts/**/cover.{png,jpg}`
do 
    thumbnail=`dirname $cover`/thumb.`basename $cover`
    if [ ! -f $thumbnail ]; then 
        convert -thumbnail x140 $cover $thumbnail
    fi 
done
