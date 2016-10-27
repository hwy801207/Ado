package Ado::Command::generate;
use Ado;
use Mojo::Base 'Mojolicious::Command::generate';

has namespaces => sub { ['Ado::Command::generate', 'Mojolicious::Command::generate'] };
has app        => sub { Mojo::Server->new->build_app('Ado') };
has args       => sub { {} };

1;

=encoding utf8

=head1 NAME

Ado::Command::generate - Generator command

=head1 SYNOPSIS

  Usage: APPLICATION generate GENERATOR [OPTIONS]

=head1 DESCRIPTION

L<Ado::Command::generate> lists available generators.

This is a core command, that means it is always enabled and its code a good
example for learning to build new commands, you're welcome to fork it.

See L<Mojolicious::Commands/"COMMANDS"> for a list of commands that are
available by default.

=head1 ATTRIBUTES

L<Ado::Command::generate> inherits all attributes from
L<Mojolicious::Command::generate> and implements the following new ones.

=head2 app

  $crud->app(Mojo::Server->new->build_app('Ado'));
  my $app = $crud->app; # ISA Ado

An instance of Ado. Used in L<Ado::Command::generate::adoplugin>,
L<Ado::Command::generate::crud> and possibly others.



=head2 args

Used for storing arguments from the commandline and then passing them to the
template

  my $args = $self->args;


=head2 namespaces

  my $namespaces = $generator->namespaces;
  $generator     = $generator->namespaces(['MyApp::Command::generate']);

Namespaces to search for available generator commands, defaults to
C<['Mojolicious::Command::generate','Ado::Command::generate']>.

=head1 METHODS

L<Ado::Command::generate> inherits all methods from
L<Mojolicious::Command::generate>.


=head1 SEE ALSO

L<Ado::Command::generate::adoplugin>, L<Ado::Command::generate::apache2htaccess>,
L<Ado::Command::generate::apache2vhost>, L<Ado::Command::generate::crud>,
L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
