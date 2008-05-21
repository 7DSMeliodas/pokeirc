#!/usr/bin/perl
use strict;
use warnings;
use Database;

my $STH = $database->prepare('SELECT * FROM LOL');
