#!/bin/bash

#$ -q single.q
#$ -j yes
#$ -cwd

export OMP_NUM_THREADS=1

t0=$(date +%s.%N)
t0_string=$(date)

joveru=0.25
for n in `seq 3.6 0.1 4.0`
do
    for u in `seq 5 20`
    do
        ./srofm $n $u $joveru
    done
done

t1=$(date +%s.%N)
t1_string=$(date)

t=$(echo "$t1 - $t0"|bc)
h=$(echo "($t/3600)"|bc)
m=$(echo "($t%3600)/60"|bc)
s=$(echo "($t%3600)%60"|bc)

echo ""
echo "# Job Start : $t0_string"
echo "# Job End   : $t1_string"
echo "# Elapsed time : ${h}h ${m}m ${s}s"
echo ""
