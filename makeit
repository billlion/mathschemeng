#/bin/bash
filename=$1
asolns="_solns.pdf"
cp setboolean notesflag.tex
pdflatex $filename
mv "$filename.pdf" "$filename$asolns"
cp blank notesflag.tex
pdflatex $filename

