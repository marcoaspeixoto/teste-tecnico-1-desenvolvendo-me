<h1 align="center">:page_with_curl: Teste Técnico 1 DesenvolvendoMe</h1>

<br>

<div align="center">

![GitHub issues](https://img.shields.io/github/issues-raw/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed-raw/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub milestones](https://img.shields.io/github/milestones/all/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me?style=for-the-badge)

</div>

<br>

## :pencil: Descrição do Projeto

Teste técnico 1 da mentoria DesenvolvendoMe contendo 9 questões sendo 3 delas envolvendo construção de código e o restante com respostas dissertativas e análise de códigos

## :computer: Tecnologias Utilizadas

Este projeto foi desenvolvido com as seguintes tecnologias:

* Ruby 3.1.2
* Rails 6.1.6.1
* SQLite3

## Questões:

1 - Faça uma função que receba uma string e retorne verdadeiro caso ela seja palíndromo, do contrário ela deve retornar falso. (palíndromos são palavras ou frases que podem ser lidas da esquerda para a direita ou da direita para a esquerda.)

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/2)

<br>

2 - Faça uma função que receba uma string contendo um CPF e verifique se ele está formatado de acordo com a máscara 999.999.999-99. A função deve usar regex para fazer a validação da máscara e deve retornar verdadeiro ou falso. cpf = “461.636.517-23”

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/3)

<br>

3 - O fatorial de um número n!, é definido como o produto de todos os números inteiros de 1 a n. Por exemplo: 5! é 5 * 4 * 3 * 2 * 1 = 120

A maioria das implementações de cálculo de fatoriais usam uma função recursiva para determinar o valor fatorial(n). No entanto, a maioria dos sistemas não consegue lidar com pilhas de recursividade maiores que 2000.

Implemente uma função para calcular o fatorial de números arbitrariamente grandes, sem
utilizar recursividade.

Regras
* n < 0 deve retornar nil
* n = 0 deve retornar 1
* n > 0 deve retornar n!

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/3)

<br>

4 - A partir das tabelas do banco de dados abaixo, escreva uma query sql que através de join, retorne o nome completo, cpf, equipe e cargo dos colaboradores ordenando os por cpf.

Tabela: employees

| id | first_name | last_name | cpf | team_id | job_title_id |
|---|---|---|---|---|--------------|
| 1 | Pedro | Alves | 665.415.876.80 | 2 | 3            |
| 2 | Tiago | Nogueira | 032.336.130-75 | 1 | 1            |
| 3 | João | Neves | 461.636.517.23 | 1 | 2            |


Tabela: teams

| id | name |
|---|---|
| 1 | TI |
| 2 | Suporte |
| 3 | Financeiro |

Tabela: job_titles

| id | name |
|---|---|
| 1 | Desenvolvedor back-endimpr |
| 2 | Desenvolvedor front-end |
| 3 | Encantador de clientes |

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/10)

<br>

5 - Usando as tabelas do banco de dados do exercício anterior, escreva as classes das
models Employee, Team e JobTitle, declare as associações das models e escreva a mesma
query com a sintaxe do ActiveRecord.

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/11)

<br>

6 - Descreva o que faz o seguinte comando e por que ele é amplamente utilizado: `a ||= b`

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/12)

<br>

7 - Qual a principal diferença entre estes dois métodos?

```java
// Java
public boolean isEmpty(String s) {
     return s.length() == 0;
}
``` 

```ruby
# Ruby
def empty?(s)
  return s.size == 0
end
``` 
[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/13)

<br>

8 - Qual o significado do **_self_** nas classes ruby?

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/14)

<br>

9 - Quais as vantagens e desvantagens do ruby ser uma linguagem dinamicamente tipada?

[Solução](https://github.com/marcoaspeixoto/teste-tecnico-1-desenvolvendo-me/issues/15)

<br>

## :heavy_check_mark: Conclusão

* **Student / Developer:** Marco Peixoto (https://github.com/marcoaspeixoto)
* **Mentor / Leader:** Marco Castro (https://github.com/marcodotcastro)
