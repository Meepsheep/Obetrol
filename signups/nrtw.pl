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

# https://nrtw.org/receive-updates

my $get_signup_page = $ua->get('https://nrtw.org/receive-updates');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($state_1) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_1\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://nrtw.org/receive-updates',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'input_4.3' => 'Gay Nigger Association of America',
        'input_4.6' => 'Gay Nigger Association of America',
        'input_2' => $target,
        'input_3' => '81003',
        'is_submit_1' => '1',
        'gform_submit' => '1',
        'gform_unique_id' => '',
        'state_1' => $state_1,
        'gform_target_page_number_1' => '0',
        'gform_source_page_number_1' => '1',
        'gform_field_values' => '',
        ]
        );

