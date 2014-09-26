#!/bin/bash

#.-------------------------------------------------------------------------.#
#. svgCheatSheet.sh                                                         #
#.                                                                          #
#. Copyright (C) 2014 LAFKON/Benjamin Stephan                               #
#.                                                                          #
#.                                                                          #
#. svgCheatSheet.sh is free software: you can redistribute it and/or modify #
#. it under the terms of the GNU General Public License as published by     #
#. the Free Software Foundation, either version 3 of the License, or        #
#. (at your option) any later version.                                      #
#.                                                                          #
#. svgCheatSheet.sh is distributed in the hope that it will be useful,      #
#. but WITHOUT ANY WARRANTY; without even the implied warranty of           #
#. MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     #
#. See the GNU General Public License for more details.                     #
#.                                                                          #
#.-------------------------------------------------------------------------.#


  EASE=../easing.sh
  source $EASE

  SVG=cheatsheet.svg
  
  COUNT=0
  pwidth=595
  pheight=1500
  ygap=8
  xgap=1
  gwidth=$(( pwidth / 3 ))
  gheight=$(( (pheight / 11) -ygap))

  
  echo starting SVG
  echo "<?xml version=\"1.0\" standalone=\"no\"?>" | tr -s ' '		 > $SVG
  echo "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \
        \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">"|tr -s ' '>> $SVG
  echo "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" \
        width=\"${pwidth}px\" height=\"$((pheight+20))px\" \
        xmlns:xlink=\"http://www.w3.org/1999/xlink\">" | tr -s ' '	>> $SVG
  echo "<title>sh.ease cheat sheet</title>" | tr -s ' '			>> $SVG
  echo "<desc>penner easing equations for bash</desc>" | tr -s ' '	>> $SVG
  echo "<defs><style type=\"text/css\"><![CDATA[text {font-family: \
        Helvetica,Arial,Verdana,sans-serif;font-size:9px;}]]> \
        </style></defs>" | tr -s ' '					>> $SVG
  
  echo "<rect x=\"0\" y=\"0\" width=\"$pwidth\" \
        height=\"$((pheight+20))\" fill=\"#fff\" 
        stroke=\"none\" />" | tr -s ' '					>> $SVG
  echo "<g id=\"headline\" transform=\"translate(0, 14)\">" | tr -s ' '	>> $SVG
  echo "<text x=\"28\" y=\"40\" style=\"font-size:40px; \
        font-weight:bold;\">sh.ease</text>" | tr -s ' '			>> $SVG
  echo "<text x=\"182\" y=\"40\" style=\"font-size:12px; \
        font-weight:bold;\">CHEAT SHEET</text>"	| tr -s ' '		>> $SVG
  echo "<text x=\"30\" y=\"52\" style=\"font-size:11px;\"> \
        Robert Penner's handy easing equations for bash
        </text>" | tr -s ' '						>> $SVG
  echo "<line x1=\"30\" y1=\"60\" x2=\"$((pwidth-30))\" y2=\"60\" \
        style=\"stroke:black; stroke-width:1px;\" />" | tr -s ' '	>> $SVG
  echo "</g>" | tr -s ' '						>> $SVG
  
  echo "<g id=\"graphs\" transform=\"translate($((pwidth/2)),$((pheight/2))) \
	scale( .9 ) translate($((-pwidth/2)), \
        $((-pheight/2)))\">" | tr -s ' '				>> $SVG
  
  # for every easing-function in easing.sh, do...
  for FUNC in `grep "^function.*{$" $EASE | \
	    sed 's/function //g' | \
	    sed 's/ {//g' | \
	    grep _ease \
	    # | egrep "bounce|quad|quint"
	    `
  do
    # draw the graph-box/graph-title/...
    echo "  drawing" $FUNC
    echo "<g id=\"$FUNC\" transform=\"translate( $((gwidth * (COUNT % 3)  )), \
          $((gheight*(COUNT / 3) + ygap*(COUNT / 3) +20 )) )\
          \">"| tr -s ' '						>> $SVG
    echo "<rect x=\"$((xgap/2))\" y=\"-12\" width=\"$(( gwidth-(xgap) ))\" \
          height=\"10\" fill=\"#fff\" opacity=\".6\" \
          stroke=\"none\" />" | tr -s ' '				>> $SVG 
    echo "<text x=\"$((xgap/2))\" y=\"-3\" \
          style=\"font-style:italic;\">$FUNC</text>" | tr -s ' '	>> $SVG
    echo "<rect x=\"$((xgap/2))\" y=\"0\" width=\"$(( gwidth-(xgap) ))\" \
          height=\"$((gheight-ygap))\" fill=\"#eee\" opacity=\".7\" \
          stroke=\"none\"/>" | tr -s ' ' 				>> $SVG
    echo "<path style=\"fill:none;stroke:#0088ff;stroke-width:1px; \
          stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1\" \
          d=\"M "| tr -s ' ' 						>> $SVG
    
    # draw the graph (cut to two decimal digits)
    for (( x=0; x<=$(( gwidth-xgap )); x+=4 ))
    do
      GRAPH="$GRAPH $((x+xgap/2)) "`$FUNC $((x)) \
      $((gheight-ygap)) -$((gheight-ygap)) \
      $(( gwidth-xgap )) | awk '{printf("%.2f\n",$1)}'` 
    done
    
    echo $GRAPH | fold -s -w 200 >> $SVG
    GRAPH=""
    echo "\"/>" >> $SVG
    echo "</g>" >> $SVG

    COUNT=$((COUNT+1))
  done
 
  echo "</g>" >> $SVG
  
  echo "<g id=\"footer\" transform=\"translate($((pwidth/2)), $((pheight/2))) \
        scale( .9 ) translate($((-pwidth/2)), $((-pheight/2))) \
        translate(0,$((pheight+20)))\">" | tr -s ' ' 			>> $SVG
  echo "<line x1=\"0\" y1=\"-5\" x2=\"$((pwidth))\" y2=\"-5\" \
        style=\"stroke:#000; stroke-width:1px;\" />" | tr -s ' '	>> $SVG
  echo "<rect x=\"0\" y=\"6\" width=\"$(( pwidth ))\" height=\"50\" \
        fill=\"#ccc\" opacity=\".7\" stroke=\"none\" />" | tr -s ' '	>> $SVG
  echo "<text x=\"30\" y=\"28\" style=\"font-size:11px;\"> \
        Download, usage and examples on<tspan style=\"font-weight:bold;\"> \
        http://github.com/b3nson/sh.ease</tspan></text >" | tr -s ' '	>> $SVG
  echo "<text x=\"30\" y=\"40\" style=\"font-size:11px;\"> \
        This sheet was generated by the bashscript \"<tspan \
        style=\"font-weight:bold;\">svgCheatSheet.sh</tspan>\", which can be \
        found in the examples-directory</text>" | tr -s ' '		>> $SVG
  echo "</g>" 								>> $SVG
  
  echo "</svg>" 							>> $SVG
  echo finished!
  echo saved to $SVG
  
  #display $SVG
