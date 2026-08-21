# Simple PHP Webshop

## The website 

Simple PHP / Symphony Ecommerce website with Stripe Payment.


## Admin panel

Features: 
- add products
- modify banners
- top products
- handle users
- carriers
- categories
- orders

## Stack used:

- Symfony 6.4
- Easy Admin
- Twig
- Bootstrap
- Stripe
- Mailjet

## Install instructions

  
 ```bash
 composer install
```

Database:

```bash
DATABASE_URL="mysql://user_name:password@127.0.0.1:3306/database_name?serverVersion=mariadb-10.3.25"
APP_ENV=dev
```

Sync metadata:

```bash
php bin/console doctrine:migrations:sync-metadata-storage
```

Clear cache:

```bash
php bin/console cache:clear
```

## Run it (dev)

```bash
symfony serve
```


## Run tests

Individual tests

`php bin/phpunit tests/[FILENAME].php`