# pokedex_app

Este é um aplicativo feito em Flutter para um desafio de 1 semana. O app funciona como uma Pokédex, permitindo que os usuários visualizem informações sobre as 3 gerações de Pokémons.

<img width="392" alt="Screenshot 2024-10-21 at 15 11 15" src="https://github.com/user-attachments/assets/e186b5ab-a9ef-4b53-86da-761dc6adddd6">

Vídeo do app funcionando: https://youtu.be/mtjhUo9RQzY

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

- Listagem dos 1025 Pokémons com as respectivas imagens, tipos, cor do tipo principal e id
- Opção de Busca pelo nome
- Opção de filtro por pokemons favoritados
- Tela de detalhe do pokemon
- Funcionalidade de favoritar Pokémon.
- Armazenamento persistente de favoritos usando canais nativos.
- Navegação entre detalhes do pokemon usando `TabBar`.
- Testes unitários abrangentes.

## Estrutura do Projeto

O projeto segue a arquitetura Clean Architecture e está dividido nas seguintes camadas:

- **Presentation**: Contém os widgets de interface do usuário e as lógicas de apresentação. Foi dividido entre: controllers, models, views, widgets e utils.
- **Domain**: Contém as regras de negócios e as entidades do aplicativo. Contem os usecases.
- **Data**: Faz a comunicação com APIs e gerencia o armazenamento local. Foi dividido entre: models, repositories e sources.

## Configuração do Ambiente

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Android Studio/Visual Studio Code ou qualquer IDE compatível com Flutter
- Emulador ou dispositivo físico para testes (Android/iOS)

### Flutter doctor

[✓] Flutter (Channel stable, 3.22.2, on macOS 14.3 23D2057 darwin-arm64, locale en-BR)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 15.3)

### Passos para Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/FernandaMaiaF/pokedex_app.git
   cd pokedex_app

2. Para dispositivos andoid é possível testar com a [apk](https://drive.google.com/file/d/19mP8qDA7rHHGNuWdrl5bkgwZTZTGy65b/view?usp=drive_link)

## Funcionalidades

### Done Funcionalidades

[✓] Busca dos pokemons focando em deixar rápida a apresentação na tela

[✓] Inclusão na tela principal da
   - imagem
   - tipos, cor e id dos pokemons
     
[✓] Criação do filtro de busca dos pokemons

[✓] Criação da tela de detalhes, mostrar
   - nome, imagem, id, tipos

[✓] Criação da funcionalidade de favoritar o pokemon e armazenar essa infomação no canal nativo do dispositivo

[✓] Criação do filtro de pokemons favoritos na tela principal

[✓] Criação da aba Aboult do pokemon com:
   - peso e altura
   - informações gerais de danos do pokemon recebendo a informação pelos tipos que o pokemon possui.

[✓] Criação da aba Base Status com os dados gerais de hp, ataque....

[✓] Criação da aba de Evoluções considerar os casos abaixo:
   - Pokemon sem evoluções: ex: Ditto
   - Pokemon com um nível de evolução: ex: Ekans
   - Pokemon com dois níveis de evolução: ex: Charmander

### TODO Funcionalidades

- Ajuste e melhoria na recepção das evoluções para considerar evoluções como a do eevee que vai de um para vários dentro do mesmo nível de evolução e evoluções por itens como a do Abra.
- Revisão das regras de danos para calcular considerando o acumulo de danos pelos tipos que o pokemon possui. Multiplicar os danos seja duplo ou meio de acordo com os tipos do pokemon. (usar pokemon Volcanion para testar tipos opostos).
- Aba de moves.
- Armazenamento dos dados dos pokemons em canais nativos na primeira vez que abrir o app para não precisar ficar recarregando (Tendo em vista que os dados não mudam).
- Animação de evolução a partir de um botão na aba de evoluções.
- Modal de filtros na tela principal para possibilitar filtrar por geração e/ou tipo.
- Splash screen com uma pokebola ao abrir o app.
