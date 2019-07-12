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

# https://www.frontlineservice.org/subscribe-to-our-newsletter/

my $get_signup_page = $ua->get('https://www.frontlineservice.org/subscribe-to-our-newsletter/');
        my $signup_page_string = $get_signup_page->as_string;

my ($state_1) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_1\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://www.frontlineservice.org/subscribe-to-our-newsletter/',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'input_1.3' => 'Gay Nigger Association of America',
        'input_1.6' => 'Gay Nigger Association of America',
        'input_2' => $target,
        'is_submit_1' => '1',
        'gform_submit' => '1',
        'gform_unique_id' => '5d257edfde3ce',
        'state_1' => $state_1,
        'gform_target_page_number_1' => '0',
        'gform_source_page_number_1' => '1',
        'gform_field_values' => ''
        ]
        );


