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

# https://www.retailgazette.co.uk/newsletter-sign-up-retail-gazette/

my $get_signup_page = $ua->get('https://www.retailgazette.co.uk/newsletter-sign-up-retail-gazette/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($mc4wp_timestamp) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"\_mc4wp\_timestamp\" value\=\"(.*)\" \/\>\<input type\=\"hidden\" name=\"\_mc4wp\_form\_id\"/);

my $signup = $ua->post(
        'https://www.retailgazette.co.uk/newsletter-sign-up-retail-gazette/',
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
        'MMERGE4' => 'Gay Nigger Association of America',
        'MMERGE5' => 'COO',
        '_mc4wp_honeypot' => '',
        '_mc4wp_timestamp' => $mc4wp_timestamp,
        '_mc4wp_form_id' => '1725',
        '_mc4wp_form_element_id' => 'mc4wp-form-1'
        ]
        );

