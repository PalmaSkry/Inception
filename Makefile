all:
	mkdir -p /home/mtaramar/data/mariadb
	mkdir -p /home/mtaramar/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down -v
	sudo rm -rf /home/mtaramar/data/mariadb/*
	sudo rm -rf /home/mtaramar/data/wordpress/*

fclean: clean
	docker image prune -a -f

re: fclean all
