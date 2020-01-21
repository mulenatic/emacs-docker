#!/bin/bash

EMACS_DIR="/emacsDocuments";

if [ ! -d "$EMACS_DIR" ];
then
    echo "No volume bound to $EMACS_DIR. Please start the container with \"-v <desired path to directory on the host>:$EMACS_DIR\"";

    if [ $# -eq 1 ];
    then
	EMACS_DIR=$HOME
	echo "Checking out repository: "
	cd ~;
	git clone $1;
    else     
	exit 1
    fi
fi

#TestAddons

declare -a files=("$EMACS_DIR/");

#for file in $@
#do
#    files=("$files" "$EMACS_DIR/$file");
#done

#scriptAddons

exec emacs "${files[@]}"
