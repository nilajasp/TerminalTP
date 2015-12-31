find ~/Projects/DeleteUnusedResources/DeleteUnusedResources/Resources/drawable/ -name *.png | awk '{ gsub(/\/.*\//,"", $1); gsub(/.png/, "", $1); print}' > imageNames.txt
while read line; do grep -qr $line --include *.xml --include *.axml --include *.cs --exclude Resource.designer.cs ~/Projects/DeleteUnusedResources/DeleteUnusedResources/Source || echo $line ; done <imageNames.txt > notUsedImages.txt
while read line; do rm ~/Projects/DeleteUnusedResources/DeleteUnusedResources/Resources/drawable/$line.png || echo $line ; done < notUsedImages.txt
