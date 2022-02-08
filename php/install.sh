#!/usr/bin/env bash

cd web

composer install

echo -e "___________________________________________________"
echo -e ""
echo -e "Symfony 6 application is ready !"
echo -e ""
echo -e "\033[0;32mSymfony app      " http://localhost:9074
echo -e "\033[0;32mPhpMyAdmin       " http://localhost:8081
echo -e ""
echo -e "___________________________________________________"

apache2-foreground > /dev/null 2>&1