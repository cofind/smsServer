#!/usr/bin/perl

use warnings;
use strict;
use DBI();
use POSIX qw/strftime/;
use Time::Piece;
use POSIX qw(locale_h);
use Switch;

my $host = "localhost";
my $database = "timberrobot";
my $user = "root";
my $pw = "abTimberServer12";    


my $pid = `ps -ef | grep "smsd.js"|grep -v grep | awk '{print \$2}'`;

if (defined $pid && $pid ne "")
{
  print "Process is allive, PID is $pid";
  print "No need to restart the process. \n";
}
else
{
   
	print "Process is not allive \n";
	print "It is configured to restart the process \n";
	print "Restarting the process ... ";

	my $restart = `nohup /usr/bin/nodejs /home/timber/smsServer/smsd.js > /home/timber/smsServer/smsd.log &`;
	
	my $newpid = `ps -ef | grep "smsd.js"|grep -v grep | awk '{print \$2}'`;
	
	print "\n";
	
	print "Process is started, new PID is $newpid";
	
	}



