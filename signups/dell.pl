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

# https://www.dell.com/preferences/signup/

my $get_signup_page = $ua->get('https://www.dell.com/preferences/signup/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($token) = ($signup_page_string =~ m/window\.token \= \{ \"token\"\: \"(.*)\" \}\;/);

my $signup = $ua->post(
        'https://www.dell.com/preferences/SignUp/api/contactPoints/'.$token,
        Content_Type => 'application/json;charset=utf-8',
        #Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        Accept => 'application/json, text/plain, */*',
        #Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content => '{"fn":"Gay Nigger Association of America","ln":"Gay Nigger Association of America","email":"'.$target.'","confirmEmail":"'.$target.'","segment":"dhs","websourceId":"8903","sourceSystemCode":"Email_Sign_Up","campaignId":"","urlCC":"us","urlLC":"en","token":"'.$token.'"}'
        );

