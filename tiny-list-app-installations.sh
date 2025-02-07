. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/apps#list-installations-for-the-authenticated-app
# GET /app/installations

# This endpoint has to be presented with a jwt
JWT=$(./tiny-call-get-jwt.sh)

curl ${curl_custom_flags} \
     -H "Authorization: Bearer ${JWT}" \
     -H "Accept: application/vnd.github.machine-man-preview+json" \
        ${GITHUB_API_BASE_URL}/app/installations
