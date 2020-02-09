#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;

my $target = shift;
my $proxy = shift;
my $user_agent = shift;
#my $user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:55.0) Gecko/20100101 Firefox/55.0';

my $ua = LWP::UserAgent->new;
my $cookie_jar = HTTP::Cookies->new;
        $ua->timeout(5);
        $ua->agent($user_agent);
        $ua->cookie_jar($cookie_jar);
        $ua->proxy(https => 'http://'.$proxy);

# https://cliniclegal.org/email

my $get_signup_page = $ua->get('https://cliniclegal.org/email');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://cliniclegal.us8.list-manage.com/subscribe/post?u=d1e29c8d7ab34d84237ecd8ee&id=a33179621a',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'MMERGE11' => 'COO',
        'ORG' => 'Gay Nigger Association of America',
        'MMERGE10' => 'Colorado',
        'group[15941][1]' => '1',
        'group[15941][2]' => '2',
        'group[15941][8]' => '8',
        'group[15941][16]' => '16',
        'group[15941][4]' => '4',
        'group[15941][256]' => '256',
        'group[15941][4096]' => '4096',
        'group[15941][4194304]' => '4194304',
        'EMAILTYPE' => 'html',
        'b_d1e29c8d7ab34d84237ecd8ee_a33179621a' => '',
        'subscribe' => 'Subscribe'
        ]
        );

