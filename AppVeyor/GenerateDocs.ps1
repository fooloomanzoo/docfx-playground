git config --global credential.helper store
Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:git_access_token):x-oauth-basic@github.com`n"

git config --global user.email "dariokondratiuk@gmail.com"
git config --global user.name "Darío Kondratiuk"
git remote add pages https://github.com/kblok/docfx-playground.git
git checkout master
git subtree --branch --prefix docs --branch gh-pages
docfx metadata docfx_project/docfx.json
docfx build docfx_project/docfx.json -o docs
git add docs/
git commit -m "Docs vx"
git subtree push --prefix docs pages gh-pages