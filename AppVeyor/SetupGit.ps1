git config --global credential.helper store
Add-Content "$env:USERPROFILE.git-credentials" "https://$($env:git_access_token):x-oauth-basic@github.com`n"
git config --global user.email "dariokondratiuk@gmail.com"
git config --global user.name "Darío Kondratiuk"
git remote add pages https://github.com/kblok/docfx-playground.git
