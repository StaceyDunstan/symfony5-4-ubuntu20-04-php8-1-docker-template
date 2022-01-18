# spoke-phone-manager
Consumes webhooks from Spoke phone apps to manage call recordings and stats

## Docker

To build the docker network run the following commands

    docker-compose build
    docker-compose up -d

Run composer install from inside the spoke-phone-manager container

    docker exec -it spoke-phone-manager bash
    composer install

    
#### ToDo:

    Add Docker-Compose .env file
