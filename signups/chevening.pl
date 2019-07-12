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

# https://carpentries.org/newsletter/

my $get_signup_page = $ua->get('https://confirmsubscription.com/h/d/8F250C4C4C63585C');
        my $signup_page_string = $get_signup_page->as_string;

my $signup = $ua->post(
        'https://confirmsubscription.com/t/d/HostedSubscribeForm/sdllru/',
        Content_Type => 'application/json',
        Accept => '*/*',
        Content => '{"fields":[{"id":"fieldEmail","type":"Email","value":["'.$target.'"]},{"id":"fieldealiy","type":"Text","value":["Gay Nigger Association of America"]},{"id":"fieldealij","type":"Text","value":["Gay Nigger Association of America"]},{"id":"fieldealit","type":"MultiSelectOne","value":["3912369"]},{"id":"fieldeaxl","type":"MultiSelectMany","value":[3912394,3912395]},{"id":"fieldeaxd","type":"MultiSelectMany","value":[3912414,3912415,3912416,3912417,3912418,3912420,3912419,3912421,3912422,3912423,3912424,3912425]},{"id":"fieldeaxy","type":"MultiSelectMany","value":[3912396,3912397,3912398,3912399,3912400,3912401,3912408,3912409,3912410,3912411,3912412,3912413,3912402,3912403,3912405,3912404,3912406,3912407]},{"id":"fieldeamd","type":"MultiSelectMany","value":[3912542,3912543,3912544,3912545,3912546,3912535,3912536,3912537,3912538,3912539,3912540,3912529,3912530,3912531,3912532,3912533,3912534,3912524,3912523,3912525,3912526,3912527,3912528,3912517,3912518,3912519,3912520,3912521,3912522,3912511,3912512,3912513,3912514,3912515,3912516,3912505,3912506,3912507,3912508,3912509,3912510,3912499,3912500,3912501,3912502,3912503,3912504,3912493,3912494,3912496,3912495,3912497,3912498,3912487,3912488,3912489,3912490,3912491,3912492,3912481,3912482,3912483,3912484,3912485,3912486,3912475,3912476,3912477,3912478,3912479,3912480,3912469,3912470,3912471,3912472,3912473,3912474,3912463,3912464,3912465,3912466,3912467,3912468,3912457,3912458,3912459,3912460,3912461,3912462,3912451,3912452,3912453,3912454,3912455,3912456,3912445,3912446,3912447,3912448,3912449,3912450,3912439,3912440,3912441,3912442,3912443,3912444,3912433,3912434,3912435,3912436,3912437,3912438,3912432,3912426,3912427,3912428,3912429,3912430,3912431,3912553,3912554,3912555,3912556,3912557,3912558,3912547,3912548,3912549,3912550,3912551,3912552,3912541]}],"referrer":"https://www.chevening.org/subscribe","reCaptchaResponse":null,"marketingEmailConsentCheck":true}'
        );


