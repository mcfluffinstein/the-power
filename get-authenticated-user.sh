. .gh-api-examples.conf

# https://docs.github.com/en/rest/users/users#get-the-authenticated-user
# GET /user

curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/user