find $1/Resources/ -name drawable* | xargs -n 1 basename > directoryNames.txt
while read directoryName; do
find $1/Resources/$directoryName/ -name *.png | awk '{ gsub(/\/.*\//,"", $1); gsub(/.png/, "", $1); print}' > imageNames.txt
while read line; do grep -qr $line --include *.xml --include *.axml --include *.cs --exclude Resource.designer.cs $1/Source || echo $line ; done <imageNames.txt > notUsedImages.txt
while read line; do rm $1/Resources/$directoryName/$line.png || echo $line ; done < notUsedImages.txt ; done <directoryNames.txt
