#!/bin/bash

A=$1; shift
B=$1; shift
DIFF=$1; shift

cp $A /tmp/diffA.html
bin/untidy -q -utf8 -mn -asxml /tmp/diffA.html
tail -n +3 /tmp/diffA.html | sed "s/<pre>/<pre xml:space='preserve'>/g" > /tmp/,diffA.html

cp $B /tmp/diffB.html
bin/untidy -q -utf8 -mn -asxml /tmp/diffB.html
tail -n +3 /tmp/diffB.html | sed "s/<pre>/<pre xml:space='preserve'>/g" > /tmp/,diffB.html

java -jar /usr/local/DeltaXMLCore-7_0_1_j/command.jar compare xhtml /tmp/,diffA.html /tmp/,diffB.html $DIFF

rm -f /tmp/diffA.html /tmp/,diffA.html /tmp/diffB.html /tmp/,diffB.html
