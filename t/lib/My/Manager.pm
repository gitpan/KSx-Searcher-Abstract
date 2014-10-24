use strict;
use warnings;

package My::Manager;

use base qw(KSx::IndexManager);
__PACKAGE__->add_plugins(
#  Schema    => { class => 'My::Schema' },
#  Partition => { key   => 'type' },
#  Partition => { key   => 'id'   },
);

__PACKAGE__->schema_class('My::Schema');
__PACKAGE__->searcher_class('KSx::Searcher::Abstract');

sub to_doc {
  my ($self, $arg) = @_;
  $arg->{type}  ||= 'untyped';
  $arg->{name}  ||= 'unnamed';
  $arg->{color} ||= 'colorless';
  return $arg;
}

1;
