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

- Symfony 5.4
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

Clear cache:

```bash
php bin/console cache:clear
```
