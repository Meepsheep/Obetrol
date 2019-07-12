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

# https://grandfather.com/connect/receive-our-newsletter/

my $get_signup_page = $ua->get('https://grandfather.com/connect/receive-our-newsletter/');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://us2.list-manage.com/subscribe/post?u=55a29f882e71ee4359efdd49d&id=92e7486ddd',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'MMERGE5' => '81003',
        'group' => '1,512',
        'group[1024]' => '1024',
        'group[2048]' => '2048',
        'group[4096]' => '4096',
        'group[8192]' => '8192',
        'group[16384]' => '16384',
        'group[32768]' => '32768',
        'EMAILTYPE' => 'html'
        ]
        );

