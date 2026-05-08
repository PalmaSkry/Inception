*This project has been created as part of the 42 curriculum by mtaramar.*

# Inception

## Description

Inception is a system administration project from the 42 curriculum. The goal is to set up a small infrastructure composed of three services running in Docker containers, orchestrated with Docker Compose. The stack includes a MariaDB database, a WordPress site served by php-fpm, and an NGINX web server handling HTTPS connections with a TLS certificate.

All containers are built from scratch using custom Dockerfiles based on `debian:bookworm`. No pre-built images from Docker Hub are used (except the base Debian image). The entire infrastructure is launched with a single `make` command.

### Virtual Machines vs Docker

A virtual machine emulates a complete operating system with its own kernel, drivers and allocated hardware resources. It is heavy, slow to start, and consumes a lot of memory. Docker containers, on the other hand, share the host kernel and only embed what is strictly necessary to run a specific service. They are lightweight, start in seconds, and are much easier to reproduce across different environments.

For this project, Docker was chosen because each service (NGINX, WordPress, MariaDB) is isolated in its own container, communicates through a defined interface, and can be rebuilt identically on any machine.

### Secrets vs Environment Variables

Environment variables (`.env`) are used to pass configuration to containers at runtime. They are convenient but have a limitation: if they end up in the Git repository, credentials are exposed.

Secrets are files containing sensitive data that are mounted directly inside the container, without being stored in environment variables or version control. They are more secure for production use. In this project, the `.env` file is excluded from Git via `.gitignore`, and sensitive values are never hardcoded in any Dockerfile or `docker-compose.yml`.

### Docker Network vs Host Network

With a host network, the container shares the network interface of the host machine directly — no isolation. With a Docker bridge network, containers communicate through a virtual internal network, isolated from the outside. Only explicitly exposed ports are reachable from the host.

In Inception, all three services communicate over a dedicated bridge network called `inception`. Only NGINX exposes port 443 to the outside world. WordPress and MariaDB are only reachable internally.

### Docker Volumes vs Bind Mounts

Docker volumes are managed entirely by Docker — the data is stored in Docker's internal directory and is portable across environments. Bind mounts directly link a host directory to a container path, giving more control over where data is stored on the host filesystem.

This project uses named volumes with a `local` driver and a bind mount configuration, pointing to `/home/mtaramar/data/` on the host. This combines Docker volume management with direct host filesystem access, ensuring data persists across container restarts and rebuilds.

### Main Design Choices

- **Base image**: `debian:bookworm` as required by the subject (penultimate stable Debian release).
- **Volumes**: Named volumes with a local bind driver persist MariaDB and WordPress data under `/home/mtaramar/data/`.
- **Networking**: All containers communicate over the `inception` bridge network, isolated from the host.
- **WordPress setup**: wp-cli is used to automate the WordPress installation and user creation at container startup, without any manual web UI interaction.

---

## Instructions

### Prerequisites

- Docker and Docker Compose installed
- `make` installed
- A Linux host (or VM) with the following entry in `/etc/hosts`:
  ```
  127.0.0.1 mtaramar.42.fr
  ```
- The following directories created on the host:
  ```bash
  mkdir -p /home/mtaramar/data/mariadb
  mkdir -p /home/mtaramar/data/wordpress
  ```
- A `srcs/.env` file with the required environment variables

### Build and Run

```bash
make
```

### Stop

```bash
make down
```

### Clean (stop + remove volumes)

```bash
make clean
```

### Full reset (clean + remove images)

```bash
make fclean
```

### Rebuild from scratch

```bash
make re
```

---

## Resources

- [Docker official documentation](https://docs.docker.com/)
- [Docker Compose documentation](https://docs.docker.com/compose/)
- [NGINX documentation](https://nginx.org/en/docs/)
- [MariaDB documentation](https://mariadb.com/kb/en/documentation/)
- [WordPress wp-cli documentation](https://wp-cli.org/)
- [OpenSSL documentation](https://www.openssl.org/docs/)
- [Inception tutorial — grademe.fr](https://tuto.grademe.fr/inception/)
- [Debian Bookworm packages](https://packages.debian.org/bookworm/)
- [cocadmin — YouTube](https://www.youtube.com/@cocadmin)

### AI Usage

Claude was used throughout this project as a learning assistant. It helped me understand Docker concepts (images, containers, volumes, networks, Dockerfiles) from scratch, debug container startup issues, and think through the architecture of the infrastructure step by step. Claude explained concepts before I wrote any code, which helped me genuinely understand what I was building rather than just copying solutions. All files were written by me based on guided explanations.
