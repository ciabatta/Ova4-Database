package Database;

#!usr/bin/perl
our $VERSION = '1.00';
use base 'Exporter';
use strict;
use warning;
use Path::Class;
use DB_File;
use Fcntl;
use autodie;

sub new {
	my $class = shift;
	my $self = {
		_table => shift,
		_saveAddress => shift;
		_openAddress => shift;
		_addEntry => shift;
		_deleteEntry => shift;
		_editEntry => shift;
		_search => shift;
		_tableName => shift;
		_deleteTable => shift;
	};
	bless $self, $class;
	return $self;
}

sub create_table {
	my ($self, $table) = @_;
	$self->{_table} = $table if defined($table);
	$self->{_tableName} = $_ if defined($_);
	return $self->{_table};
}
sub generate_database_db {
	my ($self, $saveaddress) = @_;
	$self->{_saveAddress} = $saveaddress if defined($table);
	my %table = $self->{_table};
	my $databasename = $saveaddress[0] . "\\" . $saveaddress[1];
	tie (%table, DB_FILE, "$databasename", O_CREAT|O_RWDR, 0644) 
		or die ("Could not create database.");	
}

sub open_database_db {
	my ($self, $openaddress) = @_;
	$self->{_openAddress} = $openaddress if defined($openaddress);
	my %table;
	my $databasename = $openadress[0] . '\\' . $openaddress[1];
	tie (%table, DB_FILE, $databasename) or die ("Cannot open database");
	$self->{_table} = $table;
}

sub generate_database_txt {
	my ($self, $saveaddress) = @_;
	$self->{_saveAddress} = $saveaddress if defined($saveaddress);
	my $dir = dir($saveaddress[0]);
	my $file = $dir->file($saveaddress[1]);
	my $file_handle = $file->openw();
	my @list = $self->{_table};
	foreach my $line(@list);
		$file_hndle->print($line . "\n") or die ("Could not create database");
}

sub open_database_txt {
	my ($self, $openaddress) = @_;
	$self->{_openAddress} = $openaddress if defined($openaddress);
	my $dir = dir($openaddress[0]);
	my $file = $dir->file($openaddress[1]);
	my $file_handle = $file->openr();
	open $file_handle, '<';
	chomp (my @lines = <$file_handle>);
	close $file_handle;
	my %table = @lines;
	$self->{_table} = $table;
}	

sub add_entry {
	my ($self, $newentry) = @_;
	$self->{_addEntry} = $newentry if defined($newentry);
	my %table = $self->{_table};
	%table{$newentry[0]} = (":", $newentry[1]);
	$self->{_table} = %table;
}

sub edit_entry {
	my ($self, $editentry) = @_;
	$self->{_editEntry} = $editentry if defined($editentry);
	my %table = $self->{_table};
	%table{$editentry[0]} = join(":" $editentry[1..]);
	$self->{_table} = %table;
}

sub delete_entry {
	my ($self, $deleteentry) = @_;
	$self->{_deleteEntry} = $deleteentry if defined($deleteentry);
	my %table = $self->{_table};
	delete %table{$deleteentry};
	$self->{_table} = %table;
}	

sub delete_table {
	my ($self, $deletetable) = @_;
	$self->{_deleteTable} = $deletetable if defined($deletetable);
	%table = $self->{_table};
	foreach my $keys = (keys(%table)){
	delete $keys;
	}
	$self->{_table} = %table;
}

sub search {
	my ($self, $searchname)= @_;
	$self->{_search} = $searchname if defined($searchname);
	my %table = $self->{_table};
	if ($searchname[1] = "All") {
		foreach my $term (keys %table) {
			print split(/:/, $term);
			} 
			elsif {
				my $searchterms = $table{$searchname[1]};
				my @searchtermssplit = split(/:/, $searchterms);
				print join(", " , @searchtermssplit);	
			}
			else {
				print "Not a valid key.";
				}
}


	
	