. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/repos#create-or-update-file-contents
# PUT /repos/:owner/:repo/contents/:path

# If the script is passed an argument $1 use that as the name
if [ -z "$1" ]
  then
    repo=$repo
  else
    repo=$1
fi

curl ${curl_custom_flags} \
     -X PUT \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/repos/${org}/${repo}/contents/.github/workflows/workflow-with-secrets-app.yml --data @tmp/workflow-with-secrets.json
