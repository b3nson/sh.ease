#!/bin/bash

PI=3.141592654
OVERSHOOT=1.70158

function assignvars {
	t=$1
	b=$2
	c=$3
	d=$4
	s=$5
	p=$6
}

# LINEAR =============================================================
function linear_easeIn {
	assignvars $1 $2 $3 $4
	echo "$c*$t/$d+$b" | bc -l
}

function linear_easeOut {
	assignvars $1 $2 $3 $4
	echo "$c*$t/$d + $b" | bc -l
}

function linear_easeInOut {
	assignvars $1 $2 $3 $4
	echo "$c*$t/$d + $b" | bc -l
}

# SINE =============================================================
function sine_easeIn {
	assignvars $1 $2 $3 $4
	echo "-1*$c * c($t/$d * ($PI/2)) + $c + $b" | bc -l
}
function sine_easeOut {
	assignvars $1 $2 $3 $4
	echo "$c * s($t/$d * ($PI/2)) + $b" | bc -l
}
function sine_easeInOut {
	assignvars $1 $2 $3 $4
	echo "-1*$c/2 * (c($PI*$t/$d) - 1) + $b" | bc -l
}

# QUAD =============================================================
function quad_easeIn {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`
	echo "$c*$t*$t + $b" | bc -l
}
function quad_easeOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`
	echo "-1*$c*$t*($t-2) + $b" | bc -l
}
function quad_easeInOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/($d/2)" | bc -l`
	if [ `echo "$t < 1" | bc -l` -eq 1 ]
	then 
	  echo "$c/2*$t*$t + $b" | bc -l
	else
	  t=`echo "$t-1" | bc -l`
	  echo "-1*$c/2*(($t*($t-2)) -1) + $b" | bc -l
	fi
}


# CUBIC =============================================================
function cubic_easeIn {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`
	echo "$c*$t*$t*$t + $b" | bc -l
}
function cubic_easeOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d-1" | bc -l`
	echo "$c*($t*$t*$t +1) + $b" | bc -l
}
function cubic_easeInOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/($d/2)" | bc -l`
	if [ `echo "$t < 1" | bc -l` -eq 1 ]
	then
	  echo "$c/2*$t*$t*$t + $b" | bc -l
	else
	  t=`echo "$t-2" | bc -l`
	  echo "$c/2*($t*$t*$t + 2) + $b" | bc -l
	fi
}


# QUART =============================================================
function quart_easeIn {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`
	echo "$c*$t*$t*$t*$t + $b" | bc -l
}
function quart_easeOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d-1" | bc -l`
	echo "-1*$c * ($t*$t*$t*$t - 1) + $b" | bc -l
}
function quart_easeInOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/($d/2)" | bc -l`
	if [ `echo "$t < 1" | bc -l` -eq 1 ]
	then
	  echo "$c/2*$t*$t*$t*$t + $b" | bc -l
	else
	  t=`echo "$t-2" | bc -l`
	  echo "-1*$c/2 * ($t*$t*$t*$t - 2) + $b" | bc -l
	fi
}


# QUINT =============================================================
function quint_easeIn {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`	
	echo "$c*$t*$t*$t*$t*$t + $b" | bc -l
}
function quint_easeOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d-1" | bc -l`	
	echo "$c*($t*$t*$t*$t*$t + 1) + $b" | bc -l
}
function quint_easeInOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/($d/2)" | bc -l`
	if [ `echo "$t < 1" | bc -l` -eq 1 ]
	then
	  echo "$c/2*$t*$t*$t*$t + $b" | bc -l
	else
	  t=`echo "$t-2" | bc -l`
	  echo "-1*$c/2 * ($t*$t*$t*$t - 2) + $b" | bc -l
	fi
}


# EXPO =============================================================
function expo_easeIn {
	assignvars $1 $2 $3 $4
	if [ `echo "$t == 0" | bc -l` -eq 1 ]
	then
	  TMP=$b
	else
	  TMP=$c
	fi
	echo "$TMP * e( l(2) * (($t/$d -1)*10) ) + $b" | bc -l
}
function expo_easeOut {
	assignvars $1 $2 $3 $4
	if [ `echo "$t == $d" | bc -l` -eq 1 ]
	then
	  TMP=`echo "$b+$c" | bc -l`
	else
	  TMP=$c
	fi
	echo "$TMP * ( -1*e( l(2)*(-10*$t/$d) ) +1  ) + $b" | bc -l
}
function expo_easeInOut {
	assignvars $1 $2 $3 $4
	TMP=`echo "$t/($d/2)" | bc -l`
	if [ `echo "$t == 0" | bc -l` -eq 1 ]
	then
	  echo "$b" | bc -l
	elif [ `echo "$t == $d" | bc -l` -eq 1 ]
	then
	  echo "$b + $c" | bc -l
	elif [ `echo "$TMP < 1" | bc -l` -eq 1 ]
	then
	  echo "($c/2) * e( l(2)*(10*($TMP-1)) ) + $b" | bc -l
	else
	  TMP=`echo "$TMP-1" | bc -l`
	  echo "($c/2) * ( -1*e( l(2)*(-10*$TMP) ) +2 ) + $b" | bc -l
	fi
}


# CIRC =============================================================
function circ_easeIn {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`
	echo "-1*$c * ( sqrt(1 - $t*$t) - 1) + $b" | bc -l
}
function circ_easeOut {
	assignvars $1 $2 $3 $4
	t=`echo "($t/$d)-1" | bc -l`
	echo "$c * sqrt(1 - $t*$t) + $b" | bc -l
}
function circ_easeInOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/($d/2)" | bc -l`	
	if [ `echo "$t < 1" | bc -l` -eq 1 ]
	then
	  echo "-1*$c/2 * (sqrt(1 - $t*$t) - 1) + $b" | bc -l
	else
	  t=`echo "$t-2" | bc -l`
	  echo "$c/2 * (sqrt(1 - $t*$t) + 1) + $b" | bc -l
	fi	
}


# BACK =============================================================
function back_easeIn {
	assignvars $1 $2 $3 $4 $5
	if [ -z "$s" ]
	then
	  s=$OVERSHOOT
	fi
	t=`echo "$t/$d" | bc -l`
	echo "$c*$t*$t*(($s+1)*$t - $s) + $b" | bc -l
}
function back_easeOut {
	assignvars $1 $2 $3 $4 $5
	if [ -z "$s" ]
	then
	  s=$OVERSHOOT
	fi
	t=`echo "($t/$d)-1" | bc -l`
	echo "$c*($t*$t*(($s+1)*$t + $s) + 1) + $b" | bc -l
}
function back_easeInOut {
	assignvars $1 $2 $3 $4 $5
	if [ -z "$s" ]
	then
	  s=$OVERSHOOT
	fi
	t=`echo "$t/($d/2)" | bc -l`
	s=`echo "$s*1.525" | bc -l`
	if [ `echo "$t < 1" | bc -l` -eq 1 ]
	then
	  echo "$c/2*($t*$t*(($s+1)*$t - $s)) + $b" | bc -l
	else
	  t=`echo "$t-2" | bc -l`
	  echo "$c/2*($t*$t*(($s+1)*$t + $s) + 2) + $b" | bc -l
	fi
}


# ELASTIC =============================================================
function elastic_easeIn {
	assignvars $1 $2 $3 $4 $5 $6
	a=$s
	TMP=`echo "$t/$d" | bc -l`
	if [ -z "$a" ]
	then
	  a=$c
	fi
	if [ -z "$p" ]
	then
	  p=`echo "$d * 0.3" | bc -l`
	fi
#-------------------------------------------------
	if [ `echo "$t == 0" | bc -l` -eq 1 ]
	then
	  echo $b
	elif [ `echo "$TMP == 1" | bc -l` -eq 1 ]
	then
	  echo "$b+$c" | bc -l
	else
	  if [ `echo "$a < ${c#-}" | bc -l` -eq 1 ]
	  then
	    s=`echo "$p / 4" | bc -l`
	  else
	    cda=`echo "$c/$a" | bc -l`
	    ASIN=`asin $cda`
	    s=`echo "$p/(2*$PI) * $ASIN " | bc -l`
	  fi
	TMP=`echo "$TMP - 1" | bc -l`
	echo "-1*($a * e(l(2) * (10*$TMP)) * s( ($TMP*$d-$s)*(2*$PI)/$p )) + $b" | bc -l
	fi
}
function elastic_easeOut {
	assignvars $1 $2 $3 $4 $5 $6
	a=$s
	TMP=`echo "$t/$d" | bc -l`
	if [ -z "$a" ]
	then
	  a=$c
	fi
	if [ -z "$p" ]
	then
	  p=`echo "$d * 0.3" | bc -l`
	fi
#-------------------------------------------------
	if [ `echo "$t == 0" | bc -l` -eq 1 ]
	then
	  echo $b
	elif [ `echo "$TMP == 1" | bc -l` -eq 1 ]
	then
	  echo "$b+$c" | bc -l
	else
	  if [ `echo "$a < ${c#-}" | bc -l` -eq 1 ]
	  then
	    s=`echo "$p / 4" | bc -l`
	  else
	    cda=`echo "$c/$a" | bc -l`
	    ASIN=`asin $cda`
	    s=`echo "$p/(2*$PI) * $ASIN " | bc -l`
	  fi
	echo "$a * e(l(2) * (-10*$TMP)) * s( ($TMP*$d-$s)*(2*$PI)/$p ) +$c + $b" | bc -l
	fi	
}
function elastic_easeInOut {
	assignvars $1 $2 $3 $4 $5 $6
	a=$s
	TMP=`echo "$t/($d/2)" | bc -l`
	if [ -z "$a" ]
	then
	  a=$c
	fi
	if [ -z "$p" ]
	then
	  p=`echo "$d * (0.3*1.5)" | bc -l`
	fi
#-------------------------------------------------
	if [ `echo "$t == 0" | bc -l` -eq 1 ]
	then
	  echo $b
	elif [ `echo "$TMP == 2" | bc -l` -eq 1 ]
	then
	  echo "$b+$c" | bc -l
	  
	else
	  if [ `echo "$a < ${c#-}" | bc -l` -eq 1 ]
	  then
	    s=`echo "$p / 4" | bc -l`
	  else
	    cda=`echo "$c/$a" | bc -l`
	    ASIN=`asin $cda`
	    s=`echo "$p/(2*$PI) * $ASIN " | bc -l`
	  fi
	    if [ `echo "$TMP < 1" | bc -l` -eq 1 ]
	    then
	      TMP=`echo "$TMP - 1" | bc -l`
	      echo "-0.5*($a * e(l(2) * (10*$TMP)) * s( ($TMP*$d-$s)*(2*$PI)/$p )) + $b" | bc -l
	    else
	      TMP=`echo "$TMP - 1" | bc -l`
	      echo "0.5*$a * e(l(2) * (-10*$TMP)) * s( ($TMP*$d-$s)*(2*$PI)/$p ) +$c + $b" | bc -l
	    fi
	fi
}


# BOUNCE =============================================================
function bounce_easeIn {
	assignvars $1 $2 $3 $4
	dt=`echo "$d-$t" | bc -l`
	beo=`bounce_easeOut $dt 0 $c $d`
	echo "$c - $beo + $b" | bc -l
}
function bounce_easeOut {
	assignvars $1 $2 $3 $4
	t=`echo "$t/$d" | bc -l`
	if [ `echo "$t < (1/2.75)" | bc -l` -eq 1 ]
	then
	  echo "$c*(7.5625*$t*$t) + $b" | bc -l
	elif [ `echo "$t < (2/2.75)" | bc -l` -eq 1 ]
	then
	  t=`echo "$t-(1.5/2.75)" | bc -l`
	  echo "$c*(7.5625*$t*$t + 0.75) + $b" | bc -l
	elif [ `echo "$t < (2.5/2.75)" | bc -l` -eq 1 ]
	then
	  t=`echo "$t-(2.25/2.75)" | bc -l`
	  echo "$c*(7.5625*$t*$t + 0.9375) + $b" | bc -l
	else
	  t=`echo "$t-(2.625/2.75)" | bc -l`
	  echo "$c*(7.5625*$t*$t + 0.984375) + $b" | bc -l
	fi
}
function bounce_easeInOut {
	assignvars $1 $2 $3 $4
	if [ `echo "$t < ($d/2)" | bc -l` -eq 1 ]
	then
	  t2=`echo "$t*2" | bc -l`
	  bei=`bounce_easeIn $t2 0 $c $d`
	  echo "$bei * 0.5 + $b" | bc -l
	else
	  t2d=`echo "$t*2-$d" | bc -l`
	  beo=`bounce_easeOut $t2d 0 $c $d`
	  echo "$beo * 0.5 + $c * 0.5 + $b" | bc -l
	fi
}


function asin {
  x=$1
  if [ `echo "$x == 1" | bc -l` -eq 1 ]
  then
    echo "$PI/2" | bc -l
  elif [ `echo "$x == -1" | bc -l` -eq 1 ]
  then
    echo "-1*$PI/2" | bc -l
  else
    echo "( a($x / sqrt(1-($x ^ 2))  ) )" | bc -l
  fi
}