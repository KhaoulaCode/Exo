#!/bin/bash

monRandom=${RANDOM:0:2}
i=0
maxscore=5555555550

echo "${monRandom}"
echo "Entrez un nombre entre 1 et 99: ";
read nombre 
while [ "$nombre" != "$monRandom" ]; do
    i=$(($i+1))
    echo "Entrez un nombre entre 1 et 99: ";
    read nombre
done
echo "Félicitations! Vous avez trouvé le nombre mystère, nombre de tentatives: ${i} \nVoulez vous enregistrer votre score ? (y,n)";
read register

if [ "${register}" == "y" ]; then 
    echo "Enterz votre nom svp: "
    read  nom

    if [ ! -f "./tableauScore.txt" ] ; then
        touch "./tableauScore.txt"
    fi

    touch ./temps.txt
    cat ./tableauScore.txt > ./temps.txt

    echo "Le joueur ${nom} à réussi en ${i} tentative(s)" >> "./temps.txt";
    cat temps.txt | sort -k 7n > ./tableauScore.txt 
    rm "./temps.txt"

    fi
fi