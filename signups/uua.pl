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

# http://lists.uua.org/mailman/listinfo/cuups-l

my $get_signup_page = $ua->get('http://lists.uua.org/mailman/listinfo/cuups-l');
        my $signup_page_string = $get_signup_page->as_string;

sleep(5);

my ($sub_form_token) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"sub\_form\_token\" value\=\"(.*)\"\>/);

my $signup = $ua->post(
        'http://lists.uua.org/mailman/subscribe/cuups-l',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'sub_form_token' => $sub_form_token,
        'email' => $target,
        'fullname' => 'Gay Nigger Association of America',
        'pw' => 'niggers11',
        'pw-conf' => 'niggers11',
        'digest' => '1',
        'email-button' => 'Subscribe'
        ]
        );
