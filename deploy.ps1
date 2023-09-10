rm -recurse .\docs\posts -force
cp -recurse .\content\posts .\docs\
git remote set-url origin git@github.com:kdbed/kdbed.github.io.git
git add -A
git commit -am "update"
git push
