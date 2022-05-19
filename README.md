# Deploy-action
This is a github action to deploy using shopify krane, kubectl, and gcloud.

## Usage
```
  - uses: 'orderchamp/deploy-action@v0'
    with:
      credentials_json: '${{ secrets.GCP_SA_KEY }}'
      environment: production
      command: krane render -f deploy/production/krane --current-sha $GITHUB_SHA | krane deploy $PROJECT $CLUSTER -f - deploy/production/krane/secrets.ejson
```
