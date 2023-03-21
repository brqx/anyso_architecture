#!/usr/bin/perl
use IO::Socket;
$ip= $ARGV[0];
$socket = IO::Socket::INET->new(
Proto=>"tcp", 
PeerPort=>"22", 
PeerAddr => $ip ,
Timeout => 1);

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
