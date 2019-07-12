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

# https://www.jewishgrads.org/receive-updates

my $get_signup_page = $ua->get('https://www.jewishgrads.org/receive-updates');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my ($formstack_url) = ($signup_page_string =~ m/\<script type\=\"text\/javascript\" src\=\"(.*)\"\>\<\/script\>\<p\>\<\/p\>\<noscript\>/);
        $formstack_url =~ s/\&amp\;/\&/g;

my $get_formstack = $ua->get($formstack_url);
        my $formstack_string = $get_formstack->as_string;

my ($viewkey) = ($formstack_string =~ m/document\.write\(\"\<input type\=\\\"hidden\\\" name\=\\\"viewkey\\\" value\=\\\"(.*)\\\" \/\>\"\+\"\\n\"\)\;/);
my ($unique_key) = ($formstack_string =~ m/document\.write\(\"\<input type\=\\\"hidden\\\" name\=\\\"unique\_key\\\" value\=\\\"(.*)\\\" \/\>\"\+\"\\n\"\)\;/);

my $signup = $ua->post(
        $formstack_url,
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'form' => '1597048',
        'viewkey' => $viewkey,
        'unique_key' => $unique_key,
        'password' => '',
        'hidden_fields' => '',
        'incomplete' => '',
        'incomplete_password' => '',
        'referrer' => 'https://www.jewishgrads.org/receive-updates',
        'referrer_type' => 'js',
        '_submit' => '1',
        'style_version' => '3',
        'viewparam' => '531351',
        'field22039390' => 'Gay Nigger Association of America',
        'field22039392' => 'Gay Nigger Association of America',
        'field22040004' => '',
        'field22039601-address' => '612 Wharf Ave',
        'field22039601-address2' => '',
        'field22039601-city' => 'Pueblo',
        'field22039601-state' => 'CO',
        'field22039601-zip' => '81003',
        'field22039601-country' => 'United States',
        'field22039610' => '',
        'field22039841' => '',
        'field22039850' => $target,
        'field22039857' => '',
        'field22039866' => '',
        'field22048968' => ''
        ]
        );
