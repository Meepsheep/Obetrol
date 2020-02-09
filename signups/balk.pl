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

# https://www.belk.com/create-account-registry/

my $get_signup_page = $ua->get('https://www.belk.com/create-account-registry/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($csrf_token) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"csrf\_token\" value\=\"(.*)\" \/\>/);
my ($login_password_field_name) = ($signup_page_string =~ m/id\=\"dwfrm\_profile\_login\_password\_(.*)\" name\=\"dwfrm\_profile\_login\_password/);
        $login_password_field_name = 'dwfrm_profile_login_password_'.$login_password_field_name;
my ($login_password_confirm_field_name) = ($signup_page_string =~ m/id\=\"dwfrm\_profile\_login\_passwordconfirm\_(.*)\" name\=\"dwfrm\_profile\_login\_passwordconfirm/);
        $login_password_confirm_field_name = 'dwfrm_profile_login_passwordconfirm_'.$login_password_confirm_field_name;

my $signup = $ua->post(
        'https://www.belk.com/account-signup-error/',
        Referer => 'https://www.belk.com/create-account-registry/',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'country' => 'us',
        'dwfrm_profile_customer_firstname' => 'Gay Nigger Association of America',
        'dwfrm_profile_customer_lastname' => 'Gay Nigger Association of America',
        'dwfrm_profile_customer_email' => $target,
        'dwfrm_profile_login_password_d0qxfeoywldm' => 'niggers11',
        'dwfrm_profile_login_passwordconfirm_d0nchvjymald' => 'niggers11',
        'dwfrm_profile_customer_addToEmailList' => 'true',
        'dwfrm_profile_confirm' => 'Create Account',
        'optOutEnabled' => 'false',
        'csrf_token' => $csrf_token
        ]
        );


