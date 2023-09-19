quant=$#
file=$1
gfortran $file -o out
if [[ $quant -gt 1 && $2 = 't' ]]
then
    time ./out
else
    ./out
fi
rm out