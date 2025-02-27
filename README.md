# Baralho de Cartas - Flutter App

## Descrição

Este aplicativo Flutter permite criar um baralho de cartas, embaralhá-lo e sacar cartas aleatórias. O app utiliza a **Deck of Cards API** para realizar operações de criação, embaralhamento e saque de cartas, oferecendo uma simulação interativa de um baralho de 52 cartas.

## Linguagem Usada

- **Flutter**: Framework para desenvolvimento de aplicativos móveis, criado pela Google, que utiliza a linguagem **Dart**.

## Tipo de Aplicação

- **Aplicativo Mobile**: O app foi desenvolvido para ser executado em dispositivos móveis (Android/iOS).
- **UI Interativa**: A interface permite interagir com o baralho, embaralhar as cartas e visualizar as cartas sacadas.

## API Utilizada

- **Deck of Cards API**: Uma API pública que permite criar baralhos de cartas, embaralhá-los e sacar cartas. A API oferece diversos recursos para manipulação de baralhos, incluindo:
  - **Criar um baralho**: Gera um novo baralho de 52 cartas.
  - **Embaralhar o baralho**: Embaralha as cartas do baralho.
  - **Sacar cartas**: Permite retirar um número específico de cartas do baralho e visualizá-las.

  **Documentação da API**: [Deck of Cards API](https://deckofcardsapi.com/)

## Funcionalidades do App

1. **Criar Baralho**:
   - Cria um novo baralho de 52 cartas padrão, com ou sem os Jokers.
   
2. **Embaralhar o Baralho**:
   - Após a criação do baralho, permite embaralhá-lo, colocando as cartas em uma ordem aleatória.
   
3. **Sacar Cartas**:
   - Permite ao usuário sacar uma quantidade específica de cartas (por exemplo, 5 cartas) do baralho embaralhado e exibir as informações de cada carta (valor e naipe).

4. **Interface Simples**:
   - O aplicativo tem uma interface simples com botões para realizar as ações de criar baralho, embaralhar e sacar cartas. As cartas sacadas são mostradas na tela para o usuário.

## Estrutura do Código

O código principal foi estruturado da seguinte maneira:

- **main.dart**: Contém a interface do usuário e a lógica para se comunicar com a Deck of Cards API. Ele define a estrutura do app, incluindo os botões de ação e as funcionalidades para criar, embaralhar e sacar cartas.
  
- **funções principais**:
  - `fetchFromAPI()`: Realiza a requisição HTTP para a API, recuperando os dados e manipulando-os.
  - `shuffleDeck()`: Embaralha o baralho ao fazer uma requisição de embaralhamento à API.
  - `drawCards()`: Saca um número específico de cartas e exibe as cartas retiradas.

## Dependências

O app usa as seguintes dependências:

- **flutter**: SDK Flutter para o desenvolvimento do app.
- **http**: Biblioteca para fazer requisições HTTP à Deck of Cards API.

Certifique-se de que as dependências estão instaladas corretamente utilizando o comando:

```bash
flutter pub get
```
vídeo:https://www.youtube.com/watch?v=psHDHL7aKak
