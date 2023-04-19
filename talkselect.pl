use 5.12.0;
use strict;

my $div = "-"x70;
my ($sf, $tf) = @ARGV;

undef $/;

my %keys;

open(S, $sf);
my $s = <S>;

for (split /\s+/, $s){
	$keys{$_} = 0;
}

open(T, $tf);
my $t = <T>;
$t =~ s/\bENDTALK\b.*//s;
my @t = split/TALKSEC\s+/, $t;
shift @t;

for (@t){
	chomp;
	my ($key, $content) = /(\S*)\s*(.*)/s;
	$content =~ s/[\s-]*//;
	say "TALKSEC $key\n";
	say "$div\n";
	say $content if (defined $keys{$key})
}

