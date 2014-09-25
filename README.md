sh.ease
=======
[Robert Penner's wonderful easing equations](http://robertpenner.com/easing/) for usage in the [bash](http://www.gnu.org/software/bash/)


## Usage
```bash
#!/bin/bash

#include easing-functions
source easing.sh

quad_easeIn $time $begin $change $duration
quad_easeOut $time $begin $change $duration


#to ease the x-value of something,    
#to make it move from x=50 to x= 250 in 100 steps    
#you would write something like:    

for i in {0..100}
do
  x=`circ_easeOut $i 50 200 100`
  #draw
done
...
```


## Examples
Check the **examples** directory in this repository.

- shellplot.sh
- svgplot.sh


## Prerequisites
[bash](http://www.gnu.org/software/bash/)    
[bc](http://en.wikipedia.org/wiki/Bc_(programming_language))    

tested on GNU/Linux (Ubuntu/Debian) and OS X 10.x


##Reference
http://www.robertpenner.com/easing/

![CheatSheet](https://rawgit.com/b3nson/sh.ease/master/examples/cheatsheet.svg)
