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

# https://carpentries.org/newsletter/

my $get_signup_page = $ua->get('https://carpentries.org/newsletter/');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://carpentries.us14.list-manage.com/subscribe/post?u=46d7513c798c6bd41e5f58f4a&id=50c3e6d6fe',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'LNAME' => 'Gay Nigger Association of America',
        'group[295][1]' => '1',
        'group[295][2]' => '2',
        'group[295][4]' => '4',
        'group[295][8]' => '8',
        'group[295][16]' => '16',
        'group[295][32]' => '32',
        'group[295][64]' => '64',
        'group[295][128]' => '128',
        'gdpr[963]' => 'Y',
        'b_46d7513c798c6bd41e5f58f4a_50c3e6d6fe' => '',
        'subscribe' => 'Subscribe'
        ]
        );


