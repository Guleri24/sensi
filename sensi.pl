#!usr/bin/perl
use warnings;
use strict;
use File::Copy;
use File::stat;


print("Welcome to sensi \n");

# Get the directory to work on
print "Enter the directory \n";
my $dir = <STDIN>;
chomp $dir; # removes the last trailing newline

# opendir($dir) or die "failed, $!";
opendir( DIR, $dir ) || die "Error in opening dir $dir\n";
# while( ($filename = readdir(DIR))) {
#    print("$filename\n");
# }

my $filterstring = "\\.pdf\$";
my $username = $ENV{LOGNAME} || $ENV{USER} || getpwuid($<);

foreach my $filename (readdir(DIR)) {
	next if not $filename =~ m/$filterstring/;
	print($filename);
	print("Destination : /home/" . $username . "/Documents/" . $filename . "\n");
	move($dir . "/" . $filename, "/home/" . $username . "/Documents/" . $filename);
}	

print $username;
closedir(DIR);


