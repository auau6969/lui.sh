
ELENCO="./database.dat"
 
show_menu() {

        echo
        echo
        echo "███████╗███████╗"
        echo "██╔════╝╚════██║"
        echo "█████╗░░░░███╔═╝"
        echo "██╔══╝░░██╔══╝░░"
        echo "███████╗███████╗"
        echo "╚══════╝╚══════╝"
        echo "-- Elenco Dati --                      by Lojacops"
        echo "1. Mostra"
        echo "2. Aggiungi"
        echo "3. Svuota"
        echo "q. ESCI"
        echo -en "> "
        
 
}
 
do_menu() {
 
        i=-1
        while [ "$i" != "q" ]; do
                show_menu
                read i
                i=`echo $i | tr '[A-Z]' '[a-z]'`
                case "$i" in
                        "1")
                        mostra
                        ;;
                        "2")
                        aggiungi
                        ;;
                        "3")
                        svuota
                        ;;
                        "q")
                        echo "Adiossssss"
                        exit 0
                        ;;
                        *)
                        echo "non capisco :("
                        ;;
                esac
        done
 
}
 
mostra() {
        #elenco tutti gli elementi
        grep -i "" $ELENCO | while read i; do
                echo "$i" | tr ':' '\t'
        done
}
 
aggiungi() {
 
        #aggiungo un elemento
        echo "Ti chiederemo 2 dati:"
        echo "  - un dato primario, ed un dato secondario"
        echo
        echo -en "primo_dato"
        read primo_dato
        echo -en "secondo_dato"
        read secondo_dato
        echo "${primo_dato}:${secondo_dato}" >> $ELENCO
 
}
 
conferma() {
 
        echo -en "$@"
        read risp
        risp=`echo $risp | tr '[a-z]' '[A-Z]'`
        if [ "$risp" == "Y" ]; then
                return 0
        else
                return 1
        fi
 
}

svuota() {
 
        conferma "Vuoi cancellare tutti i TUOI dati? (Y/N) "
        if [ "$?" -eq "0" ]; then
                echo -n "" > $ELENCO
        else
                echo "Cancellazione annullata."
        fi
 
}

svuota() {
 
        conferma "Vuoi cancellare tutti i TUOI dati? (Y/N) "
        if [ "$?" -eq "0" ]; then
                echo -y "" > $ELENCO
        else
                echo ""
        fi
echo "Fatto!"
}

 
do_menu




#UwU finito!