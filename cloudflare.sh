#!/bin/sh

# author    Maik Ellerbrock
# twitter   @frapsoft
# homepage  https://frapsoft.com
# github    https://github.com/frapweb/shell-cloudflare
# version   1.0.0
# license   MIT

# clean cache:  sh ./cloudflare.sh domain.com cache
# devmode on:   sh ./cloudflare.sh domain.com devon
# devmode off:  sh ./cloudflare.sh domain.com devoff

# Cloudflare Settings
token=""
email=""
domain=$1
action=""

missingParameter() {
  echo "Usage: `basename $0` domain {cache|devon|devoff}"
  exit 1
}

devModeOn() {
  # Development Mode On
  curl https://www.cloudflare.com/api_json.html \
    -d "a=devmode" \
    -d "tkn=$token" \
    -d "email=$email" \
    -d "z=$domain" \
    -d "v=1"
}

devModeOff() {
# Development Mode Off
curl https://www.cloudflare.com/api_json.html \
  -d "a=devmode" \
  -d "tkn=$token" \
  -d "email=$email" \
  -d "z=$domain" \
  -d "v=0"
}

purgeCache() {
# Purge Cache
curl https://www.cloudflare.com/api_json.html \
  -d "a=fpurge_ts" \
  -d "tkn=$token" \
  -d "email=$email" \
  -d "z=$domain" \
  -d "v=1"
}


if [[ -z $1 || -z $2 ]]
then
 missingParameter
fi

case "$2" in
        devon)
	        echo  "Development Mode On for Domain $1 ..."
	        devModeOn
	      ;;
	      devoff)
          echo  "Development Mode Off for Domain $1 ..."
          devModeOff
         ;;
         cache)
          echo "purging cache from Domain $1 ..."
          purgeCache
        ;;
        *)
          missingParameter
        ;;
esac
