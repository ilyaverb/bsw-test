# Project

## Setup and Launch

Follow the steps below to set up the environment and launch the project using Docker.

### Step 1: Create the `.env` configuration file

Copy the `.env.sample` file to a new `.env` file. This file will contain the necessary environment variables for project.

```bash
cp ./bet-maker/.env.sample ./bet-maker/.env
cp ./line-provider/.env.sample ./line-provider/.env
```
### Step 2: Create common docker network for services
Create a docker network named "bsw_network"
```bash
docker network create bsw_network
```
### Step 3: Start infrastructure container
This command will start RabbitMQ container on a shared network:
```bash
docker-compose -f docker-compose.infra.yml up --build
```

### Step 4: Start the services using Docker

To build and start all the required containers, run the following commands:
```bash
cd ./bet-maker
docker-compose up --build 
cd ../line-provider
docker-compose up --build
```

### Step 5: Usage
RabbitMQ admin panel: http://0.0.0.0:15672
Line-provider service docs: http://0.0.0.0:8001/docs
Bet-maker service docs: http://0.0.0.0:8002/docs