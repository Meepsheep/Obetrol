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
# https://www.businessboutique.com/newsletter/

my $get_signup_page = $ua->get('https://www.businessboutique.com/newsletter/');
        my $signup_page_string = $get_signup_page->as_string;

my ($signup_url) = ($signup_page_string =~ m/\<form class\=\"infusion\-form\" accept\-charset\=\"UTF\-8\" action\=\" (.*) \" method\=\"POST\"\>\<input/);
        #print $signup_url."\n";
my ($infusionsoft_version) = ($signup_page_string =~ m/\<input name\=\"infusionsoft\_version\" type\=\"hidden\" value\=\"(.*)\" \/\>/);
        #print $infusionsoft_version."\n";

my $get_signup_url = $ua->head($signup_url);
        my $signup_url_header = $get_signup_url->as_string;
                $ua->get($signup_url);

my ($signup_url_with_return) = ($signup_url_header =~ m/Location\: (.*)/);

my $get_return = $ua->head($signup_url_with_return);
        my $return_header = $get_return->as_string;
                $ua->get($signup_url_with_return);

my $get_signup_url_again = $ua->head($signup_url);
        my $signup_url_header_again = $get_signup_url_again->as_string;

my ($signup_url_with_cookie) = ($signup_url_header_again =~ m/Location\: (.*)/);

my $signup = $ua->post(
        $signup_url_with_cookie,
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'infusionsoft_version' => $infusionsoft_version,
        'inf_field_FirstName' => 'Gay Nigger Association of America',
        'inf_field_Email' => $target
        ]
        );
