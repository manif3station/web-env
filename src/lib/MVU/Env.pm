package MVU::Env;

use strict;
use warnings;
use Exporter;

our @EXPORT = qw( env is_dev is_staging is_production );

sub env {
    $ENV{PLACK_ENV} // $ENV{DANCER_ENVIRONMENT} // 'development';
}

sub is_dev {
    return env() eq 'development' ? 1 : 0;
}

sub is_staging {
    return env() eq 'staging' ? 1 : 0;
}

sub is_production {
    return env() eq 'production' ? 1 : 0;
}

1;
