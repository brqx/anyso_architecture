#!/usr/bin/perl
use IO::Socket;
$ip	= $ARGV[0];
$port	= $ARGV[1];
$socket = IO::Socket::INET->new(
Proto	 =>"tcp", 
PeerPort => $port, 
PeerAddr => $ip ,
Timeout  => 1);

if($socket)
{
    close $socket;
    print "Port Ready";
}
else
{
    print "Port Closed";
}

close($socket);
