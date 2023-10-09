# Ambiente Phoenix & Postgres com Docker

Este é um guia passo a passo para configurar um ambiente Phoenix com Postgres usando Docker.

## Passos

### 1. Construir a imagem

Primeiro, construa a imagem Docker executando o seguinte comando:

```bash
docker-compose build
```

### 2. Criar um app Phoenix

Crie um novo aplicativo Phoenix com o comando a seguir, substituindo <app_name> pelo nome do seu aplicativo desejado:

```bash
docker-compose run --rm app mix phx.new . --app <app_name> --no-assets --no-html
```

Para mais informações, consulte a documentação [aqui](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html)

### 3. Configurar o arquivo config/dev.exs

Abra o arquivo config/dev.exs no seu projeto Phoenix e faça as seguintes alterações:

```elixir
# Configure your database
  config :<app_name>, <app_name>.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "database",
```

Para conseguir acessar a página no navegador pode ser preciso aleterar o host:

```elixir
config :babyapp, BabyappWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {0, 0, 0, 0}, port: 4000],
```

### 4. Subir os containers

Agora, suba os containers, recriando a imagem, com o comando:

```bash
docker-compose up --build
```

### 5. Iniciar o banco e baixar as dependências

Use o script a seguir para iniciar o banco de dados e baixar as dependências do projeto:

```bash
docker-compose exec app /bin/sh docker_start_dev.sh
```

### 6. Verifique se tudo está funcionando

Abra o seu navegador e acesse o seguinte URL para verificar se o ambiente está funcionando corretamente:

```
http://localhost:4000/dashboard
```

Agora você deve ter um ambiente Phoenix com Postgres configurado e funcionando no Docker.

Lembre-se de substituir <app_name> pelo nome real do seu aplicativo Phoenix em todos os lugares apropriados.
Alterando também o nome dos serviços e rede se achar necessário
