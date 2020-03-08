# Service Accounts

Service accounts are special accounts that can be used in continuous integration pipelines to authenticate with cloud platforms. With service accounts, it is easier to revoke credentials as well as limit permissions to a certain service. It is always best practice to provide the least amount of permissions required to a service account. 

This GitHub Action requires a service account to authenticate with Firebase Test Lab. 

<br>

## Generating Service Account
Service account is just a JSON key-value pair that contain information on how to authenticate with the cloud platform. To generate a service account, follow the following documentation provided by Google.

Visit: https://firebase.google.com/docs/test-lab/android/continuous

In the requirements section, follow
- step 2: create a service account. Remember to download the JSON-formatted key file.
- step 3: enable required APIs

<br>

## Storing Service Account on GitHub Secrets
Now it is time to store the service account on GitHub secrets, so GitHub Actions has access to it. Open your GitHub repository and follow the following steps:
- Click on settings and select Secrets
- Click on Add a new secret
- The name of the secret **must** be SERVICE_ACCOUNT
- Copy-paste the content the JSON-formatted key file into the value
- Finally, click on Add secret

