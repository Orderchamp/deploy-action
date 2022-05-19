#!/bin/sh

set -e

cat $0 > /service-account.json
export GOOGLE_APPLICATION_CREDENTIALS="/service-account.json"
export ENVIRONMENT=$1

gcloud container clusters get-credentials $2 --zone europe-west4-a --project $3

sh -c " $4"
