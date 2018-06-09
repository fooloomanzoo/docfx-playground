git config --global credential.helper store
Add-Content "$HOME\.git-credentials" "https://$($env:git_access_token):x-oauth-basic@github.com`n"
git config --global user.email "dariokondratiuk@gmail.com"
git config --global user.name "Darío Kondratiuk"
git remote add pages https://github.com/kblok/docfx-playground.git
git checkout master
$Env:VSINSTALLDIR="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional"
$Env:VisualStudioVersion="15.0"
docfx metadata docfx_project/docfx.json
docfx build docfx_project/docfx.json -o docs
git add docfx_project/*
git subtree push --prefix docs origin pages