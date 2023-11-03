# cf-eli Database

This database is shared across all of my personal projects. 

## Releasing a new version

Checkout the master branch

```
git checkout master && git pull
```
<!-- 
Bump the version
```
poetry run bumpversion <major|minior|patch>
``` -->
<!-- 
A commit with local files changes (i.e. pyporject.toml, setup.cfg) will be present from the `bumpversion`. So create and merge a PR. -->
```
git checkout -b "version-update-<version>" && git push
```

The CI/CD pipeline will start. Expect your changes to display live in 3-4 minutes.


## Local development

Install the git commit hooks
```bash
pre-commit install && pre-commit install -t pre-push
```

Run the following command to build the image:
```bash
sudo docker-compose build
```

Start the docker container:
```bash
sudo docker-compose up -d
```

## Configuration
For easier configuration while running locally, you can create a `.env` file at the root of the project populated with the dsired parameters.

For example:
```
PG_USER='admin'
PG_PASSWORD='admin'
PG_DB='admin'
```
