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

# https://wfsu.org/about/subscribe-to-newsletter.php

my $get_signup_page = $ua->get('https://wfsu.org/about/subscribe-to-newsletter.php');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://visitor2.constantcontact.com/api/signup',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => '*/*',
        Content =>
        [
        'ca' => '6582f580-5468-47df-a3fb-83d6d70246f1',
        'list' => '7',
        'source' => 'EFD',
        'required' => 'list,email,first_name',
        'email' => $target,
        'first_name' => 'Gay Nigger Association of America'
        ]
        );


