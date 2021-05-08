stack exec site clean
stack build
stack exec site build
git add .
git commit -m "commit"
git push -u origin master
