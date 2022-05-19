#!/bin/sh

set -e

echo "$1"

echo "$1" > /service-account.json
export GOOGLE_APPLICATION_CREDENTIALS="/service-account.json"
export ENVIRONMENT=$2

gcloud auth activate-service-account --key-file=/service-account.json
gcloud container clusters get-credentials $3 --zone europe-west4-a --project $4

sh -c " $5"
