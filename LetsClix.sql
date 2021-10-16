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
 
 --alterando o campo preco para receber valores decimais
ALTER TABLE Plano_Assinatura
ALTER COLUMN preco decimal (4,2)


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
	,('Plano Sul', 5, 50.47, '20190915', '20350730')
	
	select * from Plano_Assinatura

	--limpando a tabela Plano_Assinatura pra poder inserir os valores com os decimais
	truncate table Plano_Assinatura
	-- depois disso � s� dar o insert de novo

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

insert into Publisher
values
	('Warner Bros Global Publishing', 15835588000170, '20180810', '20250810')
	,('Walt Disney Studios', 11575933000123, '20190105', '20220105')
	,('Universal Pictures', 17920690001680, '20190613', '20230613')
	,('Paramount Pictures', 88749680001590, '20200707', '20300707')
	,('Sony Pictures', 95791958000154, '20150103', '20220103')
	,('Lionsgate Films', 40664105000160, '20160404', '20270404')
	,('Metro-Goldwyn-Mayer Pictures', 82282489000104, '20200414', '20250414')
	,('Constantin Film', 66265544000193, '20180822', '20290822')
	,('DreamWorks Pictures', 75340550000159, '20171010', '20231010')
	,('20th Century Studios', 75340550000159, '20181103', '20281103')

	select * from Publisher

insert into Genero
values
	('A��o')
	,('Romance')
	,('Drama')
	,('Fic��o Cientifica')
	,('Fantasia')
	,('Terror')
	,('Horror')
	,('Aventura')
	,('Policial')
	,('Com�dia')

	select * from Genero

insert into Video
values
(8, 4, 3, 'Touro Indom�vel', 'O pugilista peso-m�dio Jake LaMotta, chamado de �o touro do Bronx�, sobe na carreira com a mesma rapidez com que sua vida particular se degrada, gra�as ao seu temperamento violento e possessivo.', 19801114, 7680)
,(2, 1, 10, 'Mary Poppins', 'Na Londres de 1910, um banqueiro r�gido e severo com os filhos escreve um an�ncio no jornal em busca de uma governanta.', 19641109, 8040)
,(7, 3, 7, 'Intriga Internacional', 'O publicit�rio Roger Tornhill � confundido com um agente secreto e acaba se envolvendo em uma perigosa trama de espionagem. Ap�s ser acusado de assassinato, ele precisa lutar.', 19590728, 8160)
,(8, 1, 2, 'Amor, Sublime Amor', 'No lado oeste de Nova York, � sombra dos arranha-c�us, ficam os guetos de imigrantes e classes menos favorecidas. Duas gangues, os Sharks, de porto-riquenhos, e os Jets.', 19611225, 9120)
,(7, 4, 8, 'Thelma & Louise', 'No Arkansas, gar�onete quarentona e jovem dona de casa entediadas resolvem fazer pequena viagem para fugir da rotina.', 19910524, 7800)
,(4, 2, 2, 'Crep�sculo dos Deuses', 'Uma estrela veterana do cinema mudo se recusa a aceitar que seu reinado acabou. Ent�o ela contrata um jovem roteirista para ajud�-la a reconquistar o sucesso.', 19500810, 6600)
,(1, 3, 1, 'Batman: O Cavaleiro das Trevas', 'Com a ajuda de Jim Gordon e Harvey Dent, Batman tem mantido a ordem na cidade de Gotham. Mas um jovem e an�rquico criminoso conhecido como Coringa ganha for�a.', 20080718, 9000)
,(3, 1, 4, 'Jurassic Park: O Parque dos Dinossauros', 'Em uma ilha remota, um rico empres�rio monta um parque tem�tico com dinossauros vivos, criados a partir de DNA pr�-hist�rico. Antes de abri-lo ao p�blico, ele convida um conceituado.', 19930613, 7620)
,(4, 3, 7, 'Janela Indiscreta', 'Em Greenwich Village, Nova York, L.B. Jeffries (James Stewart), um fot�grafo profissional, est� confinado em seu apartamento por ter quebrado a perna enquanto trabalhava.', 19540804, 6720)
,(8, 1, 2, 'Quanto Mais Quente Melhor', 'Ap�s testemunhar um assassinato da m�fia, o saxofonista Joe e seu velho amigo Jerry improvisam um plano r�pido para escaparem vivos de Chicago. Disfar�ando-se como mulheres.', 19590504, 7320)
,(10, 3, 2, 'Titanic', 'Um artista pobre e uma jovem rica se conhecem e se apaixonam na fat�dica jornada do Titanic, em 1912. Embora esteja noiva do arrogante herdeiro de uma sider�rgica.', 19980116, 11640)
,(2, 1, 10, 'Toy Story', 'O anivers�rio de Andy est� chegando e os brinquedos est�o nervosos. Afinal de contas, eles temem que um novo brinquedo possa substitu�-los. Liderados por Woody.', 19951222, 4860)
,(4, 1, 10, 'Curtindo a Vida Adoidado', 'No �ltimo semestre do curso do col�gio, Ferris Bueller sente um incontrol�vel desejo de matar a aula e planeja um grande programa na cidade com sua namorada, seu melhor amigo e uma Ferrari.', 19861219, 6180)
,(6, 4, 6, 'O Ataque dos Tomates Assassinos', 'O filme inicia com o ataque a uma dona de casa, realizado por um tomate. A policia fica intrigada ao descobrir que, o que parecia sangue �, na verdade, suco de tomate. Com a quantidade de ataques aumentando.', 19870110, 5220)
,(9, 3, 10, 'Um Estranho no Ninho', 'Randle Patrick McMurphy, um prisioneiro, simula estar insano para n�o trabalhar e vai para uma institui��o para doentes mentais. L� estimula os internos a se revoltarem contra as r�gidas normas.', 19760528, 7740)
,(4, 4, 9, 'Chinatown', 'O detetive particular Jake Gittes � contratado por uma rica�a para investigar o marido, no que parece ser mais um caso de infidelidade conjugal. Gittes logo descobre que a mulher era uma impostora.', 19740620, 7800)
,(7, 3, 10, 'Noivo Neur�tico, Noiva Nervosa', 'Alvy Singer, um humorista judeu e divorciado que faz an�lise h� quinze anos, acaba se apaixonando por Annie Hall, uma cantora em in�cio de carreira com uma cabe�a um pouco complicada.', 19770420, 5580)
,(8, 4, 3, 'Apocalypse Now', 'O Capit�o Willard recebe a miss�o de encontrar e matar o comandante das For�as Especiais, Coronel Kurtz (Marlon Brando), que aparentemente enlouqueceu e se refugiou nas selvas do Camboja.',  19790510, 9180)
,(4, 1, 8, 'Indiana Jones e os Ca�adores da Arca Perdida', 'Em 1936, o arque�logo Indiana Jones (Harrison Ford) � contratado para encontrar a Arca da Alian�a, que segundo as escrituras b�blicas conteria �Os Dez Mandamentos�.', 19811225, 6900)
,(4, 3, 8, 'Indiana Jones e o Reino da Caveira de Cristal', 'Durante a Guerra Fria, Indiana Jones e o jovem Mutt buscam a Caveira de Cristal, um objeto m�stico de grande valor, mas logo percebem que n�o est�o sozinhos.', 20080521, 7320)
,(4, 1, 1, 'Indiana Jones e a �ltima Cruzada', 'O arque�logo Indiana Jones embarca em uma miss�o perigosa e cheia de aventuras para salvar seu pai, o professor Henry Jones, que foi sequestrado por nazistas e para tentar encontrar o lend�rio.', 19890524, 7620)
,(3, 1, 10, 'De Volta Para o Futuro', 'Marty McFly � um adolescente americano dos anos 80. Acidentalmente ele viaja de volta no tempo para 1955 em uma m�quina do tempo inventada por seu amigo, o cientista maluco Dr. Brown.', 19851225, 6900)
,(3, 1, 10, 'De Volta para o Futuro 2', 'Marty McFly e o cientista "Doc" Brown viajam de 1985 a 2015 para evitar que o filho de Marty estrague o futuro da fam�lia McFly. Por�m, seu arqui-inimigo Biff Tannen rouba a m�quina do tempo de Doc.', 19891122, 6480)
,(3, 1, 10, 'De Volta para o Futuro 3', 'Marty recebe uma mensagem do Dr. Emmett Brown, na qual ele informa que agora vive em uma pequena cidade do Velho Oeste, em 1885. Quando Marty descobre que Doc acabar� sendo assassinado.', 19900525, 7080)
,(3, 4, 1, 'A Lista de Schindler', 'A inusitada hist�ria de Oskar Schindler, um sujeito oportunista, sedutor, �armador�, simp�tico, comerciante no mercado negro, mas, acima de tudo, um homem que se relacionava muito bem.', 19931130, 11700)
,(5, 3, 1, 'Cidad�o Kane', 'Cidad�o Kane � supostamente baseado na vida do magnata do jornalismo William Randolph Hearst e conta a hist�ria de Charles Foster Kane, um menino pobre que acaba se tornando um dos homens mais ricos.', 19410705, 7140)
,(7, 1, 5, 'O M�gico de Oz', 'Dorothy Gale  � uma menina �rf� que vive na fazenda dos tios no Kansas. De esp�rito aventureiro, ela v� seus sonhos se realizarem quando um tornado a leva para �al�m do arco-�ris� ao lado do c�o.', 19390815, 6720)
,(1, 4, 3, 'Um Sonho de Liberdade', 'Andy Dufresne � condenado a duas pris�es perp�tuas consecutivas pelas mortes de sua esposa e de seu amante. Por�m, s� Andy sabe que ele n�o cometeu os crimes. No pres�dio, durante dezenove anos.', 19950125, 8400)
,(1, 2, 2, 'Casablanca', 'Durante a Segunda Guerra, um exilado norte-americano encontra ref�gio na cidade de Casablanca e passa a administrar uma casa noturna. Ele reencontra uma antiga paix�o, que agora est� casada.', 19421126, 6060)
,(3, 2, 4, 'E.T. - O Extraterrestre', 'Um garoto faz amizade com um ser de outro planeta, que ficou sozinho na Terra, protegendo-o de todas as formas para evitar que ele seja capturado e transformado em cobaia.', 19820611, 9660)
,(7, 3, 4, '2001: Uma Odiss�ia no Espa�o', 'Depois de descobrir um artefato misterioso enterrado sob a superf�cie lunar, a humanidade parte em uma busca para encontrar suas origens com a ajuda do supercomputador inteligente H.A.L. 9000.', 19680529, 6900)
,(2, 3, 4, 'Star Wars: Os �ltimos Jedi', 'A tranquila e solit�ria vida de Luke Skywalker sofre uma reviravolta quando ele conhece Rey, uma jovem que mostra fortes sinais da For�a. O desejo dela de aprender o estilo dos Jedi for�a Luke.', 20171209, 9120)
,(2, 3, 4, 'Star Wars: Epis�dio IX� A Ascens�o Skywalker', 'A parte da Resist�ncia que sobreviveu enfrenta a Primeira Ordem mais uma vez. A batalha final marcar� o fim de uma saga de grandes embates da fam�lia Skywalker. Novas lendas nascer�o.', 20191219, 8520)
,(2, 3, 4, 'Star Wars: O Despertar da For�a', 'A queda de Darth Vader e do Imp�rio levou ao surgimento de uma nova for�a sombria: a Primeira Ordem. Eles procuram o jedi Luke Skywalker, desaparecido.', 20151214, 8100)
,(2, 1, 4, 'Star Wars: Epis�dio 2 � Ataque dos Clones', 'Tentado por promessas de poder, Anakin Skywalker se aproxima de Darth Sidious e participa de um plano para acabar com os Cavaleiros Jedi.', 20020516, 8520)
,(10, 1, 4, 'Star Wars: Epis�dio III � A Vingan�a dos Sith', 'As Guerras Cl�nicas est�o em pleno andamento e Anakin Skywalker mant�m um elo de lealdade com Palpatine, ao mesmo tempo em que luta para que seu casamento com Padm� Amidala n�o seja afetado.', 20050519, 8400)
,(10, 1, 4, 'Star Wars: Epis�dio I � A Amea�a Fantasma ', 'Obi-Wan e seu mentor embarcam em uma perigosa aventura na tentativa de salvar o planeta das garras de Darth Sidious. Durante a viagem, eles conhecem um habilidoso menino e decidem trein�-lo.', 19990519, 8160)
,(10, 1, 4, 'Star Wars Epis�dio VI: O Retorno de Jedi', 'Luke Skywalker e seus amigos viajam para Tatooine e salvam seu amigo Han Solo do lorde do crime Jabba o Hutt. O Imp�rio Gal�tico come�ou a constru��o de uma segunda Estrela da Morte.', 19830525, 8040)
,(10, 3, 4, 'Guerra nas Estrelas: O Imp�rio Contra-Ataca', 'Yoda treina Luke Skywalker para ser um cavaleiro Jedi. Han Solo corteja a Princesa Leia enquanto Darth Vader retorna para combater as for�as rebeldes que tentam salvar a gal�xia.', 19800521, 7440)
,(10, 3, 4, 'Star Wars: Uma Nova Esperan�a', 'A princesa Leia � mantida ref�m pelas for�as imperiais comandadas por Darth Vader. Luke Skywalker e o capit�o Han Solo precisam libert�-la e restaurar a liberdade e a justi�a na gal�xia.', 19771118, 7260)
,(5, 3, 5, 'Avatar','No exuberante mundo alien�gena de Pandora vivem os Navi, seres que parecem ser primitivos, mas s�o altamente evolu�dos. Como o planeta � t�xico, foram criados os avatares, corpos biol�gicos controlados pela mente humana.',20191218,10920)  
,(3, 4, 2, 'O Segredo de Brokeback Mountain','Jack e Ennis se conheceram em Wyoming, no ver�o de 1963, quando foram trabalhar para um rancheiro que criava ovelhas. Naquele ambiente solit�rio nas montanhas, eles acabam tendo um r�pido contato sexual.',20051207,8040)
,(5, 1, 10, 'Os Ca�a-Fantasmas 2','Quando o ca�ador de fantasmas Peter Venkman fica sabendo que seu filho est� na mira de esp�ritos, os Ca�a-Fantasmas se prepararam para mais uma miss�o.',19890616,6120)
,(5, 2, 10, 'Os Ca�a-Fantasmas','Uma equipe de cientistas, Dr. Egon, Dr. Ray e Dr. Peter, perde o emprego em uma universidade de Nova York. Eles decidem, ent�o, se tornar ca�adores de fantasmas e travar uma batalha de alta tecnologia com o sobrenatural por dinheiro.',19841220,6300)
,(6, 3, 1, 'Duro de Matar','John McClane � um detetive de Nova York que est� indo a Los Angeles para se encontrar com sua esposa, que trabalha em uma empresa japonesa.',19881202,7560)
,(2, 1, 5, 'A Bela e a Fera','A jovem Bela est� cansada da vida provinciana de uma pequena cidade francesa, onde vive tamb�m o gal� Gast�n que, apesar de derreter cora��es, n�o consegue conquist�-la com seu jeito grosseiro.',19911213,5340)
,(6, 5, 1, 'Rocky, um Lutador','Rocky Balboa, um lutador de boxe med�ocre que trabalha como �cobrador� de um agiota, tem a chance de enfrentar Apollo Creed, o campe�o mundial dos pesos-pesados.',19770107,7140)
,(2, 1, 2, 'Up - Altas Aventuras','Carl Fredricksen � um vendedor de bal�es que, aos 78 anos, est� prestes a perder a casa em que sempre viveu com sua esposa, a falecida Ellie.',20090525,5760)
,(3, 5, 3, 'O Franco-Atirador ','Tr�s amigos recrutados para a guerra do Vietn� s�o capturados pelos vietcongues. Al�m de mal-tratados fisicamente, � a tortura psicol�gica um jogo de roleta russa entre eles que os far� repensar o motivo de tudo aquilo.',19781208,10920)
,(1, 4, 3, 'O Labirinto do Fauno','Espanha, 1944. Oficialmente a Guerra Civil j� terminou, mas um grupo de rebeldes ainda luta nas montanhas ao norte de Navarra.',20060527,7080)
,(1, 5, 1, 'Bonnie e Clyde - Uma Rajada de Balas','Durante a era da Grande Depress�o, Bonnie (Faye Dunaway) e Clyde (Warren Beatty) s�o dois jovens que se conhecem de forma inusitada.',19670911,6660)
,(1, 3, 4, 'Matrix Revolutions','Ap�s enfrentar os sentinelas no mundo real, Neo, a maior esperan�a da humanidade, est� preso entre a Matrix e a realidade.',20030905,7740)
,(1, 3, 4, 'Matrix Reloaded','Ap�s derrotar as m�quinas em seu combate inicial, Neo ainda vive na Nabucodonosor ao lado de Morpheus, Trinity e Link, o novo tripulante da nave. As m�quinas est�o realizando uma grande ofensiva contra Zion.',20030516,8280)
,(1, 3, 4, 'Matrix','Um hacker fica sabendo de uma incr�vel conspira��o que envolve a realidade de todos os humanos e se junta a uma rebeli�o em busca da liberdade.',19990331,8160)
,(4, 1, 10, 'Apertem os Cintos� O Piloto SumiuApertem os Cintos� O Piloto Sumiu','O piloto Ted Striker (Robert Hays), ex-combatente de guerra, � for�ado a assumir os controles de um avi�o quando a tripula��o sucumbe � comida contaminada.',19801226,5220)
,(8, 4, 9, 'Seven - Os Sete Crimes Capitais','Dois policiais, om jovem e impetuoso David Mills (Brad Pitt) e o outro maduro e prestes a se aposentar, William Somerset (Morgan Freeman), s�o encarregados de uma periogosa investiga��o.',19951215,7560)
,(2, 1, 5, 'O Rei Le�o','Este desenho animado da Disney mostra as aventuras de um le�o jovem de nome Simba, o herdeiro de seu pai, Mufasa. O tio malvado de Simba, Oscar, planeja roubar o trono de Mufasa atraindo pai e filho para uma emboscada.',19940708,5400)
,(3, 2, 10, 'Brilho Eterno de uma Mente sem Lembran�as','Joel e Clementine formavam um casal que durante anos tentaram fazer com que o relacionamento desse certo. Desiludida com o fracasso, Clementine decide esquecer Joel para sempre.',20040723,6480)
,(9, 2, 3, 'O Resgate do Soldado Ryan','Ao desembarcar na Normandia, no dia 6 de junho de 1944, capit�o Miller (Tom Hanks) recebe a miss�o de comandar um grupo do batalh�o para o resgate do soldado James Ryan, ca�ula de quatro irm�os, dentre os quais tr�s morreram em combate.',19980911,9780)
,(4, 4, 2, 'Forrest Gump: O Contador de Hist�rias','Quarenta anos da hist�ria dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da m�dia e boas inten��es. Por obra do acaso, ele consegue participar de momentos cruciais.',19940706,8520)
,(6, 4, 3, 'Cora��o Valente','No s�culo XIII, soldados ingleses matam a mulher do escoc�s William Wallace, bem na sua noite de n�pcias. Para vingar a amada, ele resolve liderar seu povo em uma luta contra o cruel Rei ingl�s Edward  (Patrick McGoohan).',19940714,9900)
,(5, 4, 6, 'Psicose','Marion Crane � uma secret�ria que rouba 40 mil d�lares da imobili�ria onde trabalha para se casar e come�ar uma nova vida. Durante a fuga � carro, ela enfrenta uma forte tempestade, erra o caminho e chega em um velho hotel.',19600825,6600)
,(7, 3, 10, 'Cantando na Chuva','Don Lockwood e Lina Lamont s�o dois dos astros mais famosos da �poca do cinema mudo em Hollywood. Seus filmes s�o um verdadeiro sucesso de p�blico e as revistas inclusive apostam num relacionamento mais �ntimo entre os dois.',19520630,6120)
,(1, 4, 2, '....E o Vento Levou','Scarlett O�Hara � uma jovem mimada que consegue tudo o que quer. No entanto, algo falta em sua vida: o amor de Ashley Wilkes, um nobre sulista que deve se casar com a sua prima Melanie.',19400101,14280)
,(3, 3, 9, 'O Sol � Para Todos','Jean Louise Finch recorda que em 1932, quando tinha seis anos, Macomb, no Alabama, j� era um lugarejo velho. Nesta �poca Tom Robinson, um jovem negro, foi acusado de estuprar Mayella Violet Ewell, uma jovem branca. Seu pai.',19630211,7740)
,(8, 1, 2, 'A Novi�a Rebelde','No final da d�cada de 1930, na �ustria, quando o pesadelo nazista estava prestes a se instaurar no pa�s, uma novi�a (Julie Andrews) que vive em um convento mas n�o consegue seguir as r�gidas normas de conduta das religiosas.',19650302,10500)
,(6, 2, 8, 'A Princesa Prometida','Um av� l� um conto de fadas ao seu neto, com direito a uma linda princesa, lutas de esgrima e gigantes. A hist�ria do livro se baseia na vida da princesa Buttercup (Robin Wright), que � apaixonada por um jovem campon�s.',19880129,5880)
,(5, 5, 3, 'Clube da Luta','Jack (Edward Norton) � um executivo jovem, trabalha como investigador de seguros, mora confortavelmente, mas ele est� ficando cada vez mais insatisfeito com sua vida med�ocre. Para piorar ele est� enfrentando uma terr�vel crise de ins�nia.',19991015,9060)
,(8, 5, 7, 'Alien, o Oitavo Passageiro','Nave espacial, ao retornar para a Terra, recebe estranhos sinais vindos de um asteroide. Ao investigarem o local, um dos tripulantes � atacado por um estranho ser. O que parecia ser um ataque isolado se transforma em um terror constante.',19790820,7020)
,(6, 1, 3, 'A Malvada','A astuta Eve Harrington deseja tomar o lugar da grande atriz Margo Channing na Broadway, e nada vai impedi-la. Ela deixa o clima tenso e interfere na vida do namorado de Margo, escritor de suas pe�as, e da esposa dele.',19501013,8280)
,(8,4,8,'Senhor dos An�is: O Retorno do Rei','O confronto final entre as for�as do bem e do mal que lutam pelo controle do futuro da Terra M�dia se aproxima.Sauron planeja um grande ataque a Minas Tirith,capital de Gondor,o que faz com que Gandalf e Pippin partam para o local na inten��o de ajudar a resist�ncia.Um ex�rcito � reunido por Theoden em Rohan',20031205,10860)
,(8,3,1,'Senhor dos An�is:A Sociedade do Anel','Em uma terra fant�stica e �nica, um hobbit recebe de presente de seu tio um anel m�gico e maligno que precisa ser destru�do antes que caia nas m�os do mal.',20011219,10680)
,(8,3,5,'Senhor dos An�is:As Duas Torres','Ap�s a captura de Merry e Pippy pelos orcs, a Sociedade do Anel � dissolvida. Enquanto que Frodo e Sam seguem sua jornada rumo � Montanha da Perdi��o para destruir o Um Anel, Aragorn,Legolas  e Gimli partem para resgatar os hobbits sequestrados.',20021218,10740)
,(4,4,3,'O Poderoso Chef�o','Uma fam�lia mafiosa luta para estabelecer sua supremacia nos Estados Unidos depois da Segunda Guerra Mundial.',19720315,10500)
,(4,4,3,'O Poderoso Chef�o: Parte II','In�cio do s�culo XX. Ap�s a m�fia local matar sua fam�lia, o jovem Vito foge da sua cidade na Sic�lia e vai para a Am�rica. J� adulto em Little Italy,luta para ganhar a vida (legal ou ilegalmente) e manter sua esposa e filhos.',19741220,12120)
,(4,4,3,'O Poderoso Chef�o: Parte III','Don Michel Corleone est� envelhecendo e, com a ajuda do sobrinho Vicente Mancini, busca a legitima��o dos interesses da fam�lia, em Nova York e na It�lia, antes de sua morte. Mas seu protegido n�o est� s� interessado em parte do imp�rio da fam�lia.',19901220,9720)
,(4,4,3,'Pulp Fiction - Tempo de Viol�ncia','Vincent Vega e Jules Winnfield s�o dois assassinos profissionais trabalham fazendo cobran�as para um poderosos g�ngster.Vega � for�ado a sair com a garota do chefe,temendo passar dos limites.enquanto isso,o pugilista Butch Coolidge se mete em apuros por ganhar luta que deveria perder.',19950303,9240)
,(1,4,9,'Os Bons Companheiros','Henry Hill conta a sua hist�ria de garoto do Brooklyn,Nova York,que sempre sonhou ser g�ngster, come�ando sua �carreira� aos 11 anos e se tornando protegido de James �Jimmy� Conway, um mafioso em ascens�o.',19900909,8700)
,(1,4,4,'Blade Runner, o Ca�ador de Andr�ides','No s�culo 21, uma corpora��o desenvolve clones humanos para serem usados como escravos em col�nias fora da Terra, identificados como replicantes. Em 2019, um ex-policial � acionado para ca�ar um grupo fugitivo vivendo disfar�ado em Los Angeles.',19820726,7020)
,(1,4,4,'Laranja Mec�nica','O jovem Alex passa as noites com uma gangue de amigos briguentos. Depois que � preso, se submete a uma t�cnica de modifica��o de comportamento para poder ganhar sua liberdade.',19720426,8160)
,(1,4,3,'O Iluminado','Jack � um escritor com uma hist�ria de alcoolismo e abuso infantil, que come�a a trabalhar em um solit�rio hotel. Neste lugar, ele, a esposa e o filho experimentam um poder maligno que os faz enlouquecer.',19801225,8760)
,(1,4,9,'Todos os Homens do Presidente','Um rep�rter do Washington Post inicia uma investiga��o sobre a invas�o de cinco homens na sede do Partido Democrata, que d� origem ao esc�ndalo Watergate e que teve como conseq��ncia a queda do presidente Richard Nixon.',19760409,8280)
,(1,4,10,'Banz� no Oeste','Uma s�tira irreverente sobre um xerife negro contratado por um especulador desonesto para expulsar cidad�os de uma cidade somente de brancos que fica no caminho de uma ferrovia.',19740712,5700)
,(1,4,4,'A Origem','Dom Cobb � um ladr�o com a rara habilidade de roubar segredos do inconsciente, obtidos durante o estado de sono. Impedido de retornar para sua fam�lia, ele recebe a oportunidade de se redimir ao realizar uma tarefa aparentemente imposs�vel.',20100806,8880)
,(1,3,3,'Doutor Jivago','Baseado no romance de Boris Pasternak, Dr. Jivago � um m�dico e poeta que inicialmente apoia a revolu��o Russa, mas, aos poucos, se desilude com o socialismo e se divide entre dois amores: a esposa Tania e a bela plebeia Lara.',19651222,11820)
,(6,2,1,'Os Sete Samurais','Um samurai atende a um pedido de prote��o contra bandidos � uma vila japonesa. Ele convida outros seis samurais para ajud�-lo a ensinar �s pessoas a como se defenderem sozinhas.',19540426,12420)
,(6,4,9,'Sindicato de Ladr�es','Terry Malloy sonha com as gl�rias do boxe, mas foi convencido pelo corrupto mafioso Johnny Friendly, para quem trabalha, a perder uma luta.',19540622,6480)
,(6,4,8,'A Ponte do Rio Kwai','Depois de liquidar suas diferen�as com o comandante de um campo de prisioneiros japon�s,um coronel brit�nico coopera para supervisionar seus homens na constru��o de uma ponte ferrovi�ria para os seus captores,enquanto permanece alheio aos planos dos Aliados para destru�-la.',19571223,12060)
,(6,4,8,'Quase Famosos','um adolescente de 15 anos, tem a chance realizar seu sonho acompanhando a turn� da banda Stillwater como jornalista. Sua m�e superprotetora acredita que o mundo do rock � dominado por drogas e sexo, mas as mat�rias do garoto chamam a aten��o da revista Rolling Stone, que o convida a viajar com o grupo.',20010323 ,7320)
,(6,4,3,'Um Corpo que Cai','o detetive aposentado John �Scottie� Ferguson sofre de um terr�vel medo de alturas. Certo dia, encontra com um antigo conhecido,que pede que ele siga sua esposa, Madeleine Elster.Ela demonstra uma estranha atra��o por lugares altos, levando o detetive a enfrentar seus piores medos.',19580721,7740)
,(6,4,1,'Gladiador','Maximus � um poderoso general romano,amado pelo povo e pelo imperador,que antes de sua morte,desperta a ira de seu filho ao tornar p�blica a sua predile��o em deixar o trono para Maximus.Sedento pelo poder,Commodus mata seu pai,assume a coroa e ordena a morte de Maximus,que consegue fugir.',20000519,9300)
,(6,1,10,'Feiti�o do Tempo','Phil, um arrogante meteorologista de um canal de televis�o, fica preso em uma esp�cie de t�nel do tempo, condenado a reviver indefinidamente o mesmo dia at� que mude suas atitudes',19930212,6060)
,(6,4,3,'Taxi Driver - Motorista de T�xi','O motorista de t�xi de Nova York Travis Bickle, veterano da Guerra do Vietn�, reflete constantemente sobre a corrup��o da vida ao seu redor e sente-se cada vez mais perturbado com a pr�pria solid�o e aliena��o.',19760322,6780)
,(6,3,2,'Harry e Sally - Feitos Um para o Outro','Harry e Sally v�o morar em Nova York,se veem esporadicamente e constroem uma grande amizade ao longo dos anos.Mas,aos poucos,percebem com certo temor que est�o apaixonados um pelo outro.',19890714,5760)
,(6,4,10,'Dr. Fant�stico','Um general insano que acredita que os comunistas planejam dominar o mundo d� ordens para bombardear a R�ssia,iniciando processo de guerra nuclear.Ao mesmo tempo,o presidente e seus assessores do Pent�gono tentam desesperadamente parar o processo.',19640720,5700)
,(6,4,8,'Lawrence da Ar�bia','Gra�as ao seu conhecimento dos bedu�nos,o oficial brit�nico T.E.Lawrence � enviado � Ar�bia para encontrar o pr�ncipe Faisal e servir de liga��o entre �rabes e ingleses na luta contra os turcos.Com a ajuda do nativo xerife Ali.',19630204,12780)
,(5,4,3,'O Sil�ncio dos Inocentes','Clarice Starling, agente novata do FBI, procura por um assassino que ataca mulheres jovens e depois retira suas peles. Para construir o perfil psicol�gico deste psicopata, recorre � ajuda de um assassino preso que agia de forma semelhante.',19910517,7080)
,(3,4,6,'Tubar�o','Um terr�vel ataque a banhistas � o sinal de que a praia da pequena cidade de Amity, na Nova Inglaterra, virou refeit�rio de um gigantesco tubar�o branco. O chefe de pol�cia Martin Brody quer fechar as praias, mas o prefeito Larry Vaughn n�o permite.',19750720,7440)
,(3,4,10,'Clube dos Cinco','Cinco adolescentes do ensino m�dio cometem pequenos delitos na escola e, como puni��o, t�m que passar o s�bado no col�gio e escrever uma reda��o contando o que pensam de si mesmos. O grupo re�ne jovens com perfis completamente diferentes.',19850628,5820)
,(10,3,3,'butch Cassidy','Dois amigos insepar�veis, Butch Cassidy e Sundance Kid,lideram o Bando do Buraco na Parede e vivem de assaltar trens e bancos.Quando s�o ca�ados por todo o pa�s resolvem ir para a Bol�via.',19690824, 6600)

select * from Video