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

# https://www.coffeecup.com/email/

my $get_signup_page = $ua->get('https://www.coffeecup.com/email/');
	my $signup_page_string = $get_signup_page->as_string;

my ($cc_csrf_token) = ($signup_page_string =~ m/\<input type\=\"hidden\" name\=\"cc\_csrf\_token\" value\=\"(.*)\"\>/);

my $signup = $ua->post(
	'https://www.coffeecup.com/email/',
	Content_Type => 'application/x-www-form-urlencoded',
	Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
	Content =>
	[
	'cc_csrf_token' => $cc_csrf_token,
	'users[user_email_address]' => $target,
	'users[user_name_first]' => 'Gay Nigger',
	'users[user_name_last]' => 'Association of America',
	'button_subscribe' => 'Subscribe',
	'subscribe' => 'Subscribe'
	]
	);
