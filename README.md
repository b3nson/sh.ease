sh.ease
=======
[Robert Penner's wonderful easing equations](http://robertpenner.com/easing/) for usage in the [bash](http://www.gnu.org/software/bash/)


sh.ease is a port of Robert Penner's easing equations for the bash.

[Robert Penner's classic easing equations for ActionScript](http://robertpenner.com/easing/)


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


## Prerequisites
[bash](http://www.gnu.org/software/bash/)    
[bc](http://en.wikipedia.org/wiki/Bc_(programming_language))    

tested on GNU/Linux (Ubuntu/Debian) and OS X 10.x


##Reference

http://www.robertpenner.com/easing/
