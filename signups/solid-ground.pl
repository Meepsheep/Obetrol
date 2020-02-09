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

# https://www.solid-ground.org/get-involved/get-news-updates/

my $get_signup_page = $ua->get('https://www.solid-ground.org/get-involved/get-news-updates/');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($state_1) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_1\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://solid-ground.us4.list-manage.com/subscribe/post?u=22e306da3a51cd121520da500&id=81a99090a7',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Content_Type => 'application/json',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'EMAIL' => $target,
        'FNAME' => 'Gay Nigger Association of America',
        'MMERGE2' => 'Gay Nigger Association of America',
        'MMERGE4' => 'Gay Nigger Association of America',
        'group[17305][32]' => '32',
        'group[17305][64]' => '64',
        'group[17393][1024]' => '1024',
        'group[17393][17179869184]' => '17179869184',
        'group[8485][16384]' => '16384',
        'group[8485][2]' => '2',
        'group[8485][524288]' => '524288',
        'group[8485][8]' => '8',
        'group[8485][8192]' => '8192',
        'group[8485][1]' => '1',
        'group[8485][4]' => '4',
        'group[8485][16]' => '16',
        'group[18185][8589934592]' => '8589934592',
        'b_22e306da3a51cd121520da500_81a99090a7' => '',
        'subscribe' => 'Subscribe',
        'input_1.3' => '',
        'input_1.6' => '',
        'input_2.1' => '',
        'input_2.3' => '',
        'input_2.4' => '',
        'input_2.5' => '',
        'input_2.6' => 'United States',
        'input_3' => '',
        'input_3_2' => '',
        'is_submit_1' => '1',
        'gform_submit' => '1',
        'gform_save' => '',
        'gform_resume_token' => '',
        'gform_unique_id' => '',
        'state_1' => $state_1,
        'gform_target_page_number_1' => '0',
        'gform_source_page_number_1' => '1',
        'gform_field_values' => ''
        ]
        );

