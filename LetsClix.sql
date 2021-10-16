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