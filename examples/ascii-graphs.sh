#!/bin/bash

#.-------------------------------------------------------------------------.#
#. ascii-graphs.sh                                                         #
#.                                                                          #
#. Copyright (C) 2014 LAFKON/Benjamin Stephan                               #
#.                                                                          #
#.                                                                          #
#. ascii-graphs.sh is free software: you can redistribute it and/or modify #
#. it under the terms of the GNU General Public License as published by     #
#. the Free Software Foundation, either version 3 of the License, or        #
#. (at your option) any later version.                                      #
#.                                                                          #
#. ascii-graphs.sh is distributed in the hope that it will be useful,      #
#. but WITHOUT ANY WARRANTY; without even the implied warranty of           #
#. MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     #
#. See the GNU General Public License for more details.                     #
#.                                                                          #
#.-------------------------------------------------------------------------.#

#NOTE: Negative graph-points (in elastic and back) are currently not
#      displayed properly. They appear on position 0 (first character)


  EASE=../easing.sh
  source $EASE
  
  SIZE=50
  GRAPHPOINT='•'
  FILLBEFORE='`'
  FILLAFTER='.'  
  
  # for every easing-function in easing.sh, do...
  for FUNC in `grep "^function.*{$" $EASE | \
	    sed 's/function //g' | \
	    sed 's/ {//g' | \
	    grep _ease \
	    # | egrep "back|quad|quint"
	    `
  do
    echo '->'$FUNC
    for i in $(seq 0 $SIZE)
    do
      VAL=`$FUNC $i 0 $SIZE $SIZE`
      VAL=`echo "scale=0; $VAL/1" | bc -l`
      TO=$((VAL-1))
      printf "$FILLBEFORE%0.s" $(seq 0 $TO)
      printf "$GRAPHPOINT"
      TO=$((VAL+2))
      printf "$FILLAFTER%0.s" $(seq $TO $SIZE)
      echo ""
    done  
    echo ""
  done
