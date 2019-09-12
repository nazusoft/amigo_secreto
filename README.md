### AMIGO SECRETO ###

App Amigo Secreto - Gerenciador fácil e rápido para a brincadeira Amigo Secreto.

## Ferramentas utilizadas:

- ruby 2.5.1
- rails 5.2
- rails credentials
- mysql 5.7
- mailcatcher
- puma
- devise
- coffee rails
- jquery rails
- materializecss 1.0.0
- redis
- sidekiq
- rspec
- ffaker
- factory bot rails

## Executado utilizando Docker:

- Dockerfile
- docker-compose version 3

## Execução:

```
docker-compose build

docker-compose run --rm app bundle install

docker-compose run --rm app bundle exec rails secret

docker-compose run --rm app bundle exec db:create db:migrate

docker-compose up
```
