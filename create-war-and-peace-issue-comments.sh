. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/issues#create-an-issue-comment
# POST /repos/{owner}/{repo}/issues/{issue_number}/comments

issue_id=${1:-1}

json_file="tmp/issue-comment.json"

for file in `ls tmp/wp_*`
do
    lorem_file=${file}
    lorem_text=$(cat $lorem_file)
    lorem_append="<br><br><br>The @${org}/${team_slug} will be interested in this."

    jq -n \
          --arg body "${lorem_text}${lorem_append}" \
               '{
                 body: $body
               }' > ${json_file}


curl --silent ${curl_custom_flags} \
          -X POST \
          -H "Accept: application/vnd.github.VERSION.full+json" \
          -H "Authorization: token ${GITHUB_TOKEN}" \
             ${GITHUB_API_BASE_URL}/repos/${org}/${repo}/issues/${issue_id}/comments -d @${json_file} | jq -r '"\(.id),\(.created_at),\(.user.login)"'
done
