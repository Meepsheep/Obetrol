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

# https://oewd.org/email

my $get_signup_page = $ua->get('https://oewd.org/email');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://visitor2.constantcontact.com/api/signup',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => '*/*',
        Content =>
        [
        'ca' => 'edcb139e-c597-4212-8d94-89bea10cfcac',
        'source' => 'EFD',
        'required' => 'list,email,first_name,last_name,company',
        'email' => $target,
        'first_name' => 'Gay Nigger Association of America',
        'last_name' => 'Gay Nigger Association of America',
        'company' => 'Gay Nigger Association of America',
        'list_0' => '1330030940',
        'list_1' => '2055996404',
        'list_2' => '1923889625',
        'list_3' => '2077327113',
        'list_4' => '2075663304',
        'list_5' => '1533893783',
        'list_6' => '1537497359',
        'list_7' => '1462863990',
        'list_8' => '1860310361',
        'list_9' => '1359404172',
        'list_10' => '1808573600',
        'list_11' => '2044958236',
        'list_12' => '1888266075'
        ]
        );

