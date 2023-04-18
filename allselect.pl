use 5.12.0;
use strict;

undef $/;

my $t = <>;

my $div = "-"x70;

my (%keys, @out);
for (split/------+\s*/, $t){
	my ($key, $content) = /(\S*)\s*(.*)/s;
	$key =~ s/COM$//;
	push @out, "TALKSEC $key" unless defined $keys{$key};
	$keys{$key} = 0;
	push @out, $content;
}

say join "\n\n$div\n\n", @out;

