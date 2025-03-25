# AuthCpf

AuthCpf é um serviço responsável por validar o CPF recebido no header de requisições, verificando sua disponibilidade no banco de dados do serviço FoodOrder. Caso o CPF esteja disponível, a autenticação é realizada com sucesso. Caso contrário, a requisição é negada com status 403.

## Como Rodar o Projeto

Para rodar o serviço localmente, execute o comando abaixo no terminal:

```bash
iex -S mix
```

Certifique-se de ter todas as dependências instaladas e o ambiente configurado corretamente antes de executar o comando.

## Funcionamento

1. O serviço recebe uma requisição HTTP com o CPF no header.
2. Ele consulta o endpoint do serviço FoodOrder para verificar se o CPF está disponível no banco de dados.
   - Se o CPF estiver disponível, o serviço autentica a requisição.
   - Caso contrário, retorna uma resposta com status `403 Forbidden`.

