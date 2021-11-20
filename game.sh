PLANSZA=(. . . . . . . . .)
ZNAK="o"
KONIEC="0"

function wyswietl {
	clear
	echo "Wprowadz pole od 1 do 9"
    echo " ${PLANSZA[0]} ${PLANSZA[1]} ${PLANSZA[2]}"
    echo " ${PLANSZA[3]} ${PLANSZA[4]} ${PLANSZA[5]}"
    echo " ${PLANSZA[6]} ${PLANSZA[7]} ${PLANSZA[8]}"
}

function sprawdz_remis {
	FLAG="1"
	for i in ${PLANSZA[*]} 
	do
		if [ $i == "." ] ; then
			FLAG="0"
		fi
	done
	if [ $FLAG == "1" ] ; then
		KONIEC="1"
	fi
}

function sprawdz_wygrana {
    if [ ${PLANSZA[0]} != "." ] && [ ${PLANSZA[0]} == ${PLANSZA[1]} ] && [ ${PLANSZA[1]} == ${PLANSZA[2]} ] ; then
        KONIEC="1"
    elif [ ${PLANSZA[3]} != "." ] && [ ${PLANSZA[3]} == ${PLANSZA[4]} ] && [ ${PLANSZA[4]} == ${PLANSZA[5]} ] ; then
        KONIEC="1"
    elif [ ${PLANSZA[6]} != "." ] && [ ${PLANSZA[6]} == ${PLANSZA[7]} ] && [ ${PLANSZA[7]} == ${PLANSZA[8]} ] ; then
        KONIEC="1"
	elif [ ${PLANSZA[0]} != "." ] && [ ${PLANSZA[0]} == ${PLANSZA[3]} ] && [ ${PLANSZA[3]} == ${PLANSZA[6]} ] ; then
        KONIEC="1"
	elif [ ${PLANSZA[1]} != "." ] && [ ${PLANSZA[1]} == ${PLANSZA[4]} ] && [ ${PLANSZA[4]} == ${PLANSZA[7]} ] ; then
        KONIEC="1"
	elif [ ${PLANSZA[2]} != "." ] && [ ${PLANSZA[2]} == ${PLANSZA[5]} ] && [ ${PLANSZA[5]} == ${PLANSZA[8]} ] ; then
        KONIEC="1"
	elif [ ${PLANSZA[0]} != "." ] && [ ${PLANSZA[0]} == ${PLANSZA[4]} ] && [ ${PLANSZA[4]} == ${PLANSZA[8]} ] ; then
        KONIEC="1"
	elif [ ${PLANSZA[2]} != "." ] && [ ${PLANSZA[2]} == ${PLANSZA[4]} ] && [ ${PLANSZA[4]} == ${PLANSZA[6]} ] ; then
        KONIEC="1"
    fi
	sprawdz_remis
}

function zmiana_gracza {
	if [ $ZNAK == "o" ] ; then
		ZNAK="x"
	elif [ $ZNAK == "x" ] ; then
		ZNAK="o"
	fi
}

while [ $KONIEC != "1" ]
do
	wyswietl
	echo "Gracz ${ZNAK}"

	read POLE
	if [ ${PLANSZA[POLE-1]} != "." ] ; then
		continue
	fi
	PLANSZA[POLE-1]=$ZNAK
	wyswietl
	
	sprawdz_wygrana
	zmiana_gracza	
done
echo "KONIEC GRY"
