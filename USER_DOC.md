# User Documentation

## What does this stack provide?

This project runs a WordPress website accessible via HTTPS, backed by a MariaDB database. Three services are running:

- **NGINX** — the web server, the only entry point. It handles HTTPS connections on port 443.
- **WordPress** — the content management system, where the website and its admin panel live.
- **MariaDB** — the database that stores all WordPress data (posts, users, settings, etc.).

---

## Start and stop the project

**Start everything:**
```bash
make
```

**Stop the containers (data is preserved):**
```bash
make down
```

---

## Access the website

Once the stack is running, open your browser and go to:

```
https://mtaramar.42.fr
```

> Make sure your `/etc/hosts` file contains the following line:
> ```
> 127.0.0.1 mtaramar.42.fr
> ```

Since the TLS certificate is self-signed, your browser will show a security warning. This is expected — proceed anyway.

## Access the WordPress admin panel

```
https://mtaramar.42.fr/wp-admin
```

Log in with the admin credentials defined in your `.env` file (`WP_ADMIN_USER` and `WP_ADMIN_PASSWORD`).

---

## Credentials

All credentials are defined in the `srcs/.env` file on the host machine. This file is never pushed to Git. It contains:

| Variable | Description |
|---|---|
| `MYSQL_DATABASE` | WordPress database name |
| `MYSQL_USER` | Database user for WordPress |
| `MYSQL_PASSWORD` | Database user password |
| `MYSQL_ROOT_PASSWORD` | MariaDB root password |
| `WP_ADMIN_USER` | WordPress admin username |
| `WP_ADMIN_PASSWORD` | WordPress admin password |
| `WP_ADMIN_EMAIL` | WordPress admin email |
| `WP_USER` | WordPress standard user |
| `WP_USER_PASSWORD` | WordPress standard user password |

---

## Check that services are running

**List running containers:**
```bash
docker ps
```

All three containers (`nginx`, `wordpress`, `mariadb`) should appear with status `Up`.

**Check logs for a specific service:**
```bash
docker logs nginx
docker logs wordpress
docker logs mariadb
```
