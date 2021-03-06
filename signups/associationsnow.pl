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

# https://associationsnow.com/newsletter/

my $get_signup_page = $ua->get('https://associationsnow.com/newsletter/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($state_2) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_2\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://associationsnow.com/newsletter/',
        #Content_Type => '',
        #Content_Type => 'application/x-www-form-urlencoded',
        Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'input_1' => 'Gay Nigger Association of America',
        'input_2' => 'Gay Nigger Association of America',
        'input_3' => $target,
        'input_4' => '2',
        'input_11.1' => '1',
        'input_6.1' => '0',
        'input_7.1' => '0',
        'input_12' => '',
        'is_submit_2' => '1',
        'gform_submit' => '2',
        'gform_unique_id' => '',
        'state_2' => $state_2,
        'gform_target_page_number_2' => '0',
        'gform_source_page_number_2' => '1',
        'gform_field_values' => ''
        ]
        );
