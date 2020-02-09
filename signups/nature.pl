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

# https://idp.nature.com/register/natureuser?redirect_uri=https%3A%2F%2Fwww.nature.com%2Fmy-account

my $get_signup_page = $ua->get('https://idp.nature.com/register/natureuser?redirect_uri=https%3A%2F%2Fwww.nature.com%2Fmy-account');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($csrf) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"\_csrf\" value\=\"(.*)\"\/\>/);

my $signup = $ua->post(
        'https://idp.nature.com/register/natureuser',
        Referer => 'https://idp.nature.com/register/natureuser?redirect_uri=https%3A%2F%2Fwww.nature.com%2Fmy-account',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        '_csrf' => $csrf,
        'redirectUri' => 'https://idp.nature.com/authorize/natureuser?client_id=foxtrot&amp;idpCallback=authorize&amp;returningFromThirdParty=true&amp;redirect_uri=https%3A%2F%2Fwww.nature.com%2Fmy-account',
        'firstName' => 'Gay Nigger',
        'lastName' => 'Association of America',
        'email' => $target,
        'password' => 'niggers11',
        'confirmPassword' => 'niggers11',
        'acceptedTermsAndConditions' => 'on',
        '_acceptedTermsAndConditions' => 'on'
        ]
        );


