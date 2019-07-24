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

# https://www.papamurphys.com/signup-for-offers

my $get_signup_page = $ua->get('https://www.papamurphys.com/signup-for-offers');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $phone_number = '';

my $area_code = int(rand(2));

if ($area_code == 0) {
        $phone_number = '505'.(int(rand(899))+100).(int(rand(8999))+1000);
}

elsif ($area_code == 1) {
        $phone_number = '719'.(int(rand(899))+100).(int(rand(8999))+1000);
}


my $signup = $ua->post(
        'https://www.papamurphys.com/dinner-circle/bridg',
        Content_Type => 'application/json',
        #Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        Accept => 'application/json, text/plain, */*',
        #Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content => '{"email":"'.$target.'","first_name":"Gay Nigger Association of America","last_name":"Gay Nigger Association of America","account_id":31548,"primary_phone":"'.$phone_number.'","zip":"81003","source":"e-club"}'
        );

