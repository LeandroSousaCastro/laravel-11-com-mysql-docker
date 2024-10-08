# Usar a imagem oficial do PHP 8.4 com FPM
FROM php:8.3.12-fpm

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo pdo_mysql zip

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir o diretório de trabalho
WORKDIR /var/www

# Copiar o projeto atual para o diretório de trabalho do container
COPY . /var/www

# Instalar dependências do Composer
RUN composer install

# Ajustar permissões
RUN chown -R www-data:www-data /var/www

# Expor a porta 9000 que é usada pelo PHP-FPM
EXPOSE 9000

# Comando para iniciar o PHP-FPM
CMD ["php-fpm"]