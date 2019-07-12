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

# http://www.thejha.org/mailinglistsignup

my $get_signup_page = $ua->get('https://secure.lglforms.com/form_engine/s/R-MMAKSd_k_TAixrgB9xHg?origin=http%3A%2F%2Fwww.thejha.org%2Fmailinglistsignup');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($authenticity_token) = ($signup_page_string =~ m/\<input name\=\"authenticity\_token\" value\=\"(.*)\" type\=\"hidden\" \/\>/);

my $signup = $ua->post(
        'https://secure.lglforms.com/form_engine/R-MMAKSd_k_TAixrgB9xHg',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'not_secure' => 'true',
        'authenticity_token' => $authenticity_token,
        'submission[origin]' => 'http://www.thejha.org/mailinglistsignup',
        'submission[args][field_6]' => 'Gay Nigger Association of America',
        'submission[args][field_7]' => 'Gay Nigger Association of America',
        'submission[args][field_9]' => $target,
        'submission[args][field_17][]' => 'Home,Work',
        'submit' => 'Sign Me Up!'
        ]
        );

