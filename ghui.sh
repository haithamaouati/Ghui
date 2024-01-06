#!/bin/bash

# Author: Haitham Aouati
# GitHub: https://github.com/haithamaouati
                                                        clear
figlet -f standard "GHUI"
echo -e " Author: Haitham Aouati\n"

if [ $# -ne 1 ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USERNAME=$1                                             ACCESS_TOKEN="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"
API_URL="https://api.github.com/users/$USERNAME"        
response=$(curl -s -H "Authorization: token $ACCESS_TOKEN" $API_URL)
                                                        if [ -z "$response" ]; then
  echo "Failed to fetch user information. Please check the username and try again."
  exit 1
fi

echo "Username: $(echo "$response" | jq -r .login)"     echo "Name: $(echo "$response" | jq -r .name)"
echo "Email: $(echo "$response" | jq -r .email)"
echo "Bio: $(echo "$response" | jq -r .bio)"
echo "Location: $(echo "$response" | jq -r .location)"
echo "Company: $(echo "$response" | jq -r .company)"
echo "Blog: $(echo "$response" | jq -r .blog)"
echo "Twitter: $(echo "$response" | jq -r .twitter_username)"
echo "Created at: $(echo "$response" | jq -r .created_at)"
echo "Updated at: $(echo "$response" | jq -r .updated_at)"
echo "Public Repositories: $(echo "$response" | jq -r .public_repos)"
echo "Followers: $(echo "$response" | jq -r .followers)"
echo "Following: $(echo "$response" | jq -r .following)"

echo "Public Repositories:"
repo_url="https://api.github.com/users/$USERNAME/repos"
repos=$(curl -s -H "Authorization: token $ACCESS_TOKEN" $repo_url | jq -r '.[].name')
for repo in $repos; do
  echo "  - $repo"
done
