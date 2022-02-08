# Starter-Kit Symfony

Starter-Kit Symfony 6 par Magle-corp.

🎼 Symfony 6  🚀 PHP 8   🏗 MySQL  📋 PhpMyAdmin  🐋 Docker

___

## Requis

Assurez-vous que les ports suivants sont disponibles :
- 3306 - MySQL
- 8081 - PhpMyAdmin
- 9074 - Symfony

## Installation

```shell
git clone git@github.com:Magle-corp/Starter-Symfony-6.git
cd Starter-Symfony-6
cp .env.example .env && cp web/.env.example web/.env
docker-compose up --build
```

- Symfony app disponible [http://localhost:9074](http://localhost:9074)
- PhpMyAdmin disponible [http://localhost:8081](http://localhost:8081)