for f in *.html; do
mv "$f" "$(basename "$f" .txt).md"
done
