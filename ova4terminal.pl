#!usr/bin/perl
use strict;
use warnings;
use ova4database;

my $database = ova4database->new();
print "Ova 4 Database Terminal\n";
my $userinput = <STDIN>;
chomp ($userinput);
my @command = split(/ / , $userinput, 3);
if ($command[0] = ("new", "New", "NEW")) {
	if ($command[1] = "-t") {
		my $fileaddress = $command[2];
		my $file_handle = file($fileaddress);
		open $file_handle, '<';
		chomp (my @lines = <$file_handle>);
		close $file_handle;
		$database->new(@lines);
		}
		elsif ($command[1] = "-n") {
			$database->new();
			}
		elsif ($command[1] = "-i") {
			my @table1 = split(/:/, $command[2], 2);
			my %table2 = ($table1[0] => $table1[1]);
			$database->new(%table2,);
			}
		elsif ($command[1] = "-d") {
			my $dbaddress = $command[2];
			my %dbtable;
			tie (%dbtable, DB_FILE, $dbaddress) or die ("Cannot open database or incorrect file name/path.");
			$database->new(%dbtable);
			}
		else {
			print "Incorrect switch. Options are -n, -i, -t and -d. Type Help new for more.";
			}
	}
	elsif ($command[0] = ("generatedb", "Generatedb", "GENERATEDB")) {
		my @saveaddressdb = ($command[1], $command[2]);
		$database->generate_database_db(@saveaddress);
		}
	elsif ($command[0] = ("opendb", "Opendb", "OPENDB")) {
		my @openaddressdb = ($command[1], $command[2]);
		$database->open_database_db(@openaddress);
	}
	elsif ($command[0] = ("generatetx", "Generatetx", "GENERATETX")) {
		my @saveaddresstx = ($command[1], $command[2]);
		$database->generate_database_txt(@saveaddress);
	}
	elsif ($command[0] = ("opentx", "Opentx", "OPENTX")) {
		my @openaddresstx = ($command[1], $command[2]);
		$database->open_database_txt(@openaddress);
	}
	elsif ($command[0] = ("add", "Add", "ADD")) {
		if ($command[1] = "-e") {
			my $hash = $command[2];
			my $value = join(/ /, $command[3..]);
			my @tabelvalues = ($hash, $value);
			$database->edit_entry(@tablevalues);
		}
		elsif ($command[1] = "-d") {
			my $deleteentry = $command[2];
			$database->delete_entry($deleteentry);
		}
		elsif ($command[1] = "-a") {
			my $hashadd = $command[2];
			my $valueadd = join(/ /, $command[3..]);
			my @tableadd = ($hashadd, $valueadd);
			$databse->add_entry(@tableadd);
		}
		else print "Incorrect switch. Please type Help Add for more information."
	}
	elsif ($command[0] = ("edit", "Edit", "EDIT")) {
		if ($command[1] = "-a") {
			my $hash = $command[2];
			my $value = join(/ /, $command[3..]);
			my @tabelvalues = ($hash, $value);
			$database->add_entry(@tablevalues);
		}
		elsif ($command[1] = "-d") {
			my $deleteentry = $command[2];
			$database->delete_entry($deleteentry);
		}
		elsif ($command[1] = "-e") {
			my $hashedit = $command[2];
			my $valueedit = join(/ /, $command[3..]);
			my @tableadd = ($hashedit, $valueedit);
			$databse->edit_entry(@tableadd);
		}
		else {
			print "Incorrect switch. Please type Help Edit for more information.";
			}
	}
	elsif ($command[0] = ("delete", "Delete", "DELETE")) {
		if ($command[1] = "-t") {
			my $tabledelete = $command[2];
			$database->delete_table($tabledelete);
		}
		elsif ($command[1] = "-e") {
			my $entrydelete = $command[2];
			$database->delete_entry($entrydelete);
			}
			else {
				print "Incorrect switch. Please type Help Delete for more information.";
				}
	}
	elsif ($command[0] = ("Search", "search", "SEARCH")) {
		
	}
	