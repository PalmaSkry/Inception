*This project has been created as part of the 42 curriculum by mtaramar.*
 
# Inception
 
## Description
 
Inception is a system administration project from the 42 curriculum. The goal is to set up a small infrastructure composed of three services running in isolated Docker containers, orchestrated with Docker Compose:
 
- **NGINX** — the only entry point, handles HTTPS connections on port 443 with a TLS certificate.
- **WordPress** — the CMS, served by php-fpm, generates the website pages.
- **MariaDB** — the database that stores all WordPress data.
All containers are built from scratch using custom Dockerfiles based on `debian:bookworm`. No pre-built images from Docker Hub are used. Data is persisted via Docker volumes bound to the host filesystem. The entire infrastructure is launched with a single `make` command.
 
## Instructions
 
### Prerequisites
 
- Docker and Docker Compose installed
- `make` installed
- Add the following line to `/etc/hosts`:
  ```
  127.0.0.1 mtaramar.42.fr
  ```
- Create the data directories on the host:
  ```bash
  mkdir -p /home/mtaramar/data/mariadb
  mkdir -p /home/mtaramar/data/wordpress
  ```
- Create `srcs/.env` with the required environment variables (see DEV_DOC.md)
### Commands
 
```bash
make        # build images and start all containers
make down   # stop and remove containers
make clean  # stop containers and remove volumes
make fclean # full reset — removes containers, volumes and images
make re     # rebuild everything from scratch
```
 
## Resources
 
- [Docker documentation](https://docs.docker.com/)
- [Docker Compose documentation](https://docs.docker.com/compose/)
- [NGINX documentation](https://nginx.org/en/docs/)
- [MariaDB documentation](https://mariadb.com/kb/en/documentation/)
- [WordPress wp-cli](https://wp-cli.org/)
- [Inception tutorial — grademe.fr](https://tuto.grademe.fr/inception/)
- [cocadmin — YouTube](https://www.youtube.com/@cocadmin)
### AI Usage
 
Claude (Anthropic) was used throughout this project as a learning assistant. It helped me understand Docker concepts (images, containers, volumes, networks, Dockerfiles), debug container issues, and think through the infrastructure architecture step by step. All code and configuration files were written by me.
 