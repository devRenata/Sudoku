![GitHub repo size](https://img.shields.io/github/repo-size/devrenata/sudoku?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/devrenata/sudoku?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/devrenata/sudoku?style=for-the-badge)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/devrenata/sudoku?style=for-the-badge)

# Sudoku App

Um aplicativo em Flutter que gera e resolve tabuleiros de Sudoku, permitindo partidas dinâmicas e personalizadas. Desenvolvido com foco em lógica, organização e boas práticas de código, utilizando princípios de **Arquitetura Limpa** para garantir **escalabilidade, testabilidade e fácil manutenção.**

## Screenshots

Screenshots das telas serão adicionados em breve.

## 🧩 Funcionalidades

- [x] Cria tabuleiros de acordo com o nível de dificuldade (fácil, médio, difícil);
- [ ] Valida automaticamente as jogadas do usuário;
- [ ] Opção de rascunho em cada célula, permitindo anotar possíveis números;
- [ ] Oferece dicas a mais para auxiliar o jogador;
- [ ] Permite reiniciar o jogo ou gerar um novo tabuleiro;
- [ ] Exibe o tempo de jogo e estatísticas de desempenho;
- [ ] Salva o progresso da partida para continuar depois;
- [ ] Interface responsiva e intuitiva;

## 🔥 Desafios durante a implementação
Esta seção destacará as principais dificuldades técnicas encontradas durante o desenvolvimento (em breve).

## 🏗️ Arquitetura

O projeto segue princípios de **Clean Architecture** e **Domain-Driven Design (DDD)**, separando claramente as regras de negócio (domínio) das implementações técnicas (infraestrutura).
Essa abordagem facilita testes, manutenção e evolução do código sem comprometer a lógica central do jogo.

### Visão geral

### Estrutura de pastas

## 📦 CI/CD e Automação

O projeto utiliza **integração e entrega contínuas (CI/CD)** para garantir qualidade e agilidade no desenvolvimento.
A automação executa testes e build de versões a cada alteração no código, evitando falhas manuais e assegurando estabilidade nas releases.
Esse fluxo é configurado com **GitHub Actions**, permitindo que o processo de build e publicação seja reproduzível, rápido e confiável.

## ⚙️ Detalhes técnicos

- Desenvolvido em Flutter e Dart;
- Utiliza Clean Architecture e DDD (Domain-Driven Design);
- Aplica princípios de TDD (Test-Driven Development);
- Grenciamento de estado com Bloc/Cubit;
- Implementa tratamento de erros e validações robustas;
- Código modular e organizado por camadas (Domain, Infra e Presentation);
- Testes unitários e de integração para garantir estabilidade;
- CI/CD e automação de build com GitHub Actions, garantindo execução automática de testes e builds confiáveis;

## 🚀 Como executar

1. **Clone o repositório**
```bash
git clone https://github.com/devRenata/Sudoku.git
cd Sudoku
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o aplicativo**
```bash
flutter run
```




