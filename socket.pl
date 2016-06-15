#!/usr/bin/perl -w

#Sudie Roweton
#Lab 8 - Sockets
#CS 3030 - Scripting Languages

use IO::Socket;

#Check to make sure correct number of arguments
if (@ARGV != 2)
{
	print STDERR "Usage: ./socket.pl HOSTNAME SOCKETNUMBER\n";
	exit(1);
}

#save hostname and socket number into variables
$hostname = $ARGV[0];
$socketNum = $ARGV[1] + 0;

#contact a server on given port number using tcp
$remote = IO::Socket::INET->new(
	Proto		=> "tcp",
	PeerAddr	=> $hostname,
	PeerPort	=> "socket($socketNum)",)
	or die print STDERR "Error : cannot connect to ssh port at localhost";

#read and print the first line sent by the server 
$line = <$remote>;
print $line;
