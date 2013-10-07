package MeeTV::TV2::Web::Controller::Root;

use utf8;
use strict;
use warnings;
use parent 'Catalyst::Controller';
use HTML::Entities;
use HTTP::Status qw(:constants);
use Try::Tiny;
use Data::Dump qw/dump/;


# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

Video::Hvordan::Web::Controller::Hvordan - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub begin :Private {
    my ( $self, $c ) = @_;
    $c->req->params->{page} ||= 1;
    $c->model('TV2')->current_page( $c->req->params->{page} );
    $c->model('TV2')->available( $c->req->params->{available} );
    
}

=head2 index

Start page for Hvordan

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{resultset}   = $c->model('TV2')->shows();
}

=head2 view

detail for specific show

=cut

sub show :Path('show') Args(1) {
    my ( $self, $c, $id ) = @_;
    my $show = $c->model('TV2')->show_with_id($id);
    $c->stash->{show} = $show;
    $c->stash->{assets} = $show->assets;
}

=head2 asset

detail for specific asset

=cut

sub asset :Path('asset') Args(1) {
    my ( $self, $c, $id ) = @_;
    my $asset = $c->model('TV2')->asset_with_id($id);
    $c->stash->{asset} = $asset;
}


=head2 category

List program from specific category

=cut


sub category :Path('category') Args(1) {
    my ( $self, $c, $category_id ) = @_;
    my $mtag = "program-category_id-$category_id";
    $c->stash->{category_id} = $category_id;
    $c->stash->{resultset} = $c->model('')->programs({ mtag => ['program-main-display', $mtag] });
    $c->stash->{categories} = $c->model('Nrk')->all_categories;
    $c->stash->{toggle_link} = $self->_toggle_link($c);
}

=head2 search

Search program with specific string

=cut

sub search :Path('search') {
    my ( $self, $c ) = @_;
    my $query = $c->req->params->{q};
    $c->stash->{assets} = $c->model('TV2')->search_assets($query);
}


=head2 end

Called at the end of a request, after all URL-matching actions are called.
Forwards to the default Web view, or to the Mobile view if the user is on a mobile device

=cut

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;

}

=head1 AUTHOR

ABC Startsiden

=head1 LICENSE

All rights reserved.

=cut

1;
