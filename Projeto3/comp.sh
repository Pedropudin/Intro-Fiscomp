file=$1
gfortran $file -o a.exe
if [[ $# -eq 2 && $2 -eq "t" ]]
then
    time ./a.exe
else
    ./a.exe
fi
rm a.exe