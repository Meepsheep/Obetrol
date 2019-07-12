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

# https://www.womenonwings.com/subscribe-to-our-newsletter/

my $get_signup_page = $ua->get('https://www.womenonwings.com/subscribe-to-our-newsletter/');
        my $signup_page_string = $get_signup_page->as_string;

my ($state_13) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_13\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://www.womenonwings.com/subscribe-to-our-newsletter/',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'input_1' => 'Gay Nigger Association of America',
        'input_5' => 'Gay Nigger Association of America',
        'input_2' => $target,
        'input_4' => 'Yes, I want to receive the Women on Wings newsletter',
        'is_submit_13' => '1',
        'gform_submit' => '13',
        'gform_unique_id' => '',
        'state_13' => $state_13,
        'gform_target_page_number_13' => '0',
        'gform_source_page_number_13' => '1',
        'gform_field_values' => ''
        ]
        );


