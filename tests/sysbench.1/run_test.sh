TIME=120
THREADS=50
PARAL=4
LOOPS=10

run_bench() {
ID=$1
PS=auto
SKIPTRX=off
TEST=$((RANDOM % 4))
case $TEST in
    0) TEST=oltp_read_only
    ;;
    1) TEST=oltp_point_select
    ;;
    2) TEST=oltp_write_only
    ;;
    3) TEST=oltp_read_write
    ;;
esac
if [ $(($RANDOM % 2)) -eq 1 ]; then
    PS=disable
fi
if [ $TEST = "oltp_read_only" -o $TEST = "oltp_point_select" ]; then
    if [ $(($RANDOM % 2)) -eq 1 ]; then
        SKIPTRX=on
    fi
fi
sleep $((($RANDOM % 5) + 2))
sysbench --time=$TIME --max-requests=0 --threads=$THREADS --test=$TEST --mysql-db=sbtest$ID --mysql-host=127.0.0.1 --mysql-port=6033 --mysql-user=sbtest$ID --mysql-password=sbtest$ID --tables=4 --table_size=100000 --db-ps-mode=$PS --skip_trx=$SKIPTRX run
}

for l in `seq 1 $LOOPS`
do
    for i in `seq 1 $PARAL`
    do  
        run_bench $i &
    done
    wait
done
