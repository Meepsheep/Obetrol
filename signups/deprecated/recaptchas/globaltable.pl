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

# https://globaltable.com.au/register/

my $get_signup_page = $ua->get('https://globaltable.com.au/register/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://webto.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'oid' => '00D90000000f6cM',
        'retURL' => 'https://globaltable.com.au/success',
        'lead_source' => 'Globaltable',
        '00N6F00000Dtwau' => 'GlobalTable',
        'recordType' => '0126F000001QJ6H',
        'title' => 'Mr',
        'first_name' => 'Gay Nigger Association of America',
        'last_name' => 'Gay Nigger Association of America',
        'email' => $target,
        '00N6F00000EE5Cc' => 'Media',
        '00N6F00000EE5Cw' => '',
        'country' => 'United States',
        'submit' => 'Register'
        ]
        );

