#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Cookies;
use File::Basename;
use lib dirname (__FILE__);
use ProxyTest;

my $target = shift;
my $proxy_file = 'proxies.txt';
my $signups_dir = 'signups';
my $user_agent = 'Mozilla\/5\.0 \(Macintosh\; Intel Mac OS X 10\.11\; rv\:55\.0\) Gecko\/20100101 Firefox\/55\.0';

unless ($target =~ m/\@.*(\.gov|\.mil)/) {
	# lol no

	print 'Hitting '.$target."\n";

	chomp($target);
	my $hiv_test_result = '';
	my $proxy = '';

	until ($hiv_test_result eq 'positive') {

		open PROXIES, '<', $proxy_file or die "error opening $proxy_file: $!";
			my $proxy_list = do { local $/; <PROXIES> };
		my @split_proxies = split("\n", $proxy_list);
			$proxy = $split_proxies[0];
		$proxy_list =~ s/$proxy\n//g;
			$proxy_list = $proxy_list.$proxy;
		close PROXIES;

		open PROXIES, '>', $proxy_file or die "error opening $proxy_file: $!";
			print PROXIES $proxy_list."\n";
		close PROXIES;

		print 'Testing '.$proxy."\n";

		$hiv_test_result = ProxyTest::ipchicken_test($proxy);

		}

		opendir my $obetrol_dir, $signups_dir or die "Cannot open directory: $!";
			my @signups = readdir $obetrol_dir;
		closedir $obetrol_dir;

		my $signup_count = scalar(@signups);
		my $current_signup = '';
		my $fuck_real_life_anime_is_real_life = 0;


		while ($fuck_real_life_anime_is_real_life < $signup_count) {

			$current_signup = shift(@signups);

			if (($current_signup =~ m/(.*)\.pl$/) and ($current_signup ne 'template.pl')) {

				print 'Running '.$current_signup."\n";
				print `perl $signups_dir/$current_signup $target $proxy $user_agent`;
				print "\n";

			}

			$fuck_real_life_anime_is_real_life++;

		}

	print 'Done with '.$target."\n";

}
