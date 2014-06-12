#apache2vhost.t
use Mojo::Base -strict;
use Test::More;
use File::Temp qw(tempdir);
use File::Spec::Functions qw(catdir catfile catpath);

use Mojo::Util qw(slurp);


my $command = 'Ado::Command::generate::apache2vhost';
use_ok('Ado::Command');
use_ok('Ado::Command::generate');
use_ok('Ado::Command::generate::apache2vhost');
isa_ok(my $c = $command->new, $command);
like($c->description, qr/Apache2 Virtual Host/, 'description looks alike');
like($c->usage, qr/on the command-line.+with_suexec/ms, 'usage looks alike');
my $config_file = catfile(tempdir, 'example.com.conf');
ok(!$c->run('-n' => 'example.com', '-c' => $config_file, '-s'), 'run() ok');
ok(my $config_file_content = slurp($config_file), 'generated $config_file');
my $app_home = $c->app->home;
like($config_file_content, qr/VirtualHost example.com:80/, 'produced file looks alike');
like($config_file_content, qr|ErrorLog $app_home/log|,     'ErrorLog looks alike');
like($config_file_content, qr|CustomLog $app_home/log|,    'CustomLog looks alike');
like($config_file_content, qr|Directory "$app_home">|,     'Directory looks alike');

done_testing;
