package Web::Env;

use Dancer2 appname => 'Web';

hook before_template_render => sub {
    my ($stash) = @_;
    $stash->{web_env}    = \&env;
    $stash->{is_dev}     = \&is_dev;
    $stash->{is_staging} = \&is_staging;
    $stash->{is_production} ||= $stash->{is_prod} ||= \&is_production;
};

sub env {
    $ENV{PLACK_ENV} // $ENV{DANCER_ENVIRONMENT} // 'development';
}

sub is_dev {
    return env eq 'development';
}

sub is_staging {
    return env eq 'staging';
}

sub is_production {
    return env eq 'production';
}

1;
