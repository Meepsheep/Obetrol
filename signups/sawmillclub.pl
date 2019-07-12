#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;

my $target = shift;
my $proxy = shift;
my $user_agent = shift;
# Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:55.0) Gecko/20100101 Firefox/55.0

my $ua = LWP::UserAgent->new;
my $cookie_jar = HTTP::Cookies->new;
        $ua->timeout(5);
        $ua->agent($user_agent);
        $ua->cookie_jar($cookie_jar);
        $ua->proxy(https => 'http://'.$proxy);

# https://www.sawmillclub.com/connect/email-updates/

my $get_signup_page = $ua->get('https://www.sawmillclub.com/connect/email-updates/');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://sawmillclub.us6.list-manage.com/subscribe/post?u=3151712a97d86685441e07da6&id=4c10829a31',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'b_3151712a97d86685441e07da6_4c10829a31' => '',
        'EMAILTYPE' => 'html',
        'subscribe' => 'Subscribe'
        ]
        );

