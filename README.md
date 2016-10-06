sh.ease
=======
**[Robert Penner's handy easing equations](http://robertpenner.com/easing/) for  [bash](http://www.gnu.org/software/bash/)**



## Examples
Check the **examples** directory in this repository.

- `svgCheatSheet.sh` - script to generate a cheatsheet as svg (the one you see below)
- `ascii-graphs.sh` - script to plot character-based easing-graphs to terminal


## Usage
```bash
#!/bin/bash

#include easing-functions
source easing.sh

quad_easeIn $time $begin $change $duration
quad_easeOut $time $begin $change $duration
quad_easeInOut $time $begin $change $duration
...

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


## Prerequisites
Nothing any unix-like system (UNIX / GNU/Linux / OS X) shouldn't come with    
- `bash` - http://www.gnu.org/software/bash/
- `bc` - http://en.wikipedia.org/wiki/Bc_(programming_language)

Explicitly tested on GNU/Linux (Ubuntu 14.04 LTS/Debian 7.4) and OS X (10.6.2/10.8.5)

## License
[GNU General Public License v3](http://www.gnu.org/licenses/gpl-3.0.txt)

##Reference
![CheatSheet](https://rawgit.com/b3nson/sh.ease/master/examples/cheatsheet.svg)

[Robert Penner's Easing Functions](http://www.robertpenner.com/easing/)
