# frozen-desserts

## Instructions
Deploy this small rails app, using AWS (You can use the free tier to test this)

## Acceptance Criteria
Acceptance criteria are listed in descending order of importance. Things closer to the bottom should be considered “stretch goals”. For example, you could deploy a version of this that uses sqlite and loses data when it is redeployed until you are able to persist data in a database.

1. it should fork the repo at https://github.com/strongmind/frozen-desserts
1. it should deploy automatically from github using github actions every time the main branch is updated
1. it should run the specs and fail to deploy if the specs fail
1. it should be available from the internet via http or https
1. it should recreate AWS resources if they are destroyed
1. it should persist data in a database