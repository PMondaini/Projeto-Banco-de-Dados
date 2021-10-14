create database LetsClix

--criando as tabelas
create table Plano_Usuario
(
	id int identity (1,1)
	,id_plano int
	,id_usuario int
	,dt_validade datetime
)

create table Publisher
(
	id int identity(1,1)
	,nome varchar (200)
	,cnpj varchar (14)
	,dt_ini_contrato datetime
	,dt_fim_contrato datetime
)

create table Papel_Elenco
(
	id int identity(1,1)
	,cd_papel varchar (50)
)

create table Elenco
(
	id int identity(1,1)
	,nome varchar (200)
	,id_papel int
	,link_foto varchar (300)
)

create table Genero
(
	id int identity(1,1)
	,nome varchar (50)
)

create table Classificacao
(
	id int identity(1,1)
	,idade_minima int
)

create table Video
(
	id int identity(1,1)
	,id_publisher int
	,id_classificacao int
	,id_genero int
	,nome varchar (200)
	,sinopse varchar (300)
	,dt_lancamento datetime
	,duracao_segundos int
)

create table Video_Elenco
(
	id int identity(1,1)
	,id_video int
	,id_elenco int
)

create table Historico_Usuario
(
	id int identity(1,1)
	,id_video int
	,id_usuario int
	,qtdSegundosAssistidos int
)

create table Regiao
(
	id int identity(1,1)
	,nome varchar (15)
)

create table Usuario
(
	id int identity(1,1)
	,cpf varchar (11)
	,endereco varchar (200)
	,cidade varchar (200)
	,estado varchar (2)
	,id_Regiao int
)

create table Plano_Assinatura
(
	id int identity(1,1)
	,codigo varchar (20)
	,id_regiao int
	,preco decimal
	,dt_ini_vigencia datetime
	,dt_fim_vigencia datetime
)

-- definindo as pks

alter table Plano_Usuario
add constraint PK_PLANO_USUARIO primary key (id)

alter table Publisher
add constraint PK_PUBLISHER primary key (id)

alter table Papel_Elenco
add constraint PK_PAPEL_ELENCO primary key (id)

alter table Elenco
add constraint PK_ELENCO primary key (id)

alter table Genero
add constraint PK_GENERO primary key (id)

alter table Classificacao
add constraint PK_CLASSIFICACAO primary key (id)

alter table Video
add constraint PK_VIDEO primary key (id)

alter table Video_Elenco
add constraint PK_VIDEO_ELENCO primary key (id)

alter table Historico_Usuario
add constraint PK_HISTORCO_USUARIO primary key (id)

alter table Regiao
add constraint PK_REGIAO primary key (id)

alter table Usuario
add constraint PK_USUARIO primary key (id)

alter table Plano_Assinatura
add constraint PK_PLANO_ASSINATURA primary key (id)

-- definindo as fks

alter table Elenco
add constraint FK_ELENCO_1 foreign key (id_papel) REFERENCES Papel_Elenco (id)

alter table Video
add constraint FK_VIDEO_1 foreign key (id_publisher) REFERENCES Publisher (id)

alter table Video
add constraint FK_VIDEO_2 foreign key (id_genero) REFERENCES Genero (id)

alter table Video
add constraint FK_VIDEO_3 foreign key (id_classificacao) REFERENCES Classificacao (id)

alter table Video_Elenco
add constraint FK_VIDEO_ELENCO_1 foreign key (id_elenco) REFERENCES Elenco (id)

alter table Video_Elenco
add constraint FK_VIDEO_ELENCO_2 foreign key (id_video) REFERENCES Video (id)

alter table Historico_Usuario
add constraint FK_HISTORICO_USUARIO_1 foreign key (id_video) REFERENCES Video (id)

alter table Historico_Usuario
add constraint FK_HISTORICO_USUARIO_2 foreign key (id_usuario) REFERENCES Usuario (id)

alter table Usuario
add constraint FK_USUARIO_1 foreign key (id_regiao) REFERENCES Regiao (id)

alter table Plano_Assinatura
add constraint FK_PLANO_ASSINATURA_1 foreign key (id_regiao) REFERENCES Regiao (id)

-- inserindo valores nas tabelas 



insert into Regiao
values 
	('Norte')
	,('Nordeste')
	,('Centro-Oeste')
	,('Sudeste')
	,('Sul')

	select * from Regiao

insert into Classificacao
values
	('0')
	,('10')
	,('12')
	,('16')
	,('18')
	
	select * from Classificacao

insert into Papel_Elenco
values
	('Diretor(a)')
	,('Ator/Atriz')

	select * from Papel_Elenco

insert into Plano_Assinatura
values 
	('Plano Norte', 1, 28.2, GETDATE(), '20270508')
	,('Plano Nordesde', 2, 20, GETDATE(), '20310212')
	,('Plano Centro-Oeste', 3, 33.8, GETDATE(), '20230305')
	,('Plano Sudeste', 4, 40, '20201129', '20251002')
	,('Plano Sul', 5, 50, '20190915', '20350730')

insert into Usuario
values
	(61401732216, 'Rua Jocelin de Souza Rocha, 755, Valentina de Figueiredo', 'Jo�o Pessoa', 'PB', 2)
	,(51828178195, 'Quadra QNN 30 �rea Especial E, Ceil�ndia Sul (Ceil�ndia)', 'Bras�lia', 'DF', 3)
	,(08246073923, 'Rua Ant�nio Lustosa de Siqueira, 268, Primavera', 'Guarapuava', 'PR', 5) 	
	,(67846714651, 'Rua Benedito Escalante, 717, Ponte Nova', 'V�rzea Grande', 'MT', 3) 
	,(15358198989, 'Travessa Santa L�cia, 628, Barro Duro', 'Macei�', 'AL', 2) 
	,(69166610117, 'Rua Santa Vit�ria, 631, Paju�ara', 'Natal', 'RN', 2) 
	,(74506173155, 'Rua Jos� Norgarolli, 684, Merc�s', 'Curitiba', 'PR', 5) 
	,(44314318708, 'Rua S�o Pedro, 926, Estiva', 'S�o Lu�s', 'MA', 2)
	,(19837453753, 'Rua Natalie Wood, 557, Jardim Campo Nobre', 'Campo Grande', 'MS', 3)
	,(76532120006, 'Rua Venezuela, 496, Embratel', 'Porto Velho', 'RO', 1) 
	,(11952771218, 'Rua 102A, 978, Setor Sul', 'Goi�nia', 'GO', 3)
	,(17676163412, 'Rua Cento e Onze, 716, Jardim Paulista', 'Paulista', 'PE', 2)
	,(80393856526, 'Quadra 22, Conjunto D, 357, Parano�', 'Bras�lia', 'DF', 3)
	,(31034177214, 'Rua Tocantins, 137, Centro Industrial', 'Jo�o Monlevade', 'MG', 4) 
	,(28382638112, 'Rua 30, 281, Loteamento Nova Aragua�na', 'Aragua�na', 'TO', 1)
	,(84844996851, 'Rua Arnoldo Ristow, 100, Zant�o', 'Brusque', 'SC', 5)
	,(70178749001, 'Avenida Adjalma Saldanha, 387, Jardim S�o Jo�o 1� Se��o', 'Ponta Por�', 'MS', 3) 
	,(75974701348, 'Avenida S�o Jo�o Ap�stolo, 835, Fonte Nova', 'Santana', 'AP', 1)
	,(06800214850, 'Rua Radialista Armindo Amaral, 413, C�u Azul', 'Belo Horizonte', 'MG', 4)
	,(16296643837, 'Travessa Presidente Castelo Branco, 890, Bom Pastor', 'Natal', 'RN', 2)
	,(76588249411, 'Rua virg�lio Marinho, 308, Compensa', 'Manaus', 'AM', 1)
	,(27010990565, 'Rua Ren� Barthesom, 460, Vila Formosa', 'Campinas', 'SP', 4)
	,(24056062919, 'Rua Manoel Firme, 133, S�o Jo�o Batista', 'Cariacica', 'ES', 4)
	,(38704352165, 'Rua Eunice de Freitas Silva, 506, Serraria', 'Macei�', 'AL', 2)
	,(21462266762, 'Rua S�o Vicente, 151, Vivendas do Turu', 'S�o Lu�s', 'MA', 2)
	,(77451691438, 'Quadra CLN 204 Bloco A, 329, Asa Norte', 'Bras�lia', 'DF', 3)
	,(81384539239, 'Rua Jos� Vieira de Melo, 705, Cruz das Armas', 'Jo�o Pessoa', 'PB', 2)
	,(28958024755, 'Rua Jo�o Pinheiro Cavalcante, 387, Ribeira', 'Palmeira dos �ndios', 'AL', 2)
	,(33552067337, 'Rua Onofre Ribeiro de Carvalho, 284, Prolongamento Jardim Mato Grosso', 'Rondon�polis', 'MT', 3)
	,(19387798356, 'Rua Tr�s, 914, Vila Amorim', 'Reden��o', 'PA', 1)
	,(73363637845, 'Rua Kulinas, 626, Chapada', 'Manaus', 'AM', 1)
	,(51917477988, 'Rua Caxias do Sul, 637, Infraero', 'Macap�', 'AP', 1)
	,(78920256187, 'Viela S�o Benedito do Rio Preto, 865, Parque Jandaia', 'Guarulhos', 'SP', 4)
	,(91794302360, 'Rua H�lio Rocha, 442, Clima Bom', 'Macei�', 'AL', 2)
	,(69397365304, 'Rua da Mal�ria, 489, Jo�o Paulo', 'S�o Lu�s', 'MA', 2)
	,(72975605374, 'Rua Laura Preira, 788, Santo Ant�nio', 'Mossor�', 'RN', 2)
	,(67480836996, 'Rua Jo�o Luiz Dias, 947, Parque Residencial Cidade Nova', 'Maring�', 'PR', 5)
	,(24067275803, 'Rua Trevizani, 662, Parque Independ�ncia III', 'Juiz de Fora', 'MG', 4)
	,(63653259754, 'Rua Cajamar, 945, Jardim Aero Rancho', 'Campo Grande', 'MS', 3)
	,(98564117690, 'Quadra 1112 Sul Avenida NS 10, 442, Plano Diretor Sul', 'Palmas', 'TO', 1)
	,(68423820920, 'Vila Jureminha, 975, Joaquim T�vora', 'Fortaleza', 'CE', 2)
	,(82250233667, 'Rua Reis, 953, Vila dos Nobres', 'S�o Lu�s', 'MA', 2)
	,(96492166698, 'Vila Doutor Marbel, 646, Ant�nio Bezerra', 'Fortaleza', 'CE', 2)
	,(25558406054, 'Rua 8 de Setembro, 311, LAgo Azul', 'Manaus', 'AM', 1)
	,(49547402153, 'Rua Chico Reis, 702, Rio Madeira', 'Porto Velho', 'RO', 1)
	,(91173040838, 'Avenida Jos� Fernandes Monteiro Filho, 826, Jardim das Palmeiras', 'Araraquara', 'SP', 4)
	,(76816621387, 'Rua Presidente Jo�o Pessoa, 427, Cetro', 'Cabedelo', 'PB', 2)
	,(84915534790, 'Quadra 58, 274, Brasilinha 17', 'Planaltina', 'GO', 3)
	,(81392163218, 'Rua Aristides Waltrick, 752, Copacabana', 'Lages', 'SC', 5)
	,(93238130870, 'Rua Israel Ferreira Ferro, 104, Jardim Caromb�', 'S�o Paulo', 'SP', 4)




