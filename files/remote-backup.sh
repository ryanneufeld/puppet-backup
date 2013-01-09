# Setup log file by date name.
# Get day of week, for 7 day rotating backups.





for host in $(cat backup.conf)
do

	scp $user@$host:backup.manifest ./$host.manifest

	mkdir ./$host

	cd $host

	for item in `cat ../$host.manifest`
	do
		#http://www.commandlinefu.com/commands/view/11690/the-fastest-remote-directory-rsync-over-ssh-archival-i-can-muster-40mbs-over-1gb-nics
		rsync -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x" $user@$host:$item ./
	done
done
