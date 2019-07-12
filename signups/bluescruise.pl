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

# https://bluescruise.com/mail-list/

my $get_signup_page = $ua->get('https://bluescruise.com/mail-list/');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://bluescruise.us5.list-manage.com/subscribe/post?u=082e3e6549a9c4481bb93b06f&id=c15fc11552',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'MMERGE8[addr1]' => '612 Wharf Ave',
        'MMERGE8[addr2]' => '',
        'MMERGE8[city]' => 'Pueblo',
        'MMERGE8[state]' => 'Colorado',
        'MMERGE8[zip]' => '81003',
        'MMERGE8[country]' => '164',
        'MMERGE4' => 'Sirius XM',
        'EMAILTYPE' => 'html',
        'subscribe' => 'Subscribe'
        ]
        );

