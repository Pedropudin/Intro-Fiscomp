file=$1
if [ "$file" = "all" ]
then 
    echo "Compiling programs"
    gfortran ./tarefa-A/tarefa-A-13696213.f -o ./tarefa-A/tarefa-A-13696213.exe
    gfortran ./tarefa-B/tarefa-B1-13696213.f -o ./tarefa-B/tarefa-B1-13696213.exe
    gfortran ./tarefa-B/tarefa-B2-13696213.f -o ./tarefa-B/tarefa-B2-13696213.exe
    gfortran ./tarefa-B/tarefa-B3-13696213.f -o ./tarefa-B/tarefa-B3-13696213.exe
    gfortran ./tarefa-B/tarefa-B4-13696213.f -o ./tarefa-B/tarefa-B4-13696213.exe
    gfortran ./tarefa-C/tarefa-C-13696213.f -o ./tarefa-C/tarefa-C-13696213.exe
    gfortran ./tarefa-D/tarefa-D-13696213.f -o ./tarefa-D/tarefa-D-13696213.exe
    gfortran ./tarefa-E/tarefa-E-13696213.f -o ./tarefa-E/tarefa-E-13696213.exe
    echo "Executing programs"
    ./tarefa-A/tarefa-A-13696213.exe
    ./tarefa-B/tarefa-B1-13696213.exe
    ./tarefa-B/tarefa-B2-13696213.exe
    ./tarefa-B/tarefa-B3-13696213.exe
    ./tarefa-B/tarefa-B4-13696213.exe
    ./tarefa-C/tarefa-C-13696213.exe
    ./tarefa-D/tarefa-D-13696213.exe
    ./tarefa-E/tarefa-E-13696213.exe
else
    gfortran $file -o a.exe
    if [[ $# -eq 2 && $2 -eq "t" ]]
    then
        time ./a.exe
    else
        ./a.exe
    fi
    rm a.exe
fi