for i in `seq 1 4`
do
sysbench --threads=4 --test=oltp_read_only --mysql-db=sbtest$i --mysql-host=127.0.0.1 --mysql-user=sbtest$i --mysql-password=sbtest$i --tables=4 --table_size=100000 prepare
done
