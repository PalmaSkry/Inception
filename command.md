# Docker — Cheatsheet complète

---

## Images

```bash
# Construire une image depuis un Dockerfile
docker build -t nom_image .

# Construire depuis un Dockerfile dans un sous-dossier
docker build -t nom_image ./srcs/requirements/nginx/

# Lister toutes les images
docker images

# Supprimer une image
docker rmi nom_image

# Supprimer toutes les images non utilisées
docker image prune -a
```

---

## Containers

```bash
# Lancer un container
docker run nom_image

# Lancer un container en arrière-plan (detached)
docker run -d nom_image

# Lancer un container avec un nom
docker run -d --name mon_container nom_image

# Lancer un container avec un port mappé (hôte:container)
docker run -d -p 443:443 nom_image

# Lancer un container et entrer dedans
docker run -it nom_image bash

# Lister les containers en cours d'exécution
docker ps

# Lister tous les containers (même arrêtés)
docker ps -a

# Arrêter un container
docker stop nom_container

# Démarrer un container arrêté
docker start nom_container

# Redémarrer un container
docker restart nom_container

# Supprimer un container (doit être arrêté)
docker rm nom_container

# Supprimer un container en force
docker rm -f nom_container

# Entrer dans un container qui tourne
docker exec -it nom_container bash

# Voir les logs d'un container
docker logs nom_container

# Suivre les logs en temps réel
docker logs -f nom_container

# Voir les infos détaillées d'un container
docker inspect nom_container
```

---

## Volumes

```bash
# Créer un volume nommé
docker volume create mon_volume

# Lister les volumes
docker volume ls

# Voir les infos d'un volume
docker volume inspect mon_volume

# Supprimer un volume
docker volume rm mon_volume

# Supprimer tous les volumes non utilisés
docker volume prune
```

---

## Networks

```bash
# Créer un réseau
docker network create mon_reseau

# Lister les réseaux
docker network ls

# Voir les infos d'un réseau
docker network inspect mon_reseau

# Supprimer un réseau
docker network rm mon_reseau

# Connecter un container à un réseau
docker network connect mon_reseau nom_container
```

---

## Docker Compose

```bash
# Construire les images et lancer tous les services
docker compose up --build

# Lancer en arrière-plan
docker compose up -d --build

# Arrêter tous les services
docker compose down

# Arrêter et supprimer les volumes
docker compose down -v

# Voir les logs de tous les services
docker compose logs

# Voir les logs d'un service spécifique
docker compose logs nginx

# Suivre les logs en temps réel
docker compose logs -f

# Voir le statut des services
docker compose ps

# Entrer dans un container via compose
docker compose exec nginx bash

# Reconstruire une image spécifique
docker compose build nginx
```

---

## Nettoyage général

```bash
# Supprimer tout ce qui n'est pas utilisé (containers, images, networks, volumes)
docker system prune -a --volumes

# Voir l'espace disque utilisé par Docker
docker system df
```

---

## Commandes utiles pour débugger

```bash
# Voir les processus qui tournent dans un container
docker top nom_container

# Voir les stats en temps réel (CPU, RAM, réseau)
docker stats

# Copier un fichier depuis un container vers l'hôte
docker cp nom_container:/chemin/fichier ./destination

# Copier un fichier depuis l'hôte vers un container
docker cp ./fichier nom_container:/chemin/destination
```
