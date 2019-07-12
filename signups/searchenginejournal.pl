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
# https://www.searchenginejournal.com/newsletter-sign-up/

my $get_signup_page = $ua->get('https://www.searchenginejournal.com/newsletter-sign-up/');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://www.searchenginejournal.com/wp-admin/admin-ajax.php',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => '*/*',
        Content =>
        [
        'action' => 'mcheck',
        'lid' => 'master',
        'email' => $target,
        'wsource' => 'Landing Page',
        'data[0][name]' => 'email',
        'data[0][value]' => $target,
        'data[1][name]' => 'custom_FNAME',
        'data[1][value]' => 'Gay Nigger Association of America',
        'data[2][name]' => 'custom_LNAME',
        'data[2][value]' => 'Gay Nigger Association of America',
        'data[3][name]' => 'custom_COMPANY',
        'data[3][value]' => '',
        'data[4][name]' => 'custom_COMP_SIZE',
        'data[4][value]' => '',
        'data[5][name]' => 'custom_JOBTITLE',
        'data[5][value]' => '',
        'data[6][name]' => 'seo',
        'data[6][value]' => 'yes',
        'data[7][name]' => 'ppc',
        'data[7][value]' => 'yes',
        'data[8][name]' => 'content',
        'data[8][value]' => 'yes',
        'data[9][name]' => 'social',
        'data[9][value]' => 'yes',
        'data[10][name]' => 'daily',
        'data[10][value]' => 'yes',
        'data[11][name]' => 'terms',
        'data[11][value]' => '16',
        'data[12][name]' => 'custom_WSOURCE',
        'data[12][value]' => 'Landing Page',
        'data[13][name]' => 'custom_COUNTRY',
        'data[13][value]' => 'US',
        'data[14][name]' => 'COUNTRY',
        'data[14][value]' => 'US'
        ]
        );




