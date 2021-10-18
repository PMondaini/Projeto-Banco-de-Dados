# Projeto Banco de Dados - LetsClix

## Sobre:
Vamos prover um banco para uma grande plataforma de streaming, grandiosa **LetsClix**.

### Tabelas:
1.	Plano_usuario
- id int identity(1,1)
- id_plano int
- id_usuario int
- dt_validade datetime

2.	Publisher
- id int identity(1,1)
- nome varchar (200)
- cnpj varchar (14)
- dt_ini_contrato datetime
- dt_fim_contrato datetime

3.	Papel_Elenco
- id int identity(1,1)
- cd_papel varchar (50)

4.	Elenco
- id int identity(1,1)
- nome varchar (200)
- id_papel int
- link_foto varchar (300)

5.	Genero
- id int identity(1,1)
- nome varchar (50)

6.	Classificacao
- id int identity(1,1)
- idade_minima int

7.	Video
- id int identity(1,1)
- id_publisher int
- id_classificacao int
- id_genero int
- nome varchar (200)
- sinopse varchar (300)
- dt_lancamento datetime
- duracao_segundos int

8.	Video_Elenco
- id int identity(1,1)
- id_video int
- id_elenco int

9.	Historico_Usuario
- id int identity(1,1)
- id_video int
- id_usuario int
- qtdSegundosAssistidos int

10.	Regiao
- id int identity(1,1)
- nome varchar (10)

11.	Usuario
- id int identity(1,1)
- cpf varchar (11)
- endereco varchar (200)
- cidade varchar (200)
- estado varchar (2)
- id_Regiao int

12.	PlanoAssinatura
- id int identity(1,1)
- codigo varchar (20)
- id_regiao int
- preco decimal (19,2)
- dt_ini_vigencia datetime
- dt_fim_vigencia datetime

<br>

### Tabela de relacionamentos:

| Tabela             | Coluna            | Tabela Referenciada | Coluna Referenciada |
| ------------------ | ----------------- | ------------------- | ------------------- |
| Elenco             | id\_papel         | Papel\_Elenco       | id                  |
| Historico\_Usuario | id\_video         | Video               | id                  |
| Historico\_Usuario | id\_usuario       | Usuario             | id                  |
| Plano\_usuario     | id\_plano         | PlanoAssinatura     | id                  |
| Plano\_usuario     | id\_usuario       | Usuario             | id                  |
| PlanoAssinatura    | id\_regiao        | Regiao              | id                  |
| Usuario            | id\_Regiao        | Regiao              | id                  |
| Video              | id\_publisher     | Publisher           | id                  |
| Video              | id\_genero        | Genero              | id                  |
| Video              | id\_classificacao | Classificacao       | id                  |
| Video\_Elenco      | id\_elenco        | Elenco              | id                  |
| Video\_Elenco      | id\_video         | Video               | id                  |

<br>

### Informações sobre as tabelas:

- Regiao - Regiao do usuario/plano, imagine que poderia ser para aplicar restrições, por enquanto temos Norte, Nordeste, Centro-Oeste, Sudeste, Sul

- Classificacao - Classificacao etária do video

- Genero - Genero do filme

- Publisher - Empresa responsável pelo video

- Elenco - Atores/Diretores dos filmes

- Papel_Elenco - Possíveis papéis da equipe dentro de um filme, por enquanto temos: Diretor, Ator/Atriz

- Video_Elenco - Associação entre filme e atores/diretores

- Historico_Usuario - Historico dos videos assistidos por cada usuario - o campo qtdSegundosAssistidos só é preenchido em caso de parada do video, se o usuario assistiu todo o video deixar esse campo nulo

- Video - Cada video disponível na nossa plataforma

- Usuario - Cadastro de usuario

- PlanoAssinatura - Os possíveis planos disponíveis na plataforma

- Plano_Usuario - Associação do plano x usuario

<br>

### Dados a serem populados:

- Plano_usuario - 50 registros
- Publisher - 10 registros
- Papel_Elenco - 2 registros
- Elenco - 50 registros
- Genero - 10 registros
- Classificacao - 5 registros
- Video - 100 registros
- Video_Elenco - 250 registros
- Historico_Usuario - 500 registros
- Regiao - 5 registros
- Usuario - 50 registros
- PlanoAssinatura - 5 registros

<br>

## Relatórios:
Foi solicitado para você, dev, gerar diversas consultas para análise da plataforma, você só deve fazer a parte do select, a parte de aplicação será outra equipe.

### Consultas necessárias:
1.	Listar todos os filmes com sua classificacao e idade minima
2.	Listar a quantidade de filmes para cada faixa etária
3.	Listar a quantidade de filmes que cada publisher possui
4.	Listar a quantidade de generos produzidos por cada publisher
5.	Listar os 10 diretores com mais filmes
6.	Listar os 10 atores/atrizes com mais filmes
7.	Listar os 10 filmes mais assistidos
8.	Listar os 3 gêneros mais assistidos
9.	Listar os 5 filmes com menor indice de retenção, que é quando começam a assistir e param (usar o os filmes com menor qtdAssistidos
10.	Listar os 5 filmes com maior indice de retenção, que é quando começam a assistir e terminam(usar o os filmes com o maior qtdSegundosAssistidos ou se ele for nulo, considerar a duracao do video)
11.	Listar os publishers ordenados por data de fim do contrato mais proximas (menores)
12.	Listar o total faturado por cada plano
