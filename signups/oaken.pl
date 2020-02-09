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

# https://www.oaken.com/subscribe-to-email-updates/

my $get_signup_page = $ua->get('https://www.oaken.com/subscribe-to-email-updates/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://s614839713.t.eloqua.com/e/f2',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'elqFormName' => 'OAKnewsletterSignup',
        'elqSiteId' => '614839713',
        'elqCampaignId' => '',
        'elqCustomerGUID' => '',
        'elqCookieWrite' => '0',
        'emailAddress' => $target,
        'firstName' => 'Gay Nigger Association of America',
        'lastName' => 'Gay Nigger Association of America'
        ]
        );

