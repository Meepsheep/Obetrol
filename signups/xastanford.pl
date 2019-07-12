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

# https://xastanford.org/receive-our-newsletter

my $get_signup_page = $ua->get('https://xastanford.org/receive-our-newsletter');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://us4.list-manage.com/subscribe/post?u=a0678ae6c0af7023e334fc57b&id=64254a8520',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'group[11877][1]' => '1',
        'EMAILTYPE' => 'html',
        'subscribe' => 'Subscribe'
        ]
        );

