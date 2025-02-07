. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/repos#create-a-release
# POST /repos/:owner/:repo/releases

json_file=tmp/create-release.json
timestamp=$(date +%s)

jq -n \
        --arg tag "v1.0.${timestamp}" \
        --arg commitish "${base_branch}" \
        --arg name "Release 1 ($timestamp)" \
        --arg generate_release_note  "true" \
        --arg body "The first and possibly last ever release." \
        '{tag_name : $tag, target_commitish: $commitish, name: $name, generate_release_note: $generate_release_note | test("true"), body: $body }'  > ${json_file}

cat $json_file | jq -r >&2

curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/repos/${org}/${repo}/releases --data @${json_file}

rm -f ${json_file}
