if($env:APPVEYOR_REPO_TAG -eq 'True'){
    git config --global credential.helper store
    Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:git_access_token):x-oauth-basic@github.com`n"

    git config --global user.email "hannes-b@web.de"
    git config --global user.name "Johannes Brautzsch"
    git remote add pages https://github.com/fooloomanzoo/docfx-playground.git
    git fetch pages
    git checkout master
    git subtree add --prefix docs pages/gh-pages
    docfx metadata docfx_project/docfx.json
    docfx build docfx_project/docfx.json -o docs
    git add docs/* -f
    git commit -m "Docs version $($env:APPVEYOR_REPO_TAG_NAME)"
    git subtree push --prefix docs pages gh-pages
}