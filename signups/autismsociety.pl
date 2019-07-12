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

# https://www.autism-society.org/sign-up/

my $get_signup_page = $ua->get('https://www.autism-society.org/sign-up/');
        my $signup_page_string = $get_signup_page->as_string;

my ($signup_post_url_string) = ($signup_page_string =~ m/class\=\"ngp\-form\" data\-form\-url\=\"https\:\/\/actions\.everyaction\.com\/v1\/Forms\/(.*)\" data\-fastaction\-endpoint/);
        my $signup_url = 'https://secure.everyaction.com/v2/Forms/'.$signup_post_url_string;

my $signup = $ua->post(
        $signup_url,
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => '*/*',
        Content =>
        [
        'YesSignMeUpForUpdatesForBinder' => 'true',
        'FirstName' => 'Gay Nigger',
        'LastName' => 'Association of America',
        'PostalCode' => '81003',
        'City' => 'Pueblo',
        'StateProvince' => 'CO',
        'EmailAddress' => $target,
        'type' => 'SignupForm'
        ]
        );




