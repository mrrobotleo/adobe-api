#!/bin/bash

JSON=$1

USERNAME="username:company"
PASSWORD="secret"
CREATED="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
UUID="$(cat /proc/sys/kernel/random/uuid)"
NONCE="$(printf $UUID)"
hashString="$(printf $NONCE$CREATED$PASSWORD)"
digest="$(printf $hashString | sha256sum | cut -d " " -f 1 | xxd -r -p | base64)"
b64nonce="$(printf $NONCE | base64)"


result="$(curl -X POST \
     -H 'Content-Type: application/json' \
     -H 'Accept: */*' \
     -H 'Accept-Language: en-GB,en;q=0.5' \
     -H 'Cache-Control: no-cache' \
     -H 'X-WSSE: UsernameToken Username="'"$USERNAME"'", PasswordDigest="'"$digest"'", Nonce="'"$b64nonce"'", Created="'"$CREATED"'", Algorithm="SHA256"' \
     -d @$JSON \
     -s \
     "https://api.omniture.com/admin/1.4/rest/?method=Report.Run" \
     | jq -r '.report.totals[]')"

if [ ! "$result" ] || [ "$result" == "null" ]; then
   echo 0
   echo $result >> /tmp/adobe-api-error.txt
else
   echo $result
fi
