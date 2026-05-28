# Projeto Calcular Salario

##  Descrição
Sistema em COBOL para cálculo de salário com bônus baseado no tempo de empresa.

---
* **Ambiente e Emulação:** Código desenvolvido em COBOL e exportado/executado através do emulador de terminal tn3270 (TN) com o TK5.

### Lógica que usei para construir

```text

  ├── Exibir Menu (1 - Calcular, 2 - Sair)
  ├── Ler Opção
  │
  ├──► [ OPÇÃO 1 ]
  │      │
  │      ├── Ler: Nome, Salário, Tempo de Empresa
  │      │
  │      ├──► Validação:
  │      │      ├── Salário <= 0 ➔ [ ERRO ]
  │      │      └── Tempo < 0 ➔ [ ERRO ]
  │      │
  │      ├──► Cálculo (Se válido):
  │      │      ├── Tempo <= 1 ➔ Bônus = 5%
  │      │      ├── 2 a 5 anos ➔ Bônus = 10%
  │      │      ├── > 5 anos ➔ Bônus = 15%
  │      │      └── Salário Final = Salário + (Salário × Bônus)
  │      │
  │      └──► Saída:
  │             └── Exibir Resultados ➔ Pausar ➔ Retornar ao Menu
  │
  ├──► [ OPÇÃO 2 ]
  │      │
  │      └── Encerrar Programa
  │
  └──► [ OPÇÃO INVÁLIDA ]
         │
         └── Exibir "Opção Inválida"
               ➔ Pausar
               ➔ Retornar ao Menu
```
### JCL

<img width="955" height="564" alt="image" src="https://github.com/user-attachments/assets/764280bc-5c75-45ad-9462-620f22625ef3" />


### Em Funcionamento no TK5

<img width="1000" height="563" alt="2026-05-27 23-22-09 - Trim (2)" src="https://github.com/user-attachments/assets/64618012-f1f5-4aa3-a58b-58a2ac08a68f" />

##  Formato de Input no Terminal

No COBOL legado, as variáveis numéricas exigem o preenchimento exato da memória alocada . Por isso, ao digitar valores numéricos, é necessário preencher com **zeros à esquerda**.

**Exemplo de digitação:**
Para calcular um salário de `5000,00` para `3` anos de empresa, responda ao menu exatamente desta forma:

```text
Digite uma Opcao: 1
Digite o Nome do Funcionario: Caio
Digite o Salario Base: 000500000
Digite o tempo do funcionario na empresa: 03
```
