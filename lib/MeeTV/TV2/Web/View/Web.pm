package MeeTV::TV2::Web::View::Web;

use Moose;

extends 'Catalyst::View::TT';

with 'Catalyst::View::Component::SubInclude';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER => 'layout/wrapper.tt',
    render_die => 1,
    ENCODING => 'utf8',
);

=head1 NAME

Video::Hvordan::Web::View::Web - TT View for Video::Hvordan::Web

=head1 DESCRIPTION

TT View for Video::Hvordan::Web.

=head1 SEE ALSO

L<Video::Hvordan::Web>

=head1 AUTHOR

espen

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
