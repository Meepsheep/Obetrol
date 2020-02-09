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

# https://calbudgetcenter.org/get-updates/

my $get_signup_page = $ua->get('https://calbudgetcenter.org/get-updates/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($state_1) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_1\' value\=\'(.*)\' \/\> \<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'gform\_target\_page\_number\_1\'/);

my $signup = $ua->post(
        'https://calbudgetcenter.org/get-updates/#gf_1',
        #Content_Type => '',
        #Content_Type => 'application/x-www-form-urlencoded',
        Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'input_1.3' => 'Gay Nigger Association of America',
        'input_1.6' => 'Gay Nigger Association of America',
        'input_4' => $target,
        'input_5' => 'Gay Nigger Association of America',
        'input_9' => '',
        'input_2.1' => '',
        'input_2.2' => '',
        'input_2.3' => '',
        'input_2.4' => 'California',
        'input_2.6' => 'United States',
        'input_12' => '81003',
        'input_3' => '',
        'input_8' => '',
        'input_10.1' => 'Please send me California Budget Bites blog posts via email.',
        'input_14.1' => 'All',
        'input_6' => 'General elist',
        'input_18' => '',
        'gform_ajax' => 'form_id=1',
        'title' => '',
        'description' => '',
        'tabindex' => '0',
        'is_submit_1' => '1',
        'gform_submit' => '1',
        'gform_unique_id' => '',
        'state_1' => $state_1,
        'gform_target_page_number_1' => '0',
        'gform_source_page_number_1' => '1',
        'gform_field_values' => ''
        ]
        );

