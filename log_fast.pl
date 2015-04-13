use strict;
use warnings;

my %count;
my @elements_in_log;
my %final_count;
my $logs_file = [$PATH_TO_FILE]; #Edit according to your file path

open(my $logs, $logs_file) or die "Error reading file.";
while (my $logs = <$logs>) {
	chomp $logs;
	@elements_in_log = split("/", $logs);
	foreach my $operations("$elements_in_log[2]$elements_in_log[1]"){
		$count{$operations}++;
	}
}

foreach my $operation (sort keys %count) {
	$operation = substr($operation, 0, index($operation, 'user'));
        foreach my $op($operation){
                $final_count{$operation}++;
        }
}

foreach my $operation((reverse sort {$final_count{$a} <=> $final_count{$b}} keys %final_count)[0..2])  {
       printf "%-25s %s\n", $operation, $final_count{$operation};
}
