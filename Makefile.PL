use inc::Module::Install;

name            ('WWW-Shorten-KUSO');
abstract        ('1');
author          ('Lilo Huang <kenwu@mail.tnssh.tn.edu.tw>');
license         ('perl');
version_from    ('lib/WWW/Shorten/KUSO.pm');
requires        ('LWP::Simple');
requires        ('WWW::Shorten');
build_requires  ('Test::More');

&WriteAll;


