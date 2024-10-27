# Ferramenta CLI em Swift
Esta é uma ferramenta de linha de comando (CLI) desenvolvida em Swift para manipulação básica de texto em arquivos. Você pode contar palavras, buscar palavras específicas, substituir palavras e ordenar o conteúdo de arquivos de texto.

## Funcionalidades

- **Contar Palavras**: Conta o número total de palavras em um arquivo de texto.
- **Buscar Palavra**: Busca por uma palavra específica e conta quantas vezes ela aparece no arquivo.
- **Substituir Palavra**: Substitui todas as ocorrências de uma palavra por outra.
- **Ordenar Conteúdo**: Ordena o conteúdo de um arquivo de texto alfabeticamente.

## Como Usar

1. **Criar um Arquivo de Texto**:
   Crie um arquivo de texto (por exemplo, `teste.txt`) com o conteúdo que você deseja manipular.

2. **Executando a Ferramenta**:
   Abra o terminal e navegue até o diretório onde o código está localizado. Use os seguintes comandos para executar a ferramenta:

   - **Contar Palavras**:
     ```bash
     swift main.swift count teste.txt
     ```

   - **Buscar Palavra**:
     ```bash
     swift main.swift search teste.txt <palavra>
     ```

   - **Substituir Palavra**:
     ```bash
     swift main.swift replace teste.txt <palavra_antiga> <palavra_nova>
     ```

   - **Ordenar Conteúdo**:
     ```bash
     swift main.swift sort teste.txt
     ```
