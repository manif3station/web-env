package Web::Env;

use Dancer2 appname => 'Web';

use MVU::Env;

hook before_template_render => sub {
    my ($stash) = @_;
    $stash->{web_env}    = \&env;
    $stash->{is_dev}     = \&is_dev;
    $stash->{is_staging} = \&is_staging;
    $stash->{is_production} ||= $stash->{is_prod} ||= \&is_production;
};

1;
