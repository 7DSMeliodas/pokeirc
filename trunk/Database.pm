package Database;

use strict;
use warnings;
use Carp;
use DBI;

BEGIN {
    require Exporter;
    our   @ISA = qw(Exporter);
    our   @EXPORT = qw($database); 
}

my $dbPath = 'pokeirc_db';
our $database;

if ( not databaseExists() ) {
    croak "Error: Database inaccessible! (File: $dbPath)";
}

$database = DBI->connect (
                "dbi:SQLite:$dbPath", undef, undef,
                { RaiseError => 1 }
            );

sub databaseExists {
    return -w $dbPath;
}

1;

