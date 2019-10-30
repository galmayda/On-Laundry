# On-Laundry


## Requirements
```
PHP 7.2 or newer
Laravel Framework 6.0.3
Composer version 1.9.0
XAMPP
```

## Installation

### Update Laravel installer package
```
composer global require "laravel/installer"
```

### Clone project
```
git clone https://github.com/LaundryOnlineIF4104/On-Laundry
```

### Install dependencies on project folder
```
composer install
```

### Create `.env` file
```
# Sesuaikan konfigurasi .env dengan environment anda
cp .env.example .env
```

### Generate App Key
```
php artisan key:generate
```

### Migrate database tables
```
php artisan migrate
```

### Run project
```
php artisan serve
```

## License

The Laravel framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).