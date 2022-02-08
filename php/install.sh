#!/usr/bin/env bash

cd web

echo -e "\033[0;32m[1/2] composer install"
composer install

echo -e "\033[0;32m[2/2] Create database"
php bin/console doctrine:database:create

echo -e "\033[1;37m___________________________________________________"
echo -e ""
echo -e "Symfony 6 application is ready !"
echo -e ""
echo -e "\033[0;32mSymfony app      " http://localhost:8080
echo -e "\033[0;32mPhpMyAdmin       " http://localhost:8081
echo -e ""
echo -e "\033[1;37m___________________________________________________"

apache2-foreground > /dev/null 2>&1