FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

# 1 & 2. Instala dependências e repositório PHP Sury
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates apt-transport-https gnupg2 curl lsb-release unzip zip git nginx \
    && curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org \
    && echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    php8.0-fpm \
    php8.0-cli \
    php8.0-mbstring \
    php8.0-xml \
    php8.0-curl \
    php8.0-gd \
    php8.0-mysql \
    php8.0-zip \
    php8.0-intl \
    php8.0-bcmath \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# 3. Instala o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Configuração do Diretório de Trabalho
WORKDIR /var/www/html
COPY . .

# 5. Ajuste de Permissões Críticas do Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# 6. Configuração do Nginx
COPY ./nginx/default.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# 7. Preparação e Inicialização
RUN mkdir -p /run/php && chown www-data:www-data /run/php

EXPOSE 80

CMD service php8.0-fpm start && nginx -g 'daemon off;'
