# Developer Documentation

## Setting up the environment from scratch

### Prerequisites

- A Linux host or VM (Debian 12 recommended)
- Docker and Docker Compose installed
- `make` installed
- Git

### Clone the repository

```bash
git clone https://github.com/PalmaSkry/inception.git
cd inception
```

### Create the data directories

These directories are mounted as volumes and must exist before running the project:

```bash
mkdir -p /home/mtaramar/data/mariadb
mkdir -p /home/mtaramar/data/wordpress
```

### Configure `/etc/hosts`

Add the following line to resolve the domain locally:

```
127.0.0.1 mtaramar.42.fr
```

### Create the `.env` file

Create `srcs/.env` based on the following template (never commit this file):

```env
DOMAIN_NAME=mtaramar.42.fr

MYSQL_DATABASE=wordpress
MYSQL_USER=login
MYSQL_PASSWORD=your_password
MYSQL_ROOT_PASSWORD=your_root_password

WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=your_admin_password
WP_ADMIN_EMAIL=admin@login.42.fr

WP_USER=mtaramar
WP_USER_PASSWORD=your_user_password
WP_USER_EMAIL=login@login.42.fr
```

---

## Build and launch the project

```bash
make
```

This command builds all Docker images from the Dockerfiles and starts all containers via Docker Compose.

---

## Useful commands

| Command | Description |
|---|---|
| `make` | Build images and start all containers |
| `make down` | Stop and remove containers |
| `make clean` | Stop containers and remove volumes |
| `make fclean` | Full reset — removes containers, volumes and images |
| `make re` | Full rebuild from scratch |
| `docker ps` | List running containers |
| `docker logs <service>` | View logs for a container |
| `docker exec -it <service> bash` | Open a shell inside a container |
| `docker compose -f srcs/docker-compose.yml ps` | Detailed status of all services |

---

## Data storage and persistence

All persistent data is stored on the host machine under `/home/mtaramar/data/`:

| Path on host | Mounted in container | Content |
|---|---|---|
| `/home/mtaramar/data/mariadb` | `/var/lib/mysql` (mariadb) | Database files |
| `/home/mtaramar/data/wordpress` | `/var/www/wordpress` (wordpress + nginx) | WordPress files |

These directories are mounted using Docker named volumes with a local bind driver. Data persists across container restarts and rebuilds. To fully reset the data, run `make fclean` and delete the contents of these directories manually.
