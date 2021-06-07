# Unomi Studio

Dashboard to manage tenants and apps for tracking and analytics

## Supported

- Apache Unomi : 1.5.6
- Elastic Search: 7.4.2

## Prerequisites

- Docker
- Docker Compose

## How to run

## Docker

```sh
docker-compose up -d
```

Wait till unomi docker container is up and running

```sh
cd scripts
./post-deploy-script.sh
```

## UI

Run following URL in browser

```sh
http://localhost:8085
```

### Tenant View

![tenants](./img/tenants.png)

### Apps View

![apps](./img/apps.png)

### Dashboard View

![dashboard](./img/dashboard.png)

## Rest API

Unomi studio exposes API and UI

```sh
Base Path: http://localhost:8085/v1/api
```

## SSL

Replace the self signed certificates with your real certificates, don't change the name of the certificate

## Documentation

Read the [docs](https://unomi-studio.netlify.app)
Read about apache unomi [here](https://unomi.apache.org/manual/1_5_x/index.html)

## Issues

For issues please report [here](https://github.com/grootan/unomi-studio/issues)

## Roadmap

- Addition and deletion of Rules.
- Add Support for Goals.
- Add Support for Campaigns.
- Add Waiting period in UI till elasticsearch and unomi boots up.

## TroubleShooting

- Sometimes unomi-studio may boot up earlier than elasticsearch and unomi, in such cases wait till other containers are booted and restart unomi-studio containers.
- After running the script, unomi may take 15 to 20 mins to update the geo database, so in such cases apache unomi may not respond.
