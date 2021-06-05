# Unomi Studio
Dashboard to manage apps and tenants for tracking and analytics

# Supported

Apache Unomi : 1.5.6
Elastic Search: 7.4.2

## How to run

## Docker
```
docker-compose build
```

```
docker-compose up -d
```

Wait till unomi docker container is up and running

```
cd scripts
./post-deploy-script.sh
```

## UI

Run following url in browser

```
http://localhost:8085
```

### Tenant View

![tenants](./img/tenants.png)

### Apps View

![apps](./img/apps.png)

### Dashboard View

![dashboard](./img/dashboard.png)

## Rest Api

Unomi studio exposes api and ui


```
Base Path: http://localhost:8085/v1/api
```

#SSL

Replace the self signed certificates with your real certificates, dont change the name of the certificate

# Documentation

Read the [docs](https://unomi-studio.netlify.app)
Read about apache unomi [here](https://unomi.apache.org/manual/1_5_x/index.html)

# Issues

For issues please report [here](https://github.com/grootan/unomi-studio/issues)

# Roadmap

Addition and deletion of Rules
Add Support for goals
Add Support for campaigns
Add Waiting period in ui till elasticsearch and unomi boots up

# TroubleShooting

Sometimes unomi-studio may boot up earlier than elasticsearch and unomi, in such cases wait till other containers are booted
and restart unomi-studio container
After running the script, unomi may take 15 to 20 mins to update geo database, so in such cases apache unomi may not respone
