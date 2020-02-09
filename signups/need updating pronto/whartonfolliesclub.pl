#!/usr/bin/perl

# switch form to https://www.whartonfolliesclub.com/wharton_follies_membership

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

# https://www.whartonfolliesclub.com/sign_up

my $get_signup_page = $ua->get('https://www.whartonfolliesclub.com/sign_up');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($authenticity_token) = ($signup_page_string =~ m/enctype\=\"multipart\/form-data\"\>\<input name\=\"authenticity\_token\" type\=\"hidden\" value\=\"(.*)\"\/\>\<input name\=\"page\_id\"/);

my $signup = $ua->post(
        'https://www.whartonfolliesclub.com/forms/signups',
        #Content_Type => '',
        #Content_Type => 'application/x-www-form-urlencoded',
        Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        Accept => 'text/javascript',
        #Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'authenticity_token' => $authenticity_token,
        'page_id' => '32',
        'return_to' => 'https://www.whartonfolliesclub.com/sign_up',
        'email_address' => '',
        'signup[first_name]' => 'Gay Nigger Association of America',
        'signup[last_name]' => 'Gay Nigger Association of America',
        'signup[email]' => $target,
        'signup[mobile_number]' => '',
        'signup[email_opt_in]' => '0,1',
        'signup[mobile_opt_in]' => '0,1',
        'signup[submitted_address]' => '',
        'signup[country_code]' => 'US',
        'signup[is_volunteer]' => '0,1',
        'signup[activity_is_private]' => '0',
        'commit' => 'Signup'
        ]
        );

