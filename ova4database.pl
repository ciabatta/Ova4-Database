package ova4::database;

#!usr/bin/perl
our $VERSION = '1.00';
use base 'Exporter';

sub new_table {
	my %table = @_;
	my $self = bless({}, %table);
	my $target = exists $table{target} ? $table{target};
	$self ->{target} = $target;
	
	return $self;
	}

sub delete_element {
	delete $table{'@_'};
	}

sub add_element {
	$table{'@_'}='@_';
	}

sub print_element {
	print $table{'@_'}"n";
	}

sub print_table {
	foreach my $value(key %table) {
		my $value2 = $table{$value};
		print "$value: $value2";	
	}
	
	

	
	