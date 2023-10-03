# HOME SERVER APPS
### Current APPS:
- Bitwarden (without ssl for now)
- Heimdall
- Jellyfin
- Jenkins
- Nextcloud
- Prometheus and Grafana
- Portainer
- Postgres
- Transmission
- Yacht
## Installing using Makefile:
### Step 0
 Before running the containers, make sure in .env of each one of them that ports are not being used already by one of your processes
### Step 1
Git checkout/clone project into a path of your choice
### Step 2
Make sure you have Make installed and run following command:
```
make run
```

## Installing using docker-compose:
Go inside each folder and run:
```docker-compose up --build -d```
