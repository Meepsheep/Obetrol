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

# https://www.goodreads.com/user/sign_up

my $get_signup_page = $ua->get('https://www.goodreads.com/user/sign_up');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($authenticity_token) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"authenticity_token\" value\=\"(.*)\" \/\>/);
my ($n) = ($signup_page_string =~ m/\<input name\=\'n\' type\=\'hidden\' value\=\'(.*)\'\>/);

my $signup = $ua->post(
        'https://www.goodreads.com/user/create',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'utf8' => '✓',
        'authenticity_token' => $authenticity_token,
        'user[first_name]' => 'GayNiggerAssociationOfAmerica',
        'user[email]' => $target,
        'user[password]' => 'niggers11',
        'next' => 'Sign up',
        'n' => $n
        ]
        );

