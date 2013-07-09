#!/bin/bash

# This should lookup the IP for a domain and return the first IP provided.

ns=208.67.222.222
#if [[ validateHost ]] ; then
	hostQuery=$1
#else
#	usage
#fi

usage()
{
	cat<<EOF
	host lookup -- Joe T. Ashcraft
	
	This script should return the first IP address of the domain provided. 
	
	usage:
	$0 [optional nameserver] domain
	
	example:
	$0 ns1.afraid.org h4ck.me
EOF
}

findIP()
{
	dig +short @${ns} ${hostQuery} | \
	egrep "^[0-9]" | \
	head -1
}

# validateHost doesn't work yet
#validateHost()
#{
#	echo $1 |\
#	egrep "(?=^.{1,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)"
#}

if [[ $1 != "" ]] ; then
	findIP
else
	usage
fi


