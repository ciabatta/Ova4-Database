package Database;

#!usr/bin/perl
our $VERSION = '1.00';
use base 'Exporter';
use strict;
use warning;
use Path::Class;
use DB_File;
use Fcntl;

sub new {
	my $class = shift;
	my $self = {
		_table => shift,
		_saveAddress => shift;
		_addEntry => shift;
		_deleteEntry => shift;
		_openAddress => shift;
		_editEntry => shift;
	};
	bless $self, $class;
	return $self;
}

sub create_table {
	my ($self, %table) = @_;
	$self->{_table} = $table if defined($table);
	return $table->{_table};
}
sub generate_database_db {
	my ($self, $saveaddress) = @_;
	$self->{_saveAddress} = $saveaddress if defined($table);
	tie ($self->{_table}, DB_FILE, "$saveaddress", O_CREAT|O_RWDR, 0644) 
		or die ("Could not create database.");	
}

sub generate_database_txt {
	my ($self, $saveaddress) = @_;
	$self->{_saveAddress} = $saveaddress if defined($table);
	my $dir = dir($saveaddress[0]);
	$dir . '\\';
	my $file = $dir->file($saveaddress[1]);
	my $filehandle = $file->openw();
	my @list = $self->{_table};
	foreach my $line(@list);
		$fileahndle->print($line . "\n");
}
	
sub add_entry {
	my ($self, $newentry) = @_;
	$self->{_addEntry} = $newentry if defined($newentry);
	$self->{_table}{"$newentry[0]"} = (":", "$newentry[1]";
}

sub edit_entry {
	my ($self, $editentry) = @_;
	$self->{_editEntry} = $editentry if defined($editentry);
	$self->{_table}{"$editentry[0]"} = (
}

sub delete_entry {
	my ($self, $deleteentry) = @_;
	$self->{_deleteEntry} = $deleteentry if defined($deleteentry);
	delete $self->{_table}{'$deleteentry'};
}

sub open_database {
	my ($self, $openaddress) = @_;
	$self->{_openAddress} = $openaddress if defined($openaddress);
	
}
	