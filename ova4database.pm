package ova4::database;

#!usr/bin/perl
our $VERSION = '1.00';
use base 'Exporter';
use strict;
use warning;
use Path::Class;

sub new {
	my $class = shitf;
	return bless [], $class;
	}

sub delete_element {
	delete $table{'@_'};
	}

sub add_element {
	my @addelement = @_;
	$table{'$addelement[0]'}='$addelement[1]';
	}

sub print_element {
	print $table{'@_'}"\n";
	}

sub print_table {
	foreach my $value(key %table) {
		my $value2 = $table{$value};
		print "$value: $value2";	
	}

sub create_database {
	my @databaselocation = @_;
	my $dir = dir($databaselocation[0]);
	my $file = $dir->file($databaselocation[1]);
	my $filehandle = $fileopenw();
	my @list = (%table);
	foreach my $line (@list) {
		$filehandle->print($line."\n");
		}
}

	

	
	