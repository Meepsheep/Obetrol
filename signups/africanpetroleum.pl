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

# http://www.africanpetroleum.com.au/media-centre/email-alert-sign

my $get_signup_page = $ua->get('http://www.africanpetroleum.com.au/media-centre/email-alert-sign');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://africanpetroleum.us6.list-manage.com/subscribe/post?u=07097e4e708cb91cfe21dde54&id=b10181f706',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'FNAME' => 'Gay Nigger Association of America',
        'EMAIL' => $target,
        'CATEGORY' => 'Broker/Analyst',
        'OTHER' => 'Yes',
        'group[1441][1]' => '1',
        'group[1441][2]' => '1',
        'group[1441][4]' => '1',
        'b_07097e4e708cb91cfe21dde54_b10181f706' => '',
        'subscribe' => 'Register with this alert service'
        ]
        );


