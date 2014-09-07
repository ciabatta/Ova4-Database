#!usr/bin/perl
use strict;
use warnings;
use ova4database;

my $database = ova4database->new();
print "Ova 4 Database Terminal\n";
my $userinput = <STDIN>;
chomp ($userinput);
my @command = split(/ / , $userinput);
if $command[0] = "new" {
	if $command[1] = "-t" {
		my $fileaddress = $command[2];
		my $file_handle = file($fileaddress);
		open $file_handle, '<';
		chomp (my @lines = <$file_handle>);
		close $file_handle;
		$database->new(@lines);
		}
		elsif $command[1] = "-n" {
			$database->new();
			}
		elsif $command[1] = "-i" {
			
		}
	}