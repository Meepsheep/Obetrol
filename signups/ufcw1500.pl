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
        #$ua->proxy(https => 'http://'.$proxy);

# http://www.ufcw1500.org/email-updates

my $get_signup_page = $ua->get('http://www.ufcw1500.org/email-updates');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $signup = $ua->post(
        'https://app.icontact.com/icp/core/mycontacts/signup/designer/form/?id=19&cid=402019&lid=40564',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'data[fname]' => 'Gay Nigger Association of America',
        'data[lname]' => 'Gay Nigger Association of America',
        'data[email]' => $target,
        'data[business]' => 'Default Value',
        'data[store#]' => '',
        'data[phone]' => '',
        'data[listGroups][]' => '9897429'
        ]
        );

