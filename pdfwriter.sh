OUT=$1;
shift 1;
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$OUT -dBATCH $*