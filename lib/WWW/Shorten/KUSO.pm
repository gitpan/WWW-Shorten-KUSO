package WWW::Shorten::KUSO;
use strict;
use warnings;
use Carp;
our $VERSION = '0.1';
use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );

use LWP::Simple;

sub makeashorterlink {
    my $url=shift;
    local $_=get 'http://www.kuso.cc/odbc.php?url='.$url;
    return $1 if(/value="([^"]+)".+/s);
}

sub makealongerlink {
    my $tinyurl_url = shift
        or croak 'No TinyURL key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();
    $tinyurl_url = "http://0rz.com/$tinyurl_url"
        unless $tinyurl_url =~ m!^http://!i;
    my $resp = $ua->get($tinyurl_url);
    return undef unless $resp->is_redirect;
    my $url = $resp->header('Location');
    return $url;
}

1;

__END__

=head1 NAME

  WWW::Shorten::KUSO - Shorten URL using KUSO.CC

=head1 DESCRIPTION

  use WWW::Shorten 'KUSO';
  my $short_url = makeashorterlink($longurl);

=head1 COPYRIGHT

Copyright 2005 by Lilo Huang <kenwu@mail.tnssh.tn.edu.tw>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

See <http://www.perl.com/perl/misc/Artistic.html>

=cut

