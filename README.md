# Faça o clone do repositório

```
https://github.com/murilloaguiar/bicrypto.git
```

# Baixe as dependências
```
composer install
npm install
```

Copie o conteúdo de `.env.example` para um novo arquivo chamado `.env` e adeque ao seu ambiente

# Gere a chave da aplicação
```
php artisan key:generate
```

# Rode os seguintes comandos
```
php artisan key:generate
php artisan storage:link
php artisan optimize
```
