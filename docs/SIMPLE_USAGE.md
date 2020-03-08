# Simple Usage
The following documents shows a simple tutorial on how to start using this GitHub Action.

<br>

## Step 1 - Define a ARG SPEC
The ARG SPEC file defines what and how to run your tests. In this step, create a YAML file with the required arguments for Firebase Test Lab. To learn more about creating a ARG SPEC file, follow these [instructions.](ARG_SPEC.md)

<br>

## Step 2 - Service Account Authentication
GitHub Actions will require authentication to communicate with Firebase Test Lab. In this step, you will need to create a service account and store it in the GitHub Secrets. To learn more about service account, follow these [instructions.](SERVICE_ACCOUNT.md)

<br>

## Step 3 - Workflow YML
Lastly, integrate the Firebase Test Lab Action into your workflow. Note that, you must already have your build artifacts generated prior to calling the action. In the job, specify the `arg-spec` and `SERVICE_ACCOUNT` properties for the action to use. An example of the workflow can be found below.
```
name: Android CI
on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      # Check out the repository
      - uses: actions/checkout@v2

      # Run the Firebase Test Lab Action
      - name: Run tests on Firebase Test Lab
        uses: asadmansr/Firebase-Test-Lab-Action@v1.0
        with:
          arg-spec: 'tests.yml:android-pixel-4'
        env:
          SERVICE_ACCOUNT: ${{ secrets.SERVICE_ACCOUNT }}
```