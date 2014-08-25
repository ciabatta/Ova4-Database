#!usr/bin/perl
#use strict;
use lib "C:/camelbox/site/lib";
use lib "C:/camelbox/lib";
use warnings;
use Path::Class;
#use autodie;
use Data::Dumper;
use IO::Pipe;
{
  package Data::Dumper;
  no strict 'vars';
  $Terse = $Indent = $Useqq = $Deparse = $Sortkeys = 1;
  $Quotekeys = 0;
}
use Gtk2 '-init';
use constant TRUE =>1;
use constant FALSE =>0;
use ova4::database;

my $window1 = Gtk2::Window->new();
	my $title1 = 'Ova4 Database';
		$window1->set_title($title1);
	$window1->set_border_width(5);
	$window1 = set_width(100);
	$window1->set_height(100);
	my $vbox1 = Gtk2:HBox->new();
		my $hbox1 = Gtk2::VBox->new();
			my $frame1 = Gtk2::Frame->new();
				my $button1 = Gtk2::Button->new();
					$button1->set_title("Open Database");
					$button1->signal_connect('Open Database' => sub{opendatabase1});
			my $frame4 = Gtk2::Frame->new();
				my $button3=Gtk2::Button->new();
					$button3->signal_connect('Create Database' => sub {creatdbsub});


				
sub opendatabase1 {
	my $window2 = Gtk2::Window->nw();
		$window2->set_title('Open a database');
		$window2->set_border_width(5);
		my $hbox2=Gtk2::HBox->new();
			my $frame2 = Gtk2::Frame->new();
				my $fileopenbutton = Gtk2::FileChooserButton('select a file', 'open');
			my $frame3 = Gtk2::Frame->new();
				my $button2 = Gtk2::Button->new();
					$button2->signal_connect('Open Database' => sub {opendatabase2});
					$button2->signal_connect('Destroy' => $window2);
	$frame3->add($button2);
	$frame2->add($fileopnebutton);
	$hbox2->add($frame2);
	$hbox2->add($frame3);
	$window2->add($hbox2);
}				
	
sub opendatabase2 { 
	my $fileopenname = $fileopenebutton->get_filename;
	dbmopen ($fileopenname);
}