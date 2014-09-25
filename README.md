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

VAR=`quad_easeOut $time 0 100 100`

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

![CheatSheet](http://raw.githubusercontent.com/b3nson/sh.ease/master/examples/cheatsheet.svg?raw=true)
