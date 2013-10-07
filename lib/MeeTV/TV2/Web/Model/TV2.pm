package MeeTV::TV2::Web::Model::TV2;

=head1 NAME

MeeTV::TV2::Web::Model::TV2 - Catalyst Model

=head1 DESCRIPTION

    Interface to get video information from Xstream Feed via Xstream::Client
    Also provide some convenient function to get and contruct the data
    to be used on `Hvordan` page

=head2 USAGE

    Use as Catalyst Model in Catalyst Controller.
    `$c->model('TV2')`

    Example:
    ----------

    $show = $c->model('TV2')->show_with_id($id);


=cut

use utf8;
use Moose;
use Moose::Util::TypeConstraints;
use Vipr::WS::Client;
use Readonly;

extends 'Catalyst::Model';

has 'client' => (
    is => 'rw',
    isa => 'Vipr::WS::Client',
    builder => '_build_client',
    lazy => 1,
);

has 'current_page' => (
    is      => 'rw',
    default => 1,
);

has 'page_size' => (
    is => 'ro',
    isa => 'HashRef',
);

has 'categories' => (
    is => 'ro',
    isa => 'ArrayRef',
);

has 'available' => (
    is      => 'rw',
);

has 'vipr_ws_client_args' => (
    is => 'ro',
    isa => 'HashRef',
);


sub _build_client {
    my ($self) = @_;
    return Vipr::WS::Client->new($self->vipr_ws_client_args);
}



=head1 METHODS

=head2 shows (<HashRef>)

Performas a search against the Xstream video feed
Returns a Video::Hvordan::Web::View::Helper::Paginator object with results

=cut

sub shows {
    my ($self, $args) = @_;
    $args->{page} ||= $self->current_page;
    $args->{rows} = 28;
    return $self->client->shows($args);
}

=head2 show_with_id (<HashRef>)

Performas a search against the Xstream video feed
Returns a Video::Hvordan::Web::View::Helper::Paginator object with results

=cut

sub show_with_id {
    my ($self, $id) = @_;
    return $self->client->show_with_id($id);
}


=head2 asset_with_id (<HashRef>)

Performas a search against the Xstream video feed
Returns a Video::Hvordan::Web::View::Helper::Paginator object with results

=cut

sub asset_with_id {
    my ($self, $id) = @_;
    return $self->client->asset_with_id($id);
}


=head2 search_programs (<Str>)

Takes a query string, and performs a term based search against the Vip-Ws
Returns a Vipr::Ws::Client::ResultSet object with results

=cut

sub search_assets {
    my ($self, $query) = @_;
    my $args = {
        q     => $query,
        rows  => 28,
        page  => $self->current_page,
    };
    return $self->client->assets($args);
}

sub all_categories {
    my ($self) = @_;
    return $self->categories;
}


1;
