#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'MeeTV-TV2-Web';
all_from 'lib/MeeTV/TV2/Web.pm';

requires 'Catalyst::Runtime' => '5.80021';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Plugin::Browser';
requires 'Catalyst::Plugin::Unicode::Encoding';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::View::TT';
requires 'Catalyst::Model::Adaptor';
requires 'parent';
requires 'Data::Page';
requires 'Template::Plugin::DateTime';

requires 'Readonly';
requires 'Try::Tiny';
requires 'DateTime::Format::Atom';
requires 'Readonly';

requires 'Vipr::WS::Client' => '0.05';

build_requires 'Catalyst::Devel';

test_requires 'Test::WWW::Mechanize' => '1.32';
test_requires 'Test::WWW::Mechanize::Catalyst';
test_requires 'WWW::Mechanize::TreeBuilder';
test_requires 'HTML::TreeBuilder::XPath' => '0.12';
test_requires 'Test::MockObject::Extends';
test_requires 'Test::XML';

catalyst;

install_script glob('script/*.pl');
install_script glob('bin/*');
auto_install;
WriteAll;
