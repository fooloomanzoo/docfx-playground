git checkout master
git subtree add --prefix docs gh-pages
docfx metadata docfx_project/docfx.json
docfx build docfx_project/docfx.json -o docs
git add docs/
git commit -m "Docs vx"
git subtree push --prefix docs pages gh-pages