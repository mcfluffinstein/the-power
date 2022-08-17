. .gh-api-examples.conf

# https://docs.github.com/en/rest/reference/pulls#create-a-review-for-a-pull-request
# POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews


# If the script is passed an argument $1 use that as the pull number
if [ -z "$1" ]
  then
    pull_number=2
  else
    pull_number=$1
fi

# If the script is passed an argument $2 use that as the commit_id
if [ -z "$2" ]
  then
    commit_id=""
  else
    commit_id=$2
fi

# If the script is passed an argument $3 use that as the impersonation_user 
if [ -z "$3" ]
  then
     user_to_impersonate=${default_committer}
  else
     user_to_impersonate=${3}
fi

# If the script is passed an argument $4 use that as what to do with the ticket
if [ -z "$4" ]
  then
     event="APPROVE"
     body="${event} Spatium tantummodo huiusmodi stercore cadet scribat. Probatus.  Certainly check in with @${org}/${team_slug} who may be interested."
  else
     event=$4
     body="${event} Transierunt cum summa gloria. For support @${org}/${team_slug} can help."

fi

IMPERSONATION_TOKEN=$(bash create-impersonation-oauth-token.sh ${user_to_impersonate}| jq -r '.token')
GITHUB_TOKEN=${IMPERSONATION_TOKEN}

path="README.md"
event_body="${body}"


json_file="tmp/create-pull-request-review.json"

jq -n \
       --arg commit_id "$commit_id" \
       --arg event "$event" \
       --arg body "$body" \
             '{event: $event, body: $body}' > ${json_file}

cat ${json_file}

curl ${curl_custom_flags} \
     -H "Accept: application/vnd.github.v3+json" \
     -H "Authorization: token ${GITHUB_TOKEN}" \
        ${GITHUB_API_BASE_URL}/repos/${org}/${repo}/pulls/${pull_number}/reviews --data @${json_file}
