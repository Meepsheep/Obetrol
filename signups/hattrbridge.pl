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

# https://hattrbridge.com/sign-up

my $get_signup_page = $ua->get('https://hattrbridge.com/sign-up');
        my $signup_page_string = $get_signup_page->as_string;

my ($form_build_id) = ($signup_page_string =~ m/^\<input type\=\"hidden\" name\=\"form\_build\_id\" value\=\"(.*)\" \/\>$/);

my $signup = $ua->post(
        'https://hattrbridge.com/sign-up',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'submitted[i_am_a]' => 'Patient',
        'submitted[first_name]' => 'Gay Nigger Association of America',
        'submitted[last_name]' => 'Gay Nigger Association of America',
        'submitted[email_address]' => $target,
        'submitted[zip___postal_code]' => '81003',
        'submitted[i_am_a_us_resident_and_would_like_to_receive_updates_from_alnylam_pharmaceuticals][I am a US resident and would like to receive updates from Alnylam Pharmaceuticals.]' => 'I am a US resident and would like to receive updates from Alnylam Pharmaceuticals.',
        'submitted[i_agree][i_agree]' => 'i_agree',
        'details[sid]' => '',
        'details[page_num]' => '1',
        'details[page_count]' => '1',
        'details[finished]' => '0',
        'form_build_id' => $form_build_id,
        'form_id' => 'webform_client_form_73'
        ]
        );

