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

# https://www.donnakundeacademy.com/courses/daily-thought

my $get_signup_page = $ua->get('https://www.donnakundeacademy.com/courses/daily-thought');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://johncmaxwellgroup.us13.list-manage.com/subscribe/post?u=37e0d28e67ae103cffb2f2efb&id=23c9a7ed20',
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
        'gdpr[18349]' => 'Y',
        'gdpr[18353]' => 'Y',
        'gdpr[18357]' => 'Y',
        'b_37e0d28e67ae103cffb2f2efb_23c9a7ed20' => '',
        'subscribe' => 'Subscribe'
        ]
        );


