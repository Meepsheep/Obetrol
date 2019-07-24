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

# http://thedeal.com/preferencesform

my $get_signup_page = $ua->get('http://thedeal.com/preferencesform');
        my $signup_page_string = $get_signup_page->as_string;
        # my () = ($signup_page_string =~ m//);

my $phone_number = '';

my $area_code = int(rand(2));

if ($area_code == 0) {
        $phone_number = '505'.(int(rand(899))+100).(int(rand(8999))+1000);
}

elsif ($area_code == 1) {
        $phone_number = '719'.(int(rand(899))+100).(int(rand(8999))+1000);
}

my $signup = $ua->post(
        'http://thedeal.com/newslogin9N.php',
        #Content_Type => '',
        Content_Type => 'application/x-www-form-urlencoded',
        #Content_Type => 'multipart/form-data',
        #Accept => '',
        Accept => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        #Accept => '*/*',
        Content =>
        [
        'actvstnRegReportWeekly' => 'Weekly (Each Monday)',
        'matipsheetReportWeekly' => 'Weekly (Each Thursday)',
        'pvtEqtyWeekly' => 'Weekly',
        'restructuringRegReportWeekly' => 'Weekly (Each Monday)',
        'dealNewsletterWeekly' => 'Weekly (Each Monday)',
        'lifeSetlmntRprtTwiceMonthly' => 'Weekly (each Thursday)',
        'dealflowRprtWeekly' => 'Weekly (Each Tuesday)',
        'dailyDealTwice' => 'Daily',
        'aheadNewsDaily' => 'Daily',
        'actvstnRegReportDaily' => 'Daily',
        'EuropeBriefingDaily' => 'Daily',
        'midMarketDaily' => 'Daily',
        'practicedevDaily' => 'Daily',
        'pvtEqtyDaily' => 'Daily',
        'restrctDaily' => 'Daily',
        'consumerRetailDaily' => 'Daily',
        'energyDaily' => 'Daily',
        'healthcareDaily' => 'Daily',
        'industryDaily' => 'Daily',
        'realEstateDaily' => 'Daily',
        'regulatoryDaily' => 'Daily',
        'tmtDaily' => 'Daily',
        'MA_Opps_RumorsIntraday' => 'Intraday',
        'Public_Markets_Intraday' => 'Intraday',
        'formname' => 'SUBSCRIBEPIPE',
        'FNAME' => 'Gay Nigger Association of America',
        'COMPANY' => 'Gay Nigger Association of America',
        'EMAILID' => $target,
        'TestMode' => '',
        'promocode' => 'PLDEMO1002',
        'TERM' => '001',
        'TRIAL_TERM' => '',
        'PD_PRODUCT' => 'PIPE',
        'PD_TRIAL_END' => '',
        'kcurl' => '',
        'send' => 'true',
        'LNAME' => 'Gay Nigger Association of America',
        'TITLE' => 'COO',
        'phone' => $phone_number,
        'country' => 'USA',
        'state' => 'Colorado',
        'city' => 'Pueblo',
        'industry' => 'All',
        'geographic' => 'All',
        'DEAL_FOCUS' => 'All'
        ]
        );

