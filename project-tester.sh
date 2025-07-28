#!/bin/bash

networks=("galera_net" "app_network")
compose_files=("db/docker-compose.yml" "app/docker-compose.yml" "app/nginx/docker-compose.yml")

check_network() {
    if ! docker network ls | grep -q "$1"; then
        echo "Network $1 does not exist. Creating..."
        docker network create "$1"
    else
        echo "Network $1 already exists."
    fi
}

run_compose() {
    read -p "Do you want to run $1? (y/n): " choice
    if [[ "$choice" == "y" ]]; then
        docker-compose -f "$1" up -d
        echo "$1 is running."
    else
        echo "$1 is not running."
        exit 1
    fi
}
for network in "${networks[@]}"; do
    check_network "$network"
done

if [[ "$1" == "-a" ]]; then
    for compose_file in "${compose_files[@]}"; do
    docker-compose -f "$compose_file" up -d
    done
else
    for compose_file in "${compose_files[@]}"; do
        run_compose "$compose_file"
    done
fi
