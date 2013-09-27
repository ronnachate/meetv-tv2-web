#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;

BEGIN {
    $ENV{MEETV_TV2_WEB_CONFIG_LOCAL_SUFFIX}="test";
    use_ok 'Catalyst::Test', 'MeeTV::TV2::Web';    
}

ok( request('/')->is_success, 'Request should succeed' );
