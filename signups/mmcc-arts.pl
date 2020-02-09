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

# http://www.mmcc-arts.org/email-updates.html

my $get_signup_page = $ua->get('http://www.mmcc-arts.org/email-updates.html');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://visitor2.constantcontact.com/api/signup',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        Accept => '*/*',
        #Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'ca' => 'b88c5e97-c6ed-4407-8186-9afbc9740f94',
        'source' => 'EFD',
        'required' => 'list,email',
        'email' => $target,
        'first_name' => 'Gay Nigger Association of America',
        'last_name' => 'Gay Nigger Association of America',
        'address_city' => 'Pueblo',
        'address_state' => 'CO',
        'list_0' => '26',
        'list_1' => '11',
        'list_2' => '35',
        'list_3' => '29',
        'list_4' => '13',
        'list_5' => '5',
        'list_6' => '14',
        'list_7' => '15',
        'list_8' => '34',
        'list_9' => '16',
        'list_10' => '28',
        'list_11' => '17'
        ]
        );

