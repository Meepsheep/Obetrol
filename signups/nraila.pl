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

# https://www.nraila.org/sign-up

my $get_signup_page = $ua->get('https://www.nraila.org/sign-up');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($RequestVerificationToken) = ($signup_page_string =~ m/\<input name\=\"\_\_RequestVerificationToken\" type\=\"hidden\" value\=\"(.*)\" \/\>\<input data\-val/);

my $signup = $ua->post(
        'https://www.nraila.org/sign-up',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        '__RequestVerificationToken' => $RequestVerificationToken,
        'FormId' => '7b9af0c9-024a-4208-9e49-8bd7290dcdfe',
        'FormStep' => '1',
        'NextStep' => '',
        'PrevStep' => '',
        'RecordId' => '',
        'PreviousClicked' => '',
        '6cfc3a7b-b8d8-438a-9294-02289b646ca3' => $target,
        'ea44ac8b-63ed-4de0-8fc5-f9d703caf1a2' => 'Gay Nigger Association of America',
        '1484ba37-ba5c-4209-b4b9-d158ec2941b4' => 'Gay Nigger Association of America',
        '629b9425-909f-4851-8cbf-60e5f33a8bba' => '',
        'b2d3dafe-e024-4796-a739-02305da5adb7' => '612 Wharf Ave',
        '461d6ee0-d19c-4b89-ac6e-a8a5a518becf' => 'Pueblo',
        '5701ab54-d374-4685-b0f9-adac728ea758' => 'Colorado',
        '8ea39fe9-b687-41f6-89a5-efcdaf2977c0' => '81003',
        '8d2b3b9a-5799-4175-b846-8cbe807341d1' => '',
        'efe7b019-3b1d-4350-8be3-71e35a95e4b6' => 'Daily Alerts,Grassroots Alerts,Legal Updates',
        '7b9af0c9-024a-4208-9e49-8bd7290dcdfe' => ''
        ]
        );

