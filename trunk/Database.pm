package Database;

use strict;
use warnings;
use Carp;
use DBI;

use base qw( Class::Accessor );

Database->mk_ro_accessors(qw( DBH ));

my $database = 'database';

sub new { 
    my $class = shift;
    my $self = { DBH => DBI->connect("dbi:SQLite:$database", undef, undef,
                                     { RaiseError => 1 })
               };

    bless $self, $class;

    print $self->databaseExists ? 'Database!' : 'No Database :/'
}

sub databaseExists {
    return -w $database;
}

1;

