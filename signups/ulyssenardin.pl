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

# https://www.ulysse-nardin.com/subscribe-our-newsletter
# ulyssenardin

my $get_signup_page = $ua->get('https://www.ulysse-nardin.com/subscribe-our-newsletter');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://forms.hsforms.com/submissions/v3/public/submit/formsnext/multipart/4736213/df62e938-e372-44d0-96e6-d697665a9c80',
        Content_Type => 'multipart/form-data',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        Content =>
        [
        'salutation' => 'Dr',
        'firstname' => 'Gay Nigger Association of America',
        'lastname' => 'Gay Nigger Association of America',
        'email' => $target,
        'source' => 'Newsletter',
        'language' => 'English',
        'group' => 'Customer',
        'optin' => 'true',
        'have_accepted_privacy_notice' => 'true'
        ]
        );


