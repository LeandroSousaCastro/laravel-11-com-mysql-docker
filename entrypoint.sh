#!/bin/bash

# Executar composer install
composer install

#gera a chave do app
php artisan key:generate

#executa as migration
php artisan migrate

# Iniciar o servidor Laravel
php artisan serve --host=0.0.0.0 --port=8000