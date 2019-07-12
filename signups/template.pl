#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;

my $target = shift;
#my $proxy = shift;
#my $user_agent = shift;
my $user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:55.0) Gecko/20100101 Firefox/55.0';

my $ua = LWP::UserAgent->new;
my $cookie_jar = HTTP::Cookies->new;
        $ua->timeout(5);
        $ua->agent($user_agent);
        $ua->cookie_jar($cookie_jar);
        #$ua->proxy(https => 'http://'.$proxy);

# [signup url]

my $get_signup_page = $ua->get('');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        '',
        Content_Type => '',
        Accept => '',
        Content =>
        [
        ]
        );

