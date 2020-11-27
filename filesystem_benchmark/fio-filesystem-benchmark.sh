#!/usr/bin/env bash

function usage {
cat << EOF

example:
 ./fio-filesystem-benchmark.sh -a SES6_GM_NFS -d fiofiles


EOF

exit

}

while getopts a:d:h option
do
	case $option in 
		a) archive_dir=$OPTARG ;;
		d) fiofiles_dir=$OPTARG ;;
		h) usage ;;
	esac
done

test -z $2 && exit 1
test -z $4 && exit 1

if [ -d "$archive_dir" ]
then
	echo "$archive_dir exists"
	exit 1
else
	mkdir -p "$archive_dir/results/000000"
fi

for fiofile in `ls -1 $fiofiles_dir`
do
        fio_out_dir="$archive_dir/results/000000/id-$(shuf -i 2000000000000-65000000000000 -n 1)"
	until [ ! -d "$fio_out_dir" ]
	do
	       	fio_out_dir="$archive_dir/results/000000/id-$(shuf -i 2000000000000-65000000000000 -n 1)"
	done

	mkdir -p $fio_out_dir
        fio $fiofiles_dir/$fiofile --output-format=json --write_iops_log=$fio_out_dir/output.0 --write_bw_log=$fio_out_dir/output.0 --write_lat_log=$fio_out_dir/output.0  > $fio_out_dir/json_output.0.$archive_dir

	if [ ! -z "`grep directory $fiofiles_dir/$fiofile`" ]
	then 
		rm -f $(grep directory $fiofiles_dir/$fiofile | cut -d = -f 2)/$(grep filename $fiofiles_dir/$fiofile | cut -d = -f 2)
	fi

done
