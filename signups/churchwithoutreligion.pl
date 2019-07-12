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

# http://churchwithoutreligion.com/connect/our-newsletter

my $get_signup_page = $ua->get('http://churchwithoutreligion.com/connect/our-newsletter');
        my $signup_page_string = $get_signup_page->as_string;

my ($ca) = ($signup_page_string =~ m/\<input data\-id\=\"ca\:input\" type\=\"hidden\" name\=\"ca\" value\=\"(.*)\"\>/);

my $signup = $ua->post(
        'https://visitor2.constantcontact.com/api/signup',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => '*/*',
        Content =>
        [
        'ca' => $ca,
        'list' => '4',
        'source' => 'EFD',
        'required' => 'list,email',
        'email' => $target,
        'first_name' => 'Gay Nigger Association of America'
        ]
        );




