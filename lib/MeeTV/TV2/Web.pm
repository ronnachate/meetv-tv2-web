package MeeTV::TV2::Web;

use strict;
use warnings;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use parent qw/Catalyst/;
use Catalyst qw/ConfigLoader
                Static::Simple
                Browser
                Unicode::Encoding/;

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in startsiden_video_web.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config( name => 'MeeTV::TV2::Web' );


# Start the application
__PACKAGE__->setup();


=head1 NAME

MeeTV::TV2::Web - Catalyst based application

=head1 SYNOPSIS

    script/meetv_tv2_web_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<MeeTV::TV2::Web::Controller::Root>, L<Catalyst>

=head1 AUTHOR

yo

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
