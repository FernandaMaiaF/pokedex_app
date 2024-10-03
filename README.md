# pokedex_app

Este é um aplicativo Flutter que funciona como uma Pokédex, permitindo que os usuários visualizem informações sobre as 3 gerações de Pokémons, incluindo a capacidade de favoritar seus Pokémon favoritos.

## Tecnologias Utilizadas

- Flutter
- Dart
- PokeAPI para dados de Pokémon

## Pacotes instalados

- mobx para gerenciamento de estado.
- flutter_mobx para atualizar de forma automática os os dados da interface.
- get_it para injeção de dependência
- http para realizar requisições HTTP
- mockito para simular comportamentos de objetos durante os testes unitários
- build_runner usado junto com o mobx_codegen para automatizar a criação de arquivo e código 
- mobx_codegen criação automática do código do mobx

## Funcionalidades

- Listagem de Pokémon com opção de busca pelo nome.
- Tela de detalhe do pokemon
- Funcionalidade de favoritar Pokémon.
- Armazenamento persistente de favoritos usando canais nativos.
- Navegação entre detalhes do pokemon usando `TabBar`.
- Testes unitários abrangentes.

## Estrutura do Projeto

O projeto segue a arquitetura Clean Architecture e está dividido nas seguintes camadas:

- **Presentation**: Contém os widgets de interface do usuário e as lógicas de apresentação.
- **Domain**: Contém as regras de negócios e as entidades do aplicativo.
- **Data**: Faz a comunicação com APIs e gerencia o armazenamento local.

## Configuração do Ambiente

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Passos para Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/FernandaMaiaF/pokedex_app.git
   cd pokedex_app