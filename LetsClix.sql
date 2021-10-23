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
	,preco decimal (4,2)
	,dt_ini_vigencia datetime
	,dt_fim_vigencia datetime
)
 
 --alterando o campo preco para receber valores decimais
--ALTER TABLE Plano_Assinatura
--ALTER COLUMN preco decimal (4,2)


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

alter table Historico_Usuario
add constraint FK_HISTORICO_USUARIO_1 foreign key (id_video) REFERENCES Video (id)

alter table Historico_Usuario
add constraint FK_HISTORICO_USUARIO_2 foreign key (id_usuario) REFERENCES Usuario (id)

alter table Plano_Usuario
add constraint FK_PLANO_USUARIO_1 foreign key (id_plano) REFERENCES Plano_Assinatura(id)

alter table Plano_Usuario
add constraint FK_PLANO_USUARIO_2 foreign key (id_usuario) REFERENCES Usuario(id)

alter table Plano_Assinatura
add constraint FK_PLANO_ASSINATURA_1 foreign key (id_regiao) REFERENCES Regiao (id)

alter table Usuario
add constraint FK_USUARIO_1 foreign key (id_regiao) REFERENCES Regiao (id)

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
--truncate table Plano_Assinatura
-- depois disso é só dar o insert de novo

insert into Usuario
values
	(61401732216, 'Rua Jocelin de Souza Rocha, 755, Valentina de Figueiredo', 'João Pessoa', 'PB', 2)
	,(51828178195, 'Quadra QNN 30 Área Especial E, Ceilândia Sul (Ceilândia)', 'Brasília', 'DF', 3)
	,(08246073923, 'Rua Antônio Lustosa de Siqueira, 268, Primavera', 'Guarapuava', 'PR', 5) 	
	,(67846714651, 'Rua Benedito Escalante, 717, Ponte Nova', 'Várzea Grande', 'MT', 3) 
	,(15358198989, 'Travessa Santa Lúcia, 628, Barro Duro', 'Maceió', 'AL', 2) 
	,(69166610117, 'Rua Santa Vitória, 631, Pajuçara', 'Natal', 'RN', 2) 
	,(74506173155, 'Rua José Norgarolli, 684, Mercês', 'Curitiba', 'PR', 5) 
	,(44314318708, 'Rua São Pedro, 926, Estiva', 'São Luís', 'MA', 2)
	,(19837453753, 'Rua Natalie Wood, 557, Jardim Campo Nobre', 'Campo Grande', 'MS', 3)
	,(76532120006, 'Rua Venezuela, 496, Embratel', 'Porto Velho', 'RO', 1) 
	,(11952771218, 'Rua 102A, 978, Setor Sul', 'Goiânia', 'GO', 3)
	,(17676163412, 'Rua Cento e Onze, 716, Jardim Paulista', 'Paulista', 'PE', 2)
	,(80393856526, 'Quadra 22, Conjunto D, 357, Paranoá', 'Brasília', 'DF', 3)
	,(31034177214, 'Rua Tocantins, 137, Centro Industrial', 'João Monlevade', 'MG', 4) 
	,(28382638112, 'Rua 30, 281, Loteamento Nova Araguaína', 'Araguaína', 'TO', 1)
	,(84844996851, 'Rua Arnoldo Ristow, 100, Zantão', 'Brusque', 'SC', 5)
	,(70178749001, 'Avenida Adjalma Saldanha, 387, Jardim São João 1ª Seção', 'Ponta Porã', 'MS', 3) 
	,(75974701348, 'Avenida São João Apóstolo, 835, Fonte Nova', 'Santana', 'AP', 1)
	,(06800214850, 'Rua Radialista Armindo Amaral, 413, Céu Azul', 'Belo Horizonte', 'MG', 4)
	,(16296643837, 'Travessa Presidente Castelo Branco, 890, Bom Pastor', 'Natal', 'RN', 2)
	,(76588249411, 'Rua virgílio Marinho, 308, Compensa', 'Manaus', 'AM', 1)
	,(27010990565, 'Rua Renê Barthesom, 460, Vila Formosa', 'Campinas', 'SP', 4)
	,(24056062919, 'Rua Manoel Firme, 133, São João Batista', 'Cariacica', 'ES', 4)
	,(38704352165, 'Rua Eunice de Freitas Silva, 506, Serraria', 'Maceió', 'AL', 2)
	,(21462266762, 'Rua São Vicente, 151, Vivendas do Turu', 'São Luís', 'MA', 2)
	,(77451691438, 'Quadra CLN 204 Bloco A, 329, Asa Norte', 'Brasília', 'DF', 3)
	,(81384539239, 'Rua José Vieira de Melo, 705, Cruz das Armas', 'João Pessoa', 'PB', 2)
	,(28958024755, 'Rua João Pinheiro Cavalcante, 387, Ribeira', 'Palmeira dos Índios', 'AL', 2)
	,(33552067337, 'Rua Onofre Ribeiro de Carvalho, 284, Prolongamento Jardim Mato Grosso', 'Rondonópolis', 'MT', 3)
	,(19387798356, 'Rua Três, 914, Vila Amorim', 'Redenção', 'PA', 1)
	,(73363637845, 'Rua Kulinas, 626, Chapada', 'Manaus', 'AM', 1)
	,(51917477988, 'Rua Caxias do Sul, 637, Infraero', 'Macapá', 'AP', 1)
	,(78920256187, 'Viela São Benedito do Rio Preto, 865, Parque Jandaia', 'Guarulhos', 'SP', 4)
	,(91794302360, 'Rua Hélio Rocha, 442, Clima Bom', 'Maceió', 'AL', 2)
	,(69397365304, 'Rua da Malária, 489, João Paulo', 'São Luís', 'MA', 2)
	,(72975605374, 'Rua Laura Preira, 788, Santo Antônio', 'Mossoró', 'RN', 2)
	,(67480836996, 'Rua João Luiz Dias, 947, Parque Residencial Cidade Nova', 'Maringá', 'PR', 5)
	,(24067275803, 'Rua Trevizani, 662, Parque Independência III', 'Juiz de Fora', 'MG', 4)
	,(63653259754, 'Rua Cajamar, 945, Jardim Aero Rancho', 'Campo Grande', 'MS', 3)
	,(98564117690, 'Quadra 1112 Sul Avenida NS 10, 442, Plano Diretor Sul', 'Palmas', 'TO', 1)
	,(68423820920, 'Vila Jureminha, 975, Joaquim Távora', 'Fortaleza', 'CE', 2)
	,(82250233667, 'Rua Reis, 953, Vila dos Nobres', 'São Luís', 'MA', 2)
	,(96492166698, 'Vila Doutor Marbel, 646, Antônio Bezerra', 'Fortaleza', 'CE', 2)
	,(25558406054, 'Rua 8 de Setembro, 311, LAgo Azul', 'Manaus', 'AM', 1)
	,(49547402153, 'Rua Chico Reis, 702, Rio Madeira', 'Porto Velho', 'RO', 1)
	,(91173040838, 'Avenida José Fernandes Monteiro Filho, 826, Jardim das Palmeiras', 'Araraquara', 'SP', 4)
	,(76816621387, 'Rua Presidente João Pessoa, 427, Cetro', 'Cabedelo', 'PB', 2)
	,(84915534790, 'Quadra 58, 274, Brasilinha 17', 'Planaltina', 'GO', 3)
	,(81392163218, 'Rua Aristides Waltrick, 752, Copacabana', 'Lages', 'SC', 5)
	,(93238130870, 'Rua Israel Ferreira Ferro, 104, Jardim Carombé', 'São Paulo', 'SP', 4)

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
	('Ação')
	,('Romance')
	,('Drama')
	,('Ficção Cientifica')
	,('Fantasia')
	,('Terror')
	,('Horror')
	,('Aventura')
	,('Policial')
	,('Comédia')

select * from Genero

insert into Video
values
(8, 4, 3, 'Touro Indomável', 'O pugilista peso-médio Jake LaMotta, chamado de o touro do Bronx, sobe na carreira com a mesma rapidez com que sua vida particular se degrada, graças ao seu temperamento violento e possessivo.', '19801114', 7680)
,(2, 1, 10, 'Mary Poppins', 'Na Londres de 1910, um banqueiro rígido e severo com os filhos escreve um anúncio no jornal em busca de uma governanta.', '19641109', 8040)
,(7, 3, 7, 'Intriga Internacional', 'O publicitário Roger Tornhill é confundido com um agente secreto e acaba se envolvendo em uma perigosa trama de espionagem. Após ser acusado de assassinato, ele precisa lutar.', '19590728', 8160)
,(8, 1, 2, 'Amor, Sublime Amor', 'No lado oeste de Nova York, à sombra dos arranha-céus, ficam os guetos de imigrantes e classes menos favorecidas. Duas gangues, os Sharks, de porto-riquenhos, e os Jets.', '19611225', 9120)
,(7, 4, 8, 'Thelma & Louise', 'No Arkansas, garçonete quarentona e jovem dona de casa entediadas resolvem fazer pequena viagem para fugir da rotina.', '19910524', 7800)
,(4, 2, 2, 'Crepúsculo dos Deuses', 'Uma estrela veterana do cinema mudo se recusa a aceitar que seu reinado acabou. Então ela contrata um jovem roteirista para ajudá-la a reconquistar o sucesso.', '19500810', 6600)
,(1, 3, 1, 'Batman: O Cavaleiro das Trevas', 'Com a ajuda de Jim Gordon e Harvey Dent, Batman tem mantido a ordem na cidade de Gotham. Mas um jovem e anárquico criminoso conhecido como Coringa ganha força.', '20080718', 9000)
,(3, 1, 4, 'Jurassic Park: O Parque dos Dinossauros', 'Em uma ilha remota, um rico empresário monta um parque temático com dinossauros vivos, criados a partir de DNA pré-histórico. Antes de abri-lo ao público, ele convida um conceituado.', '19930613', 7620)
,(4, 3, 7, 'Janela Indiscreta', 'Em Greenwich Village, Nova York, L.B. Jeffries,um fotógrafo profissional, está confinado em seu apartamento por ter quebrado a perna enquanto trabalhava.', '19540804', 6720)
,(8, 1, 2, 'Quanto Mais Quente Melhor', 'Após testemunhar um assassinato da máfia, o saxofonista Joe e seu velho amigo Jerry improvisam um plano rápido para escaparem vivos de Chicago. Disfarçando-se como mulheres.', '19590504', 7320)
,(10, 3, 2, 'Titanic', 'Um artista pobre e uma jovem rica se conhecem e se apaixonam na fatídica jornada do Titanic, em 1912. Embora esteja noiva do arrogante herdeiro de uma siderúrgica.', '19980116', 11640)
,(2, 1, 10, 'Toy Story', 'O aniversário de Andy está chegando e os brinquedos estão nervosos. Afinal de contas, eles temem que um novo brinquedo possa substituí-los. Liderados por Woody.', '19951222', 4860)
,(4, 1, 10, 'Curtindo a Vida Adoidado', 'No último semestre do curso do colégio, Ferris Bueller sente um incontrolável desejo de matar a aula e planeja um grande programa na cidade com sua namorada, seu melhor amigo e uma Ferrari.', '19861219', 6180)
,(6, 4, 6, 'O Ataque dos Tomates Assassinos', 'O filme inicia com o ataque a uma dona de casa, realizado por um tomate. A policia fica intrigada ao descobrir que, o que parecia sangue é, na verdade, suco de tomate. Com a quantidade de ataques aumentando.', '19870110', 5220)
,(9, 3, 10, 'Um Estranho no Ninho', 'Randle Patrick McMurphy, um prisioneiro, simula estar insano para não trabalhar e vai para uma instituição para doentes mentais. Lá estimula os internos a se revoltarem contra as rígidas normas.', '19760528', 7740)
,(4, 4, 9, 'Chinatown', 'O detetive particular Jake Gittes é contratado por uma ricaça para investigar o marido, no que parece ser mais um caso de infidelidade conjugal. Gittes logo descobre que a mulher era uma impostora.', '19740620', 7800)
,(7, 3, 10, 'Noivo Neurótico, Noiva Nervosa', 'Alvy Singer, um humorista judeu e divorciado que faz análise há quinze anos, acaba se apaixonando por Annie Hall, uma cantora em início de carreira com uma cabeça um pouco complicada.', '19770420', 5580)
,(8, 4, 3, 'Apocalypse Now', 'O Capitão Willard recebe a missão de encontrar e matar o comandante das Forças Especiais, Coronel Kurtz,que aparentemente enlouqueceu e se refugiou nas selvas do Camboja.',  '19790510', 9180)
,(4, 1, 8, 'Indiana Jones e os Caçadores da Arca Perdida', 'Em 1936, o arqueólogo Indiana Jones é contratado para encontrar a Arca da Aliança, que segundo as escrituras bíblicas conteria Os Dez Mandamentos.', '19811225', 6900)
,(4, 3, 8, 'Indiana Jones e o Reino da Caveira de Cristal', 'Durante a Guerra Fria, Indiana Jones e o jovem Mutt buscam a Caveira de Cristal, um objeto místico de grande valor, mas logo percebem que não estão sozinhos.', '20080521', 7320)
,(4, 1, 1, 'Indiana Jones e a Última Cruzada', 'O arqueólogo Indiana Jones embarca em uma missão perigosa e cheia de aventuras para salvar seu pai, o professor Henry Jones, que foi sequestrado por nazistas e para tentar encontrar o lendário.', '19890524', 7620)
,(3, 1, 10, 'De Volta Para o Futuro', 'Marty McFly é um adolescente americano dos anos 80. Acidentalmente ele viaja de volta no tempo para 1955 em uma máquina do tempo inventada por seu amigo, o cientista maluco Dr. Brown.', '19851225', 6900)
,(3, 1, 10, 'De Volta para o Futuro 2', 'Marty McFly e o cientista "Doc" Brown viajam de 1985 a 2015 para evitar que o filho de Marty estrague o futuro da família McFly. Porém, seu arqui-inimigo Biff Tannen rouba a máquina do tempo de Doc.', '19891122', 6480)
,(3, 1, 10, 'De Volta para o Futuro 3', 'Marty recebe uma mensagem do Dr. Emmett Brown, na qual ele informa que agora vive em uma pequena cidade do Velho Oeste, em 1885. Quando Marty descobre que Doc acabará sendo assassinado.', '19900525', 7080)
,(3, 4, 1, 'A Lista de Schindler', 'A inusitada história de Oskar Schindler, um sujeito oportunista, sedutor, armador, simpático, comerciante no mercado negro, mas, acima de tudo, um homem que se relacionava muito bem.', '19931130', 11700)
,(5, 3, 1, 'Cidadão Kane', 'Cidadão Kane é supostamente baseado na vida do magnata do jornalismo William Randolph Hearst e conta a história de Charles Foster Kane, um menino pobre que acaba se tornando um dos homens mais ricos.', '19410705', 7140)
,(7, 1, 5, 'O Mágico de Oz', 'Dorothy Gale  é uma menina órfã que vive na fazenda dos tios no Kansas. De espírito aventureiro, ela vê seus sonhos se realizarem quando um tornado a leva para além do arco-íris ao lado do cão.', '19390815', 6720)
,(1, 4, 3, 'Um Sonho de Liberdade', 'Andy Dufresne é condenado a duas prisões perpétuas consecutivas pelas mortes de sua esposa e de seu amante. Porém, só Andy sabe que ele não cometeu os crimes. No presídio, durante dezenove anos.', '19950125', 8400)
,(1, 2, 2, 'Casablanca', 'Durante a Segunda Guerra, um exilado norte-americano encontra refúgio na cidade de Casablanca e passa a administrar uma casa noturna. Ele reencontra uma antiga paixão, que agora está casada.', '19421126', 6060)
,(3, 2, 4, 'E.T. - O Extraterrestre', 'Um garoto faz amizade com um ser de outro planeta, que ficou sozinho na Terra, protegendo-o de todas as formas para evitar que ele seja capturado e transformado em cobaia.', '19820611', 9660)
,(7, 3, 4, '2001: Uma Odisséia no Espaço', 'Depois de descobrir um artefato misterioso enterrado sob a superfície lunar, a humanidade parte em uma busca para encontrar suas origens com a ajuda do supercomputador inteligente H.A.L. 9000.', '19680529', 6900)
,(2, 3, 4, 'Star Wars: Os Últimos Jedi', 'A tranquila e solitária vida de Luke Skywalker sofre uma reviravolta quando ele conhece Rey, uma jovem que mostra fortes sinais da Força. O desejo dela de aprender o estilo dos Jedi força Luke.', '20171209', 9120)
,(2, 3, 4, 'Star Wars: Episódio IX A Ascensão Skywalker', 'A parte da Resistência que sobreviveu enfrenta a Primeira Ordem mais uma vez. A batalha final marcará o fim de uma saga de grandes embates da família Skywalker. Novas lendas nascerão.', '20191219', 8520)
,(2, 3, 4, 'Star Wars: O Despertar da Força', 'A queda de Darth Vader e do Império levou ao surgimento de uma nova força sombria: a Primeira Ordem. Eles procuram o jedi Luke Skywalker, desaparecido.', '20151214', 8100)
,(2, 1, 4, 'Star Wars: Episódio 2  Ataque dos Clones', 'Tentado por promessas de poder, Anakin Skywalker se aproxima de Darth Sidious e participa de um plano para acabar com os Cavaleiros Jedi.', '20020516', 8520)
,(10, 1, 4, 'Star Wars: Episódio III  A Vingança dos Sith', 'As Guerras Clônicas estão em pleno andamento e Anakin Skywalker mantém um elo de lealdade com Palpatine, ao mesmo tempo em que luta para que seu casamento com Padmé Amidala não seja afetado.', '20050519', 8400)
,(10, 1, 4, 'Star Wars: Episódio I  A Ameaça Fantasma ', 'Obi-Wan e seu mentor embarcam em uma perigosa aventura na tentativa de salvar o planeta das garras de Darth Sidious. Durante a viagem, eles conhecem um habilidoso menino e decidem treiná-lo.', '19990519', 8160)
,(10, 1, 4, 'Star Wars Episódio VI: O Retorno de Jedi', 'Luke Skywalker e seus amigos viajam para Tatooine e salvam seu amigo Han Solo do lorde do crime Jabba o Hutt. O Império Galático começou a construção de uma segunda Estrela da Morte.', '19830525', 8040)
,(10, 3, 4, 'Guerra nas Estrelas: O Império Contra-Ataca', 'Yoda treina Luke Skywalker para ser um cavaleiro Jedi. Han Solo corteja a Princesa Leia enquanto Darth Vader retorna para combater as forças rebeldes que tentam salvar a galáxia.', '19800521', 7440)
,(10, 3, 4, 'Star Wars: Uma Nova Esperança', 'A princesa Leia é mantida refém pelas forças imperiais comandadas por Darth Vader. Luke Skywalker e o capitão Han Solo precisam libertá-la e restaurar a liberdade e a justiça na galáxia.', '19771118', 7260)
,(5, 3, 5, 'Avatar','No exuberante mundo alienígena de Pandora vivem os Navi, seres que parecem ser primitivos, mas são altamente evoluídos. Como o planeta é tóxico, foram criados os avatares, corpos biológicos controlados pela mente humana.','20191218',10920)  
,(3, 4, 2, 'O Segredo de Brokeback Mountain','Jack e Ennis se conheceram em Wyoming, no verão de 1963, quando foram trabalhar para um rancheiro que criava ovelhas. Naquele ambiente solitário nas montanhas, eles acabam tendo um rápido contato sexual.','20051207',8040)
,(5, 1, 10, 'Os Caça-Fantasmas 2','Quando o caçador de fantasmas Peter Venkman fica sabendo que seu filho está na mira de espíritos, os Caça-Fantasmas se prepararam para mais uma missão.','19890616',6120)
,(5, 2, 10, 'Os Caça-Fantasmas','Uma equipe de cientistas, Dr. Egon, Dr. Ray e Dr. Peter, perde o emprego em uma universidade de Nova York. Eles decidem, então, se tornar caçadores de fantasmas e travar uma batalha de alta tecnologia com o sobrenatural por dinheiro.','19841220',6300)
,(6, 3, 1, 'Duro de Matar','John McClane é um detetive de Nova York que está indo a Los Angeles para se encontrar com sua esposa, que trabalha em uma empresa japonesa.','19881202',7560)
,(2, 1, 5, 'A Bela e a Fera','A jovem Bela está cansada da vida provinciana de uma pequena cidade francesa, onde vive também o galã Gastón que, apesar de derreter corações, não consegue conquistá-la com seu jeito grosseiro.','19911213',5340)
,(6, 5, 1, 'Rocky, um Lutador','Rocky Balboa, um lutador de boxe medíocre que trabalha como cobrador de um agiota, tem a chance de enfrentar Apollo Creed, o campeão mundial dos pesos-pesados.','19770107',7140)
,(2, 1, 2, 'Up - Altas Aventuras','Carl Fredricksen é um vendedor de balões que, aos 78 anos, está prestes a perder a casa em que sempre viveu com sua esposa, a falecida Ellie.','20090525',5760)
,(3, 5, 3, 'O Franco-Atirador ','Três amigos recrutados para a guerra do Vietnã são capturados pelos vietcongues. Além de mal-tratados fisicamente, é a tortura psicológica um jogo de roleta russa entre eles que os fará repensar o motivo de tudo aquilo.','19781208',10920)
,(1, 4, 3, 'O Labirinto do Fauno','Espanha, 1944. Oficialmente a Guerra Civil já terminou, mas um grupo de rebeldes ainda luta nas montanhas ao norte de Navarra.','20060527',7080)
,(1, 5, 1, 'Bonnie e Clyde - Uma Rajada de Balas','Durante a era da Grande Depressão, Bonnie e Clyde são dois jovens que se conhecem de forma inusitada.','19670911',6660)
,(1, 3, 4, 'Matrix Revolutions','Após enfrentar os sentinelas no mundo real, Neo, a maior esperança da humanidade, está preso entre a Matrix e a realidade.','20030905',7740)
,(1, 3, 4, 'Matrix Reloaded','Após derrotar as máquinas em seu combate inicial, Neo ainda vive na Nabucodonosor ao lado de Morpheus, Trinity e Link, o novo tripulante da nave. As máquinas estão realizando uma grande ofensiva contra Zion.','20030516',8280)
,(1, 3, 4, 'Matrix','Um hacker fica sabendo de uma incrível conspiração que envolve a realidade de todos os humanos e se junta a uma rebelião em busca da liberdade.','19990331',8160)
,(4, 1, 10, 'Apertem os Cintos O Piloto Sumiu','O piloto Ted Striker, ex-combatente de guerra, é forçado a assumir os controles de um avião quando a tripulação sucumbe à comida contaminada.','19801226',5220)
,(8, 4, 9, 'Seven - Os Sete Crimes Capitais','Dois policiais, om jovem e impetuoso David Mills e o outro maduro e prestes a se aposentar, William Somerset,são encarregados de uma periogosa investigação.','19951215',7560)
,(2, 1, 5, 'O Rei Leão','Este desenho animado da Disney mostra as aventuras de um leão jovem de nome Simba, o herdeiro de seu pai, Mufasa. O tio malvado de Simba, Oscar, planeja roubar o trono de Mufasa atraindo pai e filho para uma emboscada.','19940708',5400)
,(3, 2, 10, 'Brilho Eterno de uma Mente sem Lembranças','Joel e Clementine formavam um casal que durante anos tentaram fazer com que o relacionamento desse certo. Desiludida com o fracasso, Clementine decide esquecer Joel para sempre.','20040723',6480)
,(9, 2, 3, 'O Resgate do Soldado Ryan','Ao desembarcar na Normandia, no dia 6 de junho de 1944, capitão Miller recebe a missão de comandar um grupo do batalhão para o resgate do soldado James Ryan, caçula de quatro irmãos, dentre os quais três morreram em combate.','19980911',9780)
,(4, 4, 2, 'Forrest Gump: O Contador de Histórias','Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump,um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais.','19940706',8520)
,(6, 4, 3, 'Coração Valente','No século XIII, soldados ingleses matam a mulher do escocês William Wallace, bem na sua noite de núpcias. Para vingar a amada, ele resolve liderar seu povo em uma luta contra o cruel Rei inglês Edward.','19940714',9900)
,(5, 4, 6, 'Psicose','Marion Crane é uma secretária que rouba 40 mil dólares da imobiliária onde trabalha para se casar e começar uma nova vida. Durante a fuga à carro, ela enfrenta uma forte tempestade, erra o caminho e chega em um velho hotel.','19600825',6600)
,(7, 3, 10, 'Cantando na Chuva','Don Lockwood e Lina Lamont são dois dos astros mais famosos da época do cinema mudo em Hollywood. Seus filmes são um verdadeiro sucesso de público e as revistas inclusive apostam num relacionamento mais íntimo entre os dois.','19520630',6120)
,(1, 4, 2, '....E o Vento Levou','Scarlett OHara é uma jovem mimada que consegue tudo o que quer. No entanto, algo falta em sua vida: o amor de Ashley Wilkes, um nobre sulista que deve se casar com a sua prima Melanie.','19400101',14280)
,(3, 3, 9, 'O Sol é Para Todos','Jean Louise Finch recorda que em 1932, quando tinha seis anos, Macomb, no Alabama, já era um lugarejo velho. Nesta época Tom Robinson, um jovem negro, foi acusado de estuprar Mayella Violet Ewell, uma jovem branca. Seu pai.','19630211',7740)
,(8, 1, 2, 'A Noviça Rebelde','No final da década de 1930, na Áustria, quando o pesadelo nazista estava prestes a se instaurar no país, uma noviça que vive em um convento mas não consegue seguir as rígidas normas de conduta das religiosas.','19650302',10500)
,(6, 2, 8, 'A Princesa Prometida','Um avô lê um conto de fadas ao seu neto, com direito a uma linda princesa, lutas de esgrima e gigantes. A história do livro se baseia na vida da princesa Buttercup,que é apaixonada por um jovem camponês.','19880129',5880)
,(5, 5, 3, 'Clube da Luta','Jack é um executivo jovem, trabalha como investigador de seguros, mora confortavelmente, mas ele está ficando cada vez mais insatisfeito com sua vida medíocre. Para piorar ele está enfrentando uma terrível crise de insônia.','19991015',9060)
,(8, 5, 7, 'Alien, o Oitavo Passageiro','Nave espacial, ao retornar para a Terra, recebe estranhos sinais vindos de um asteroide. Ao investigarem o local, um dos tripulantes é atacado por um estranho ser. O que parecia ser um ataque isolado se transforma em um terror constante.','19790820',7020)
,(6, 1, 3, 'A Malvada','A astuta Eve Harrington deseja tomar o lugar da grande atriz Margo Channing na Broadway, e nada vai impedi-la. Ela deixa o clima tenso e interfere na vida do namorado de Margo, escritor de suas peças, e da esposa dele.','19501013',8280)
,(8,4,8,'Senhor dos Anéis: O Retorno do Rei','O confronto final entre as forças do bem e do mal que lutam pelo controle do futuro da Terra Média se aproxima.Sauron planeja um grande ataque a Minas Tirith,capital de Gondor.','20031205',10860)
,(8,3,1,'Senhor dos Anéis:A Sociedade do Anel','Em uma terra fantástica e única, um hobbit recebe de presente de seu tio um anel mágico e maligno que precisa ser destruído antes que caia nas mãos do mal.','20011219',10680)
,(8,3,5,'Senhor dos Anéis:As Duas Torres','Após a captura de Merry e Pippy pelos orcs, a Sociedade do Anel é dissolvida. Enquanto que Frodo e Sam seguem sua jornada rumo à Montanha da Perdição para destruir o Um Anel, Aragorn,Legolas  e Gimli partem para resgatar os hobbits sequestrados.','20021218',10740)
,(4,4,3,'O Poderoso Chefão','Uma família mafiosa luta para estabelecer sua supremacia nos Estados Unidos depois da Segunda Guerra Mundial.','19720315',10500)
,(4,4,3,'O Poderoso Chefão: Parte II','Início do século XX. Após a máfia local matar sua família, o jovem Vito foge da sua cidade na Sicília e vai para a América. Já adulto em Little Italy,luta para ganhar a vida (legal ou ilegalmente) e manter sua esposa e filhos.','19741220',12120)
,(4,4,3,'O Poderoso Chefão: Parte III','Don Michel Corleone está envelhecendo e, com a ajuda do sobrinho Vicente Mancini, busca a legitimação dos interesses da família, em Nova York e na Itália, antes de sua morte. Mas seu protegido não está só interessado em parte do império da família.','19901220',9720)
,(4,4,3,'Pulp Fiction - Tempo de Violência','Vincent Vega e Jules Winnfield são dois assassinos profissionais trabalham fazendo cobranças para um poderosos gângster.Vega é forçado a sair com a garota do chefe,temendo passar dos limites.enquanto isso,o pugilista Butch Coolidge se mete em apuros por ganhar luta que deveria perder.','19950303',9240)
,(1,4,9,'Os Bons Companheiros','Henry Hill conta a sua história de garoto do Brooklyn,Nova York,que sempre sonhou ser gângster, começando sua carreira aos 11 anos e se tornando protegido de James Jimmy Conway, um mafioso em ascensão.','19900909',8700)
,(1,4,4,'Blade Runner, o Caçador de Andróides','No século 21, uma corporação desenvolve clones humanos para serem usados como escravos em colônias fora da Terra, identificados como replicantes. Em 2019, um ex-policial é acionado para caçar um grupo fugitivo vivendo disfarçado em Los Angeles.','19820726',7020)
,(1,4,4,'Laranja Mecânica','O jovem Alex passa as noites com uma gangue de amigos briguentos. Depois que é preso, se submete a uma técnica de modificação de comportamento para poder ganhar sua liberdade.','19720426',8160)
,(1,4,3,'O Iluminado','Jack é um escritor com uma história de alcoolismo e abuso infantil, que começa a trabalhar em um solitário hotel. Neste lugar, ele, a esposa e o filho experimentam um poder maligno que os faz enlouquecer.','19801225',8760)
,(1,4,9,'Todos os Homens do Presidente','Um repórter do Washington Post inicia uma investigação sobre a invasão de cinco homens na sede do Partido Democrata, que dá origem ao escândalo Watergate e que teve como conseqüência a queda do presidente Richard Nixon.','19760409',8280)
,(1,4,10,'Banzé no Oeste','Uma sátira irreverente sobre um xerife negro contratado por um especulador desonesto para expulsar cidadãos de uma cidade somente de brancos que fica no caminho de uma ferrovia.','19740712',5700)
,(1,4,4,'A Origem','Dom Cobb é um ladrão com a rara habilidade de roubar segredos do inconsciente, obtidos durante o estado de sono. Impedido de retornar para sua família, ele recebe a oportunidade de se redimir ao realizar uma tarefa aparentemente impossível.','20100806',8880)
,(1,3,3,'Doutor Jivago','Baseado no romance de Boris Pasternak, Dr. Jivago é um médico e poeta que inicialmente apoia a revolução Russa, mas, aos poucos, se desilude com o socialismo e se divide entre dois amores: a esposa Tania e a bela plebeia Lara.','19651222',11820)
,(6,2,1,'Os Sete Samurais','Um samurai atende a um pedido de proteção contra bandidos à uma vila japonesa. Ele convida outros seis samurais para ajudá-lo a ensinar às pessoas a como se defenderem sozinhas.','19540426',12420)
,(6,4,9,'Sindicato de Ladrões','Terry Malloy sonha com as glórias do boxe, mas foi convencido pelo corrupto mafioso Johnny Friendly, para quem trabalha, a perder uma luta.','19540622',6480)
,(6,4,8,'A Ponte do Rio Kwai','Depois de liquidar suas diferenças com o comandante de um campo de prisioneiros japonês,um coronel britânico coopera para supervisionar seus homens na construção de uma ponte ferroviária para os seus captores,enquanto permanece alheio aos planos dos Aliados para destruí-la.','19571223',12060)
,(6,4,8,'Quase Famosos','um adolescente de 15 anos, tem a chance realizar seu sonho acompanhando a turnê da banda Stillwater como jornalista. Sua mãe superprotetora acredita que o mundo do rock é dominado por drogas e sexo, mas as matérias do garoto chamam a atenção da revista Rolling Stone.','20010323' ,7320)
,(6,4,3,'Um Corpo que Cai','o detetive aposentado John Scottie Ferguson sofre de um terrível medo de alturas. Certo dia, encontra com um antigo conhecido,que pede que ele siga sua esposa, Madeleine Elster.Ela demonstra uma estranha atração por lugares altos, levando o detetive a enfrentar seus piores medos.','19580721',7740)
,(6,4,1,'Gladiador','Maximus é um poderoso general romano,amado pelo povo e pelo imperador,que antes de sua morte,desperta a ira de seu filho ao tornar pública a sua predileção em deixar o trono para Maximus.Sedento pelo poder,Commodus mata seu pai,assume a coroa e ordena a morte de Maximus,que consegue fugir.','20000519',9300)
,(6,1,10,'Feitiço do Tempo','Phil, um arrogante meteorologista de um canal de televisão, fica preso em uma espécie de túnel do tempo, condenado a reviver indefinidamente o mesmo dia até que mude suas atitudes','19930212',6060)
,(6,4,3,'Taxi Driver - Motorista de Táxi','O motorista de táxi de Nova York Travis Bickle, veterano da Guerra do Vietnã, reflete constantemente sobre a corrupção da vida ao seu redor e sente-se cada vez mais perturbado com a própria solidão e alienação.','19760322',6780)
,(6,3,2,'Harry e Sally - Feitos Um para o Outro','Harry e Sally vão morar em Nova York,se veem esporadicamente e constroem uma grande amizade ao longo dos anos.Mas,aos poucos,percebem com certo temor que estão apaixonados um pelo outro.','19890714',5760)
,(6,4,10,'Dr. Fantástico','Um general insano que acredita que os comunistas planejam dominar o mundo dá ordens para bombardear a Rússia,iniciando processo de guerra nuclear.Ao mesmo tempo,o presidente e seus assessores do Pentágono tentam desesperadamente parar o processo.','19640720',5700)
,(6,4,8,'Lawrence da Arábia','Graças ao seu conhecimento dos beduínos,o oficial britânico T.E.Lawrence é enviado à Arábia para encontrar o príncipe Faisal e servir de ligação entre árabes e ingleses na luta contra os turcos.Com a ajuda do nativo xerife Ali.','19630204',12780)
,(5,4,3,'O Silêncio dos Inocentes','Clarice Starling, agente novata do FBI, procura por um assassino que ataca mulheres jovens e depois retira suas peles. Para construir o perfil psicológico deste psicopata, recorre à ajuda de um assassino preso que agia de forma semelhante.','19910517',7080)
,(3,4,6,'Tubarão','Um terrível ataque a banhistas é o sinal de que a praia da pequena cidade de Amity, na Nova Inglaterra, virou refeitório de um gigantesco tubarão branco. O chefe de polícia Martin Brody quer fechar as praias, mas o prefeito Larry Vaughn não permite.','19750720',7440)
,(3,4,10,'Clube dos Cinco','Cinco adolescentes do ensino médio cometem pequenos delitos na escola e, como punição, têm que passar o sábado no colégio e escrever uma redação contando o que pensam de si mesmos. O grupo reúne jovens com perfis completamente diferentes.','19850628',5820)
,(10,3,3,'butch Cassidy','Dois amigos inseparáveis, Butch Cassidy e Sundance Kid,lideram o Bando do Buraco na Parede e vivem de assaltar trens e bancos.Quando são caçados por todo o país resolvem ir para a Bolívia.','19690824', 6600)

select * from Video

insert into Elenco
values
	('Elijah Wood', 2, 'https://musicimage.xboxlive.com/catalog/video.contributor.16370800-0200-11db-89ca-0019b92a3933/image?locale=pt-br&target=circle')
	,('Ian McKellen', 2, 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/92/43/17/20198915.jpg')
	,('Liv Tyler', 2, 'https://static1.purepeople.com.br/articles/4/25/32/4/@/244721-liv-tyler-esta-gravida-do-primeiro-624x600-3.jpg')
	,('Viggo Mortensen', 2, 'https://cdn.radiofrance.fr/s3/cruiser-production/2021/05/c6982cde-a148-4da8-9c34-0180023808c1/838_liselotte_sabroe_ritzau_scanpix_afp.jpg')
	,('Sean Astin', 2, 'https://www.famousbirthdays.com/headshots/sean-astin-8.jpg')
	,('Cate Blanchett', 2, 'https://br.web.img3.acsta.net/pictures/19/12/21/00/31/0061615.jpg')
	,('John Rhys-Davies', 2, 'https://images.moviefit.me/p/o/661-john-rhys-davies.jpg')
	,('Bernard Hill', 2, 'https://br.web.img3.acsta.net/pictures/17/11/08/16/37/5202027.jpg')
	,('Christopher Lee', 2, 'https://images.mubicdn.net/images/cast_member/18147/cache-101062-1416454229/image-w856.jpg?size=800x')
	,('Marlon Brando', 2, 'https://1.bp.blogspot.com/-pcV031Gpmfg/VemF3FqOPtI/AAAAAAAALKw/Z3S0q65N2Ow/s1600/marlon-brando.jpg')
	,('Al Pacino', 2, 'https://br.web.img3.acsta.net/c_310_420/pictures/19/03/19/18/33/1337912.jpg')
	,('James Caan', 2, 'https://br.web.img3.acsta.net/pictures/15/06/09/21/29/576102.jpg')
	,('Richard Castellano', 2, 'https://br.web.img3.acsta.net/pictures/19/09/24/19/54/5682825.jpg')
	,('Robert Duvall', 2, 'https://wikiimg.tojsiabtv.com/wikipedia/commons/e/ea/Robert_Duvall_2_by_David_Shankbone_%28cropped%29.jpg')
	,('Sterling Hayden', 2, 'https://br.web.img2.acsta.net/pictures/14/11/06/18/53/563104.jpg')
	,('John Marley', 2, 'https://limaomecanico.com.br/wp-content/uploads/2017/02/john-marley.jpg')
	,('Richard Conte', 2, 'https://br.web.img2.acsta.net/pictures/15/08/19/20/40/079195.jpg')
	,('Diane Keaton', 2, 'https://br.web.img3.acsta.net/c_310_420/pictures/18/07/18/21/04/5918078.jpg')
	,('John Travolta', 2, 'https://s2.glbimg.com/IUc7wLePibqKvugxFs1Q2neXl8Y=/smart/e.glbimg.com/og/ed/f/original/2020/09/19/gettyimages-1197596437.jpg')
	,('Samuel L.Jackson', 2, 'https://static.wikia.nocookie.net/disney/images/b/b5/C0Ec2mTU.jpg/revision/latest?cb=20200518041848&path-prefix=pt-br')
	,('Uma Thurman', 2, 'https://m.media-amazon.com/images/M/MV5BMjMxNzk1MTQyMl5BMl5BanBnXkFtZTgwMDIzMDEyMTE@._V1_UX214_CR0,0,214,317_AL_.jpg')
	,('Ray Liotta', 2, 'https://veja.abril.com.br/wp-content/uploads/2016/11/rayliotta.jpg?quality=70&strip=info&w=396')
	,('Robert De Niro', 2, 'https://br.web.img3.acsta.net/pictures/15/09/16/17/30/201281.jpg')
	,('Joe Pesci', 2, 'https://tramp.com.br/wp-content/uploads/2019/11/joe_pesci-tramp.jpg')
	,('Lorraine Bracco', 2, 'https://br.web.img3.acsta.net/pictures/17/03/27/14/43/183214.jpg')
	,('Paul Sorvino', 2, 'https://br.web.img3.acsta.net/pictures/18/11/23/17/01/1604309.jpg')
	,('Frank Sivero', 2, 'https://images.moviefit.me/p/o/47-frank-sivero.jpg')
	,('Tony Darrow', 2, 'https://nypost.com/wp-content/uploads/sites/2/2013/08/hospital005250-300x300.jpg?quality=80&strip=all&w=300')
	,('Harrison Ford', 2, 'https://exame.com/wp-content/uploads/2021/06/WhatsApp-Image-2021-06-23-at-4.06.21-PM.jpg')
	,('Rutger Hauer', 2, 'https://veja.abril.com.br/wp-content/uploads/2019/07/111rutger-hauer-in-blade-runner.jpg')
	,('Sean Young', 2, 'https://images.moviefit.me/p/o/14398-sean-young.jpg')
	,('Edward James Olmos', 2, 'https://br.web.img2.acsta.net/pictures/15/05/22/22/44/194959.jpg')
	,('Daryl Hannah', 2, 'https://br.web.img3.acsta.net/pictures/15/06/01/17/50/482821.jpg')
	,('Malcolm McDowell', 2, 'https://br.web.img3.acsta.net/c_310_420/pictures/16/01/12/18/57/033554.jpg')
	,('Patrick Magee', 2, 'https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/91/08/45/20128556.jpg')
	,('Sean Connery', 2, 'https://s.rfi.fr/media/display/bb7557aa-1b7e-11eb-a1a6-005056a98db9/65cc5620ddd70541912ff3b27e38c283e06d9e89.jpg')
	,('Peter Jackson', 1, 'https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/92/91/45/20224862.jpg')
	,('Francis Ford Coppola', 1, 'https://radiocaxias.com.br//imagens/novidade/francisfordcoppola-68420.jpg')
	,('Steven Spielberg', 1, 'https://br.web.img2.acsta.net/pictures/16/05/17/11/39/453609.jpg')
	,('Robert Zemeckis', 1, 'https://mlhzuphabiq8.i.optimole.com/AUnRiBM-vWkapRQI/w:1024/h:576/q:90/https://pordentrodatela.com.br/wp-content/uploads/2021/01/robert-zemeckis.jpg')
	,('George Lucas', 1, 'https://static.wikia.nocookie.net/ptstarwars/images/5/5e/Lucas.JPG/revision/latest/top-crop/width/360/height/450?cb=20060504214710')
	,('Irvin Kershner', 1, 'https://m.media-amazon.com/images/M/MV5BMTQyNjk0NTcwMl5BMl5BanBnXkFtZTcwNzAyNDQxNA@@._V1_UY1200_CR141,0,630,1200_AL_.jpg')
	,('Richard Marquand', 1, 'https://static.wikia.nocookie.net/starwars/images/7/78/Marquand.jpg/revision/latest?cb=20111209225016')
	,('J. J. Abrams', 1, 'https://www.tribernna.com/wp-content/uploads/2019/11/jj-abrams.jpg')
	,('Rian Johnson', 1, 'https://br.web.img3.acsta.net/pictures/18/01/04/16/06/2641767.jpg')
	,('Stanley Kubrick', 1, 'https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/85/93/27/19813127.jpeg')
	,('Michael Curtiz', 1, 'https://br.web.img3.acsta.net/pictures/16/07/04/17/12/227439.jpg')
	,('Frank Darabont', 1, 'https://m.media-amazon.com/images/M/MV5BNjk0MTkxNzQwOF5BMl5BanBnXkFtZTcwODM5OTMwNA@@._V1_UY264_CR17,0,178,264_AL_.jpg')
	,('Victor Fleming', 1, 'https://cdn.britannica.com/34/176934-050-31E2C221/Victor-Fleming-Clark-Gable-Vivien-Leigh-Gone.jpg')
	,('Orson Welles', 1, 'https://br.web.img2.acsta.net/pictures/15/09/16/18/25/374696.jpg')

select * from Elenco
-- truncate table Historico_Usuario
insert into Historico_Usuario
values
	 (49, 36, 543)
	,(49, 36, 1543)
	,(42, 39, null)
	,(54, 24, 7433)
	,(2, 13, null)
	,(61, 22, 6450)
	,(24, 38, 6956)
	,(15, 21, 869)
	,(95, 9, 3922)
	,(72, 17, 4553)
	,(91, 12, 3409)
	,(93, 22, 1281)
	,(98, 31, 3858)
	,(39, 34, null)
	,(2, 1, 64)
	,(72, 33, 4316)
	,(47, 2, 701)
	,(37, 9, 9627)
	,(52, 37, null)
	,(71, 27, 5683)
	,(78, 34, 4484)
	,(16, 32, null)
	,(37, 5, 9384)
	,(26, 32, 8850)
	,(24, 43, 657)
	,(97, 6, null)
	,(7, 11, 5920)
	,(97, 12, 3259)
	,(7, 27, 172)
	,(42, 22, 7172)
	,(78, 13, null)
	,(83, 31, 57)
	,(26, 43, 4221)
	,(74, 17, 5890)
	,(53, 12, 4517)
	,(50, 6, null)
	,(83, 28, 6529)
	,(96, 32, 3521)
	,(98, 41, null)
	,(11, 4, 1086)
	,(25, 48, 7502)
	,(22, 24, null)
	,(75, 22, 2639)
	,(5, 36, 2926)
	,(2, 17, 9391)
	,(2, 22, 456)
	,(89, 28, 339)
	,(68, 32, 232)
	,(6, 41, 6920)
	,(75, 43, 8588)
	,(58, 7, 8294)
	,(29, 24, 4341)
	,(85, 16, 7789)
	,(5, 39, null)
	,(9, 39, 9139)
	,(33, 48, 3146)
	,(46, 49, 140)
	,(39, 11, 5747)
	,(72, 29, 3828)
	,(84, 7, 7216)
	,(72, 50, null)
	,(45, 24, 6031)
	,(50, 36, 9229)
	,(47, 7, 1154)
	,(32, 42, 8373)
	,(68, 29, null)
	,(2, 37, 9377)
	,(35, 14, null)
	,(41, 9, 913)
	,(23, 32, 9810)
	,(4, 2, 1951)
	,(5, 17, 8502)
	,(16, 32, 3193)
	,(29, 42, 2586)
	,(44, 50, 891)
	,(27, 3, 4351)
	,(76, 2, 9687)
	,(54, 42, null)
	,(82, 18, 7552)
	,(68, 1, 3124)
	,(64, 13, 1299)
	,(95, 21, null)
	,(93, 13, 5307)
	,(99, 26, 10167)
	,(50, 36, 9667)
	,(63, 46, 3290)
	,(5, 6, 1342)
	,(50, 24, 6179)
	,(92, 26, 1941)
	,(76, 12, 10410)
	,(8, 24, 6549)
	,(2, 33, null)
	,(12, 25, 144)
	,(68, 17, 8614)
	,(92, 39, 5460)
	,(4, 2, 1190)
	,(50, 8, 4956)
	,(39, 31, 9743)
	,(16, 6, 510)
	,(55, 1, null)
	,(97, 8, 160)
	,(53, 45, 283)
	,(33, 26, 796)
	,(33, 25, 4559)
	,(74, 18, 8476)
	,(32, 32, 7671)
	,(6, 44, 5396)
	,(7, 12, 886)
	,(51, 35, 9321)
	,(71, 42, 5634)
	,(78, 29, null)
	,(66, 36, 2002)
	,(79, 19, 80)
	,(48, 36, 5351)
	,(3, 9, 7144)
	,(3, 33, 2725)
	,(11, 42, 5636)
	,(7, 24, 1693)
	,(41, 45, 12)
	,(94, 1, 2233)
	,(16, 32, 7295)
	,(55, 28, 10135)
	,(96, 3, 7032)
	,(62, 27, 2370)
	,(85, 29, 1701)
	,(2, 1, 476)
	,(42, 23, 373)
	,(61, 29, 31)
	,(100, 35, 967)
	,(32, 12, 8953)
	,(25, 43, 3905)
	,(66, 16, 890)
	,(82, 24, 8)
	,(73, 3, 6304)
	,(62, 26, 3180)
	,(32, 12, 9657)
	,(100, 22, null)
	,(89, 26, 5985)
	,(17, 28, 470)
	,(67, 28, 9264)
	,(85, 33, null)
	,(83, 17, 7493)
	,(86, 9, 2927)
	,(7, 9, 5924)
	,(41, 35, 4218)
	,(45, 2, 748)
	,(71, 35, 4990)
	,(19, 15, 9157)
	,(97, 19, 3648)
	,(81, 24, 24)
	,(3, 7, 10067)
	,(78, 44, 4586)
	,(76, 39, 1897)
	,(62, 22, 603)
	,(62, 47, 2378)
	,(31, 24, 34)
	,(16, 36, 5862)
	,(98, 49, 9232)
	,(39, 33, 3736)
	,(98, 43, null)
	,(35, 2, 7456)
	,(50, 1, 396)
	,(62, 32, null)
	,(97, 35, 2489)
	,(92, 5, 730)
	,(41, 29, 4133)
	,(63, 33, 9686)
	,(50, 32, 8297)
	,(22, 3, 1979)
	,(7, 19, 2382)
	,(7, 42, 10014)
	,(22, 12, 4255)
	,(36, 5, 9590)
	,(18, 35, 9167)
	,(100, 12, 340)
	,(31, 4, null)
	,(62, 50, 877)
	,(97, 17, 2070)
	,(7, 42, 4391)
	,(93, 14, 10493)
	,(86, 27, 2639)
	,(62, 45, 9757)
	,(32, 35, 9321)
	,(86, 2, 4927)
	,(49, 22, 10435)
	,(4, 27, 4818)
	,(74, 46, 200)
	,(33, 24, 4254)
	,(14, 5, 4744)
	,(74, 6, 4449)
	,(99, 22, 8961)
	,(92, 16, 1671)
	,(61, 19, 3353)
	,(12, 2, 4257)
	,(100, 37, null)
	,(63, 23, null)
	,(22, 1, 3245)
	,(97, 9, 4077)
	,(99, 26, 689)
	,(85, 23, 333)
	,(46, 28, 5949)
	,(45, 44, 6449)
	,(63, 29, 232)
	,(81, 22, 1555)
	,(13, 31, 9715)
	,(59, 17, 7904)
	,(44, 26, 6987)
	,(54, 26, 1209)
	,(11, 1, 2789)
	,(45, 47, 8679)
	,(9, 38, 9985)
	,(54, 33, 4769)
	,(85, 27, 9417)
	,(35, 50, 614)
	,(79, 21, 6263)
	,(15, 42, null)
	,(48, 22, 2082)
	,(33, 22, 10252)
	,(12, 47, 619)
	,(44, 17, 9118)
	,(34, 8, 7015)
	,(31, 36, 7447)
	,(22, 32, 10206)
	,(46, 38, 8548)
	,(86, 4, 5570)
	,(76, 38, 1041)
	,(53, 48, 184)
	,(68, 49, 5731)
	,(61, 38, 3764)
	,(98, 21, null)
	,(38, 22, 2188)
	,(2, 2, 8901)
	,(24, 24, 7486)
	,(89, 47, 2462)
	,(63, 1, null)
	,(42, 24, 3372)
	,(43, 18, 1942)
	,(97, 46, null)
	,(64, 33, 2160)
	,(12, 35, 10386)
	,(34, 12, 1970)
	,(21, 3, 3693)
	,(59, 42, 867)
	,(69, 26, 2910)
	,(42, 32, 195)
	,(98, 2, null)
	,(88, 12, 3099)
	,(3, 27, 502)
	,(56, 21, 5374)
	,(82, 19, 3844)
	,(63, 6, 411)
	,(73, 28, null)
	,(4, 21, 10219)
	,(31, 41, 6907)
	,(23, 37, 9196)
	,(91, 28, null)
	,(37, 34, 6549)
	,(24, 12, 290)
	,(68, 15, 7586)
	,(13, 33, 7024)
	,(85, 39, 4826)
	,(73, 3, 4261)
	,(49, 34, 997)
	,(32, 47, 6784)
	,(2, 29, 4289)
	,(65, 41, 8636)
	,(19, 32, 9348)
	,(23, 23, 7750)
	,(75, 19, 9522)
	,(29, 2, 2642)
	,(100, 46, 8312)
	,(29, 23, 449)
	,(19, 25, 7286)
	,(46, 21, 568)
	,(17, 2, 7984)
	,(98, 12, 7241)
	,(9, 1, 5403)
	,(91, 47, 74)
	,(79, 31, 3445)
	,(73, 49, 7441)
	,(52, 12, 641)
	,(85, 17, 204)
	,(86, 36, 1124)
	,(35, 23, null)
	,(12, 37, 2442)
	,(98, 3, 4435)
	,(98, 39, 1517)
	,(21, 12, 319)
	,(75, 4, 10464)
	,(77, 26, 217)
	,(72, 23, 5753)
	,(99, 48, 2355)
	,(27, 16, null)
	,(72, 6, 5677)
	,(57, 37, 6182)
	,(22, 39, 2189)
	,(78, 41, 961)
	,(91, 38, 197)
	,(55, 15, 56)
	,(59, 5, 2671)
	,(5, 4, 2172)
	,(25, 32, 10707)
	,(77, 7, 8574)
	,(2, 36, 7935)
	,(71, 13, null)
	,(62, 32, 4961)
	,(46, 27, 3346)
	,(77, 50, 7621)
	,(32, 41, null)
	,(33, 22, 6939)
	,(21, 34, 2394)
	,(46, 34, 256)
	,(32, 16, 1124)
	,(58, 22, 894)
	,(41, 39, 1045)
	,(82, 12, 324)
	,(55, 47, null)
	,(55, 6, 6074)
	,(94, 14, 1229)
	,(50, 48, 8840)
	,(28, 22, 7584)
	,(15, 42, 246)
	,(50, 12, 6346)
	,(63, 14, 3552)
	,(35, 44, 1094)
	,(67, 18, 2259)
	,(61, 24, 6595)
	,(22, 39, 5437)
	,(99, 34, 6021)
	,(66, 26, 4174)
	,(91, 42, 3961)
	,(28, 15, 50)
	,(94, 13, null)
	,(7, 15, null)
	,(91, 47, null)
	,(33, 9, 2722)
	,(46, 13, 10006)
	,(91, 45, 5018)
	,(22, 3, 7096)
	,(22, 8, 1382)
	,(46, 43, 7826)
	,(22, 36, 4982)
	,(97, 3, 6199)
	,(9, 37, 1079)
	,(23, 27, 1947)
	,(65, 16, 9223)
	,(86, 33, 146)
	,(32, 12, 2754)
	,(46, 2, null)
	,(91, 3, 2618)
	,(35, 37, 989)
	,(85, 31, 4862)
	,(23, 35, 2218)
	,(18, 18, 1303)
	,(68, 18, 5731)
	,(83, 34, 3797)
	,(28, 28, 8051)
	,(81, 17, 5486)
	,(65, 8, 81)
	,(47, 37, 7698)
	,(50, 3, 7015)
	,(33, 38, null)
	,(2, 19, 10003)
	,(73, 21, 6586)
	,(65, 34, 3153)
	,(35, 31, 9004)
	,(73, 32, 3588)
	,(59, 31, 5645)
	,(51, 27, 4304)
	,(58, 12, 4848)
	,(82, 38, null)
	,(49, 33, 3302)
	,(12, 17, 6646)
	,(53, 41, 3143)
	,(42, 28, 1457)
	,(13, 7, 7133)
	,(21, 15, 5749)
	,(83, 38, 1163)
	,(38, 47, null)
	,(47, 42, 2208)
	,(62, 21, 1985)
	,(48, 47, 7090)
	,(65, 7, 163)
	,(99, 11, 3034)
	,(22, 9, 8805)
	,(4, 8, 686)
	,(39, 18, 4213)
	,(74, 18, 9745)
	,(92, 49, 195)
	,(86, 5, 38)
	,(87, 33, 528)
	,(41, 47, 4247)
	,(12, 48, 6680)
	,(48, 24, 5753)
	,(65, 11, 739)
	,(25, 32, null)
	,(29, 17, 8236)
	,(38, 4, 5110)
	,(82, 43, 619)
	,(28, 28, 10401)
	,(64, 42, 474)
	,(28, 6, 6135)
	,(77, 41, 2795)
	,(42, 47, 2347)
	,(44, 46, 9422)
	,(39, 4, 1486)
	,(84, 33, 3983)
	,(46, 28, 8346)
	,(98, 24, 6236)
	,(3, 32, 770)
	,(33, 42, 4182)
	,(66, 42, 7532)
	,(96, 18, 1156)
	,(50, 24, 8598)
	,(29, 44, 4376)
	,(55, 47, 1860)
	,(62, 21, null)
	,(92, 22, 9672)
	,(62, 8, 2469)
	,(27, 15, 6890)
	,(100, 37, 2278)
	,(18, 4, 1169)
	,(83, 42, 749)
	,(17, 22, 7855)
	,(3, 17, 1976)
	,(57, 8, 7477)
	,(37, 21, 5950)
	,(42, 22, 1877)
	,(32, 21, 4084)
	,(49, 3, 7194)
	,(47, 34, 621)
	,(47, 25, 8118)
	,(59, 5, 470)
	,(29, 36, 1558)
	,(12, 21, 4644)
	,(4, 45, 1232)
	,(71, 1, 42)
	,(54, 46, 9509)
	,(8, 29, 3161)
	,(3, 45, 7236)
	,(73, 17, 7865)
	,(42, 36, 8139)
	,(67, 28, null)
	,(43, 50, 676)
	,(91, 3, 7690)
	,(41, 15, 129)
	,(19, 13, 5689)
	,(26, 39, 428)
	,(66, 47, 8423)
	,(17, 19, null)
	,(46, 27, 2400)
	,(11, 28, 4068)
	,(42, 35, 72)
	,(23, 18, 3540)
	,(29, 14, 368)
	,(95, 32, 8994)
	,(17, 34, 3060)
	,(28, 43, 741)
	,(14, 23, 6041)
	,(69, 37, 55)
	,(98, 25, 1938)
	,(92, 49, 4744)
	,(84, 42, 5441)
	,(33, 50, 508)
	,(29, 48, null)
	,(22, 49, 5374)
	,(2, 36, 3285)
	,(95, 2, 7576)
	,(64, 9, 551)
	,(62, 49, 1089)
	,(82, 37, 10351)
	,(95, 13, 9495)
	,(14, 19, 3337)
	,(62, 5, 9013)
	,(33, 42, 7449)
	,(68, 50, 9639)
	,(74, 48, 5315)
	,(6, 34, 217)
	,(47, 1, 228)
	,(48, 13, 8575)
	,(74, 12, null)
	,(42, 26, 2843)
	,(65, 17, 7540)
	,(2, 2, 6298)
	,(19, 22, null)
	,(47, 31, 1895)
	,(1, 48, 2051)
	,(81, 43, 291)
	,(61, 38, 478)
	,(94, 24, 501)
	,(39, 34, 1421)
	,(50, 43, 271)
	,(52, 43, null)
	,(1, 47, 3401)
	,(43, 1, null)
	,(19, 37, 9648)
	,(91, 44, 2942)
	,(40, 50, 4409)
	,(31, 23, 3228)
	,(22, 35, null)

select * from Historico_Usuario

insert into Video_Elenco
values
	 (22, 22)
	,(71, 39)
	,(74, 25)
	,(33, 8)
	,(58, 44)
	,(83, 20)
	,(6, 43)
	,(10, 20)
	,(84, 25)
	,(16, 29)
	,(94, 26)
	,(45, 45)
	,(5, 22)
	,(69, 50)
	,(29, 11)
	,(67, 19)
	,(23, 8)
	,(17, 20)
	,(82, 17)
	,(49, 15)
	,(93, 2)
	,(5, 5)
	,(50, 34)
	,(36, 10)
	,(35, 31)
	,(9, 15)
	,(15, 21)
	,(29, 36)
	,(100, 41)
	,(73, 16)
	,(81, 17)
	,(88, 19)
	,(21, 23)
	,(17, 46)
	,(69, 36)
	,(58, 25)
	,(2, 44)
	,(64, 46)
	,(47, 18)
	,(40, 19)
	,(8, 25)
	,(66, 34)
	,(13, 19)
	,(24, 41)
	,(87, 23)
	,(1, 50)
	,(62, 9)
	,(49, 31)
	,(16, 35)
	,(89, 3)
	,(50, 23)
	,(52, 33)
	,(4, 30)
	,(28, 14)
	,(78, 19)
	,(25, 33)
	,(43, 18)
	,(24, 16)
	,(68, 10)
	,(24, 43)
	,(21, 18)
	,(5, 12)
	,(31, 29)
	,(89, 43)
	,(40, 2)
	,(77, 39)
	,(3, 18)
	,(89, 32)
	,(98, 1)
	,(64, 28)
	,(9, 49)
	,(4, 26)
	,(21, 38)
	,(58, 14)
	,(95, 9)
	,(93, 48)
	,(45, 3)
	,(84, 7)
	,(42, 15)
	,(34, 23)
	,(71, 22)
	,(88, 37)
	,(60, 24)
	,(18, 4)
	,(46, 31)
	,(34, 34)
	,(56, 35)
	,(76, 13)
	,(32, 27)
	,(2, 28)
	,(1, 31)
	,(90, 12)
	,(11, 41)
	,(34, 21)
	,(51, 38)
	,(22, 35)
	,(68, 10)
	,(84, 33)
	,(10, 16)
	,(91, 37)
	,(58, 25)
	,(82, 17)
	,(83, 14)
	,(41, 38)
	,(30, 30)
	,(83, 44)
	,(27, 40)
	,(45, 5)
	,(55, 33)
	,(63, 40)
	,(14, 39)
	,(57, 36)
	,(40, 33)
	,(100, 19)
	,(87, 5)
	,(16, 1)
	,(63, 14)
	,(97, 26)
	,(80, 28)
	,(41, 43)
	,(42, 30)
	,(13, 46)
	,(93, 17)
	,(43, 45)
	,(74, 37)
	,(12, 23)
	,(68, 7)
	,(61, 41)
	,(93, 5)
	,(95, 9)
	,(27, 2)
	,(89, 10)
	,(45, 41)
	,(26, 50)
	,(83, 47)
	,(31, 50)
	,(25, 39)
	,(38, 28)
	,(64, 33)
	,(80, 4)
	,(23, 6)
	,(64, 7)
	,(99, 36)
	,(35, 26)
	,(68, 8)
	,(59, 35)
	,(62, 12)
	,(59, 20)
	,(71, 47)
	,(47, 6)
	,(9, 22)
	,(6, 40)
	,(44, 7)
	,(20, 45)
	,(75, 4)
	,(18, 14)
	,(31, 44)
	,(96, 8)
	,(40, 39)
	,(21, 37)
	,(47, 38)
	,(32, 34)
	,(36, 31)
	,(38, 2)
	,(20, 50)
	,(84, 36)
	,(19, 34)
	,(99, 40)
	,(6, 42)
	,(69, 44)
	,(52, 23)
	,(76, 31)
	,(98, 16)
	,(39, 37)
	,(27, 22)
	,(99, 48)
	,(73, 37)
	,(66, 17)
	,(12, 20)
	,(45, 42)
	,(76, 9)
	,(70, 38)
	,(24, 24)
	,(9, 32)
	,(90, 9)
	,(10, 28)
	,(8, 18)
	,(22, 1)
	,(100, 36)
	,(70, 3)
	,(23, 32)
	,(77, 39)
	,(1, 45)
	,(99, 23)
	,(3, 33)
	,(67, 34)
	,(40, 43)
	,(11, 18)
	,(76, 50)
	,(37, 26)
	,(23, 39)
	,(85, 6)
	,(33, 22)
	,(87, 20)
	,(52, 33)
	,(34, 21)
	,(69, 21)
	,(61, 7)
	,(41, 47)
	,(75, 18)
	,(49, 32)
	,(61, 13)
	,(50, 22)
	,(17, 12)
	,(24, 44)
	,(26, 1)
	,(35, 10)
	,(82, 23)
	,(79, 34)
	,(45, 29)
	,(3, 31)
	,(94, 20)
	,(32, 14)
	,(100, 50)
	,(26, 50)
	,(95, 42)
	,(25, 2)
	,(2, 30)
	,(17, 30)
	,(61, 46)
	,(27, 33)
	,(15, 33)
	,(39, 17)
	,(6, 25)
	,(60, 8)
	,(34, 38)
	,(49, 9)
	,(33, 45)
	,(70, 12)
	,(94, 12)
	,(44, 9)
	,(98, 13)
	,(93, 22)
	,(76, 17)
	,(19, 11)
	,(30, 10)
	,(6, 27)
	,(31, 19)
	,(46, 15)
	,(100, 50)

select * from Video_Elenco

insert into Plano_Usuario
values
(1,1,'20210103')
,(2,2,'20221010')
,(3,3,'20230810')
,(4,4,'20211010')
,(5,5,'20210908')
,(1,6,'20221010')
,(2,7,'20221010')
,(3,8,'20221010')
,(4,9,'20221010')
,(5,10,'20221010')
,(1,11,'20221010')
,(2,12,'20221010')
,(3,13,'20221010')
,(4,14,'20221010')
,(5,15,'20221010')
,(1,16,'20221010')
,(2,17,'20221010')
,(3,18,'20221010')
,(4,19,'20221010')
,(5,20,'20221010')
,(1,21,'20221010')
,(2,22,'20221010')
,(3,23,'20221010')
,(4,24,'20221010')
,(5,25,'20221010')
,(1,26,'20221010')
,(2,27,'20221010')
,(3,28,'20221010')
,(4,29,'20221010')
,(5,30,'20221010')
,(1,31,'20221010')
,(2,32,'20221010')
,(3,33,'20221010')
,(4,34,'20221010')
,(5,35,'20221010')
,(1,36,'20221010')
,(2,37,'20221010')
,(3,38,'20221010')
,(4,39,'20221010')
,(5,40,'20221010')
,(1,41,'20221010')
,(2,42,'20221010')
,(3,43,'20221010')
,(4,44,'20221010')
,(5,45,'20221010')
,(1,46,'20221010')
,(2,47,'20221010')
,(3,48,'20221010')
,(5,49,'20221010')
,(1,50,'20221010')

select * from Plano_Usuario

--Relatórios

--Listar a quantidade de filmes para cada faixa etária
select c.id, c.idade_minima, count(distinct v.id) as qtd_Filmes from Video v
join Classificacao c	
	on v.id_classificacao = c.id
group by c.id, c.idade_minima
order by c.id

--Listar a quantidade de filmes que cada publisher possui
select v.id_publisher, p.nome, count(distinct v.id) as qtd_Filmes from Video v
join Publisher p
	on v.id_publisher = p.id
group by v.id_publisher, p.nome
order by v.id_publisher

--Listar o faturamento por plano
select
	pu.id_plano
	,count(pu.id_plano) as qtd
	,sum(pa.preco) as receita
from Plano_Usuario pu
inner join Plano_Assinatura pa
	on pu.id_plano = pa.id
group by pa.id_regiao, pu.id_plano
order by receita, qtd

--Listar os 10 diretores com mais filmes
select top 10
	ve.id_elenco
	,e.nome
	,e.id
	,count(e.id_papel) as qtd
from Video_Elenco ve
inner join Elenco e
	on e.id = ve.id_elenco
	where e.id_papel like (1) -- seleciona somente os diretores
group by e.nome,ve.id_elenco, e.id
order by qtd desc 

--Listar os 10 filmes mais assistidos
select top 10
	h.id_video
	,v.nome
	,v.id
	,count(h.id_video) as qtd_assistida
from Historico_Usuario h
inner join Video v
	on v.id = h.id_video
group by v.nome, v.id, h.id_video
order by qtd_assistida desc 

--Listar os 3 gêneros mais assistidos
select top 3
	g.id
	,g.nome 
	,count(v.id_genero) as qtd_Assistido 
	from Video v
join Historico_Usuario h
	on h.id_video = v.id
join Genero g
	on v.id_genero = g.id
group by g.id, g.nome
order by g.id desc


--Listar os 5 filmes com menor indice de retenção, que é quando começam a assistir e param 
--(usar o os filmes com menor qtdAssistidos)
select top 5
	 h.id_video
	,h.qtdSegundosAssistidos
	,v.nome
	,h.id as id_hist
from Historico_Usuario h
join Video v
	on v.id = h.id_video
	where qtdSegundosAssistidos is not null
group by v.nome, h.id_video, h.qtdSegundosAssistidos, h.id
order by qtdSegundosAssistidos asc

--Listar os 5 filmes com maior indice de retenção, que é quando começam a assistir e terminam
--(usar o os filmes com o maior qtdSegundosAssistidos ou se ele for nulo, considerar a duracao do video)
select top 5
	 h.id_video
	,h.qtdSegundosAssistidos
	,h.id as id_hist
	,v.nome
	,v.duracao_segundos
from Historico_Usuario h
join Video v
	on v.id = h.id_video
	where qtdSegundosAssistidos is null or qtdSegundosAssistidos > 9000
group by v.nome, h.id_video, h.qtdSegundosAssistidos, v.duracao_segundos, h.id
order by h.qtdSegundosAssistidos desc, v.duracao_segundos desc

--Listar os 10 atores com mais filmes
select top 10
    ve.id_elenco
    ,e.nome
    ,e.id
    ,count(e.id_papel) as qtd
from Video_Elenco ve
inner join Elenco e
    on e.id = ve.id_elenco
    where e.id_papel like (2) -- seleciona somente os atores
group by e.nome,ve.id_elenco, e.id
order by qtd desc 

-- Listar todos os filmes com sua classificacao e idade minima
select v.nome, c.id, c.idade_minima from Video v
join Classificacao c
	on v.id_classificacao = c.id
order by idade_minima

--Listar a quantidade de generos produzidos por cada publisher
select p.nome, p.id, count(distinct g.id) as qtd_genero from Video v
join Publisher p
	on v.id_publisher = p.id
join Genero g
	on v.id_genero = g.id
group by p.nome, p.id
order by p.id

--Listar publishers ordenados por data de fim do contrato mais proximas (menores)
select * from Publisher
order by dt_fim_contrato asc



