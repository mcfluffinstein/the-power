. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/repos#get-a-repository
# GET the list of repos in the organization:


# If the script is passed an argument $1 use that as the name
if [ -z "$1" ]
  then
    repo=$repo
  else
    repo=$1
fi


# If the script is passed an argument $2 use that as the org
if [ -z "$2" ]
  then
    org=${org}
  else
    org=${2}
fi

curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/repos/${org}/${repo}
