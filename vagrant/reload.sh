vagrant global-status | grep virtualbox | cut -c 1-9 | \
	while read line;
	do echo $line;
		vagrant reload $line;
	done;
