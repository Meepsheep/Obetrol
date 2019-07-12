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

# https://www.coolearth.org/newsletter-signup/

my $get_signup_page = $ua->get('https://www.coolearth.org/newsletter-signup/');
        my $signup_page_string = $get_signup_page->as_string;

my ($state_31) = ($signup_page_string =~ m/\<input type\=\'hidden\' class\=\'gform\_hidden\' name\=\'state\_31\' value\=\'(.*)\' \/\>/);

my $signup = $ua->post(
        'https://www.coolearth.org/newsletter-signup/',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'input_1' => 'Gay Nigger Association of America',
        'input_2' => 'Gay Nigger Association of America',
        'input_3' => $target,
        'input_8' => '2',
        'input_5' => '14',
        'consentvalues' => '{"formID":14,"consentValues":{"optInMarketing":1,"acceptDataPolicy":"1"}}',
        'input_9' => '1',
        'input_10' => '',
        'is_submit_31' => '1',
        'gform_submit' => '31',
        'gform_unique_id' => '',
        'state_31' => $state_31,
        'gform_target_page_number_31' => '0',
        'gform_source_page_number_31' => '1',
        'gform_field_values' => ''
        ]
        );

my $post_signup = $ua->post(
        'https://www.coolearth.org/newsletter-signup/thank-you-for-joining-us/?formCompletion=Newsletter_Signups',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
        );

