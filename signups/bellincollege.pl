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

# https://www.bellincollege.edu/contact-us/join-our-mail-list/

my $get_signup_page = $ua->get('https://www.bellincollege.edu/contact-us/join-our-mail-list/');
        my $signup_page_string = $get_signup_page->as_string;

my ($state_11) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_11\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://www.bellincollege.edu/contact-us/join-our-mail-list/',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'input_12.3' => 'Gay Nigger Association of America',
        'input_12.6' => 'Gay Nigger Association of America',
        'input_11' => $target,
        'input_3' => 'Gay Nigger Association of America',
        'input_4' => '',
        'input_13' => '',
        'input_5' => '',
        'input_6' => '',
        'input_8' => '',
        'input_10.1' => 'Bellin College News & Updates',
        'input_10.2' => 'Alumni News',
        'input_10.3' => 'Donors & Friends of the College',
        'input_10.4' => 'High School Students & Parents',
        'input_14' => '',
        'is_submit_11' => '1',
        'gform_submit' => '11',
        'gform_unique_id' => '',
        'state_11' => $state_11,
        'gform_target_page_number_11' => '0',
        'gform_source_page_number_11' => '1',
        'gform_field_values' => ''
        ]
        );

