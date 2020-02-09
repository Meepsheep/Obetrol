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

# https://www.springsyoga.com/subscribe/

my $get_signup_page = $ua->get('https://www.springsyoga.com/subscribe/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($ctct_verify) = ($signup_page_string =~ m/\<p class\=\"ctct\-form\-field ctct\-form\-field\-hidden\"\>\<input  type\=\"hidden\" name\=\"ctct\-verify\" id\=\"ctct\-verify\"  value\=\"(.*)\"  placeholder\=\"\" class\=\"ctct\-hidden ctct-label\-\"/);

my $signup = $ua->post(
        'https://www.springsyoga.com/subscribe/',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'first_name___7e7a6eef7e0a3734f39d6757b27d474b' => 'Gay Nigger Association of America',
        'last_name___86b6d953df0fd1bff8e02cde526c2b3c' => 'Gay Nigger Association of America',
        'email___ecd412e904309dcce66177488240b016' => $target,
        'ctct-opt-in' => '1',
        'ctct_usage_field' => '',
        'ctct-id' => '2878',
        'ctct-verify' => $ctct_verify,
        'ctct_time' => '1564712575',
        'ctct-submitted' => 'Sign Me Up!',
        'ctct_form' => '1833a214ce',
        '_wp_http_referer' => '/subscribe/'
        ]
        );

