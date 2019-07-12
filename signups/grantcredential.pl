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

# https://www.grantcredential.org/signup/

my $get_signup_page = $ua->get('https://www.grantcredential.org/signup/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://grantcredential.us11.list-manage.com/subscribe/post?u=3836e4fa82a6905ce04601eba&id=c12467b28c',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'LOCATION' => 'CO',
        'b_3836e4fa82a6905ce04601eba_c12467b28c' => '',
        'subscribe' => 'Subscribe'
        ]
        );

