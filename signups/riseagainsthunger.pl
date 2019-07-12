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

# https://www.riseagainsthunger.org/sign-up-for-our-newsletter/

my $get_signup_page = $ua->get('https://www.riseagainsthunger.org/sign-up-for-our-newsletter/');
	my $signup_page_string = $get_signup_page->as_string;

my ($oid) = ($signup_page_string =~ m/\<input type\=hidden name\=\"oid\" value\=\"(.*)\"\>/);
	print 'oid: '.$oid."\n";

my $signup = $ua->post(
	'https://webto.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8',
	Content_Type => 'application/x-www-form-urlencoded',
	Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
	Content =>
	[
	'oid' => $oid,
	'retURL' => 'http://www.riseagainsthunger.org/sign-up-for-our-newsletter/',
	'first_name' => 'Gay Nigger',
	'last_name' => 'Association of America',
	'email' => $target,
	'lead_source' => 'Website - Newsletter Sign Up',
	'submit' => 'Submit Query'
	]
	);