#Comentário
 /*
	Comentário em bloco
 */
 
 #Cria um database novo no BD
 create database dbFilmesTurmaB;
 
 #Permite visualizar os databases existentes no BD
 show databases;
 
#Permite apagar um database no BD
 #drop database dbFilmesTurmaB;
 
 #Seleciona o database a ser utilizado
 use dbFilmesTurmaB;

#Cria uma tabela e seus atributos
create table tblClassificacao(
	idClassificacao int not null auto_increment primary key,
    nome varchar(20) not null,
    unique index(idClassificacao)
);

#Permite visualizar as tabelas existentes no DB
show tables;

create table tblSexo(
	idSexo int not null auto_increment,
    nome varchar(10) not null,
    primary key(idSexo),
    unique index (idSexo)
);

#Permite visualizar a descrição da estrutura da tabela
desc tblSexo;

#Tabela Genero
create table tblGenero (
	idGenero int not null auto_increment primary key,
	nome varchar(30) not null,
	unique index(idGenero)
);

#Tabela de Estudio
create table tblEstudio (
	idEstudio int not null auto_increment primary key,
	nome varchar(50) not null,
	unique index(idEstudio)
);

#Tabela de nacionalidade
create table tblNacionalidade (
	idNacionalidade int not null auto_increment primary key,
	nome varchar(20) not null,
	unique index (idNacionalidade)
);

#Tabela de filme
create table tblFilme(
	idFilme int not null auto_increment primary key,
	nome varchar(80) not null,
	nomeOriginal varchar(80),
	duracao time not null,
	dataLancamento date not null,
	dataRelancamento date not null,
	sinopse text not null,
	fotoCapa varchar(80),
	idClassificacao int not null,
	constraint FK_Classificacao_Filme #Define um nome para o Relacionamento
	foreign key (idClassificacao) #Especifica quem será a FK nesta tabela
	references tblClassificacao (idClassificacao), #Especifica de qual tabela virá a PK
	unique index (idFilme)
);

#Tabela de Diretor
create table tblDiretor (
	idDiretor int not null auto_increment primary key,
	nome varchar(80) not null,
	dataNascimento date not null,
	nomeArtistico varchar (80),
	biografia text,
	foto varchar (80),
	idSexo int not null,
	constraint FK_Sexo_Diretor foreign key (idSexo) references tblSexo (idSexo),
	unique index (idDiretor)
);

#Tabela Filme Diretor

create table tblFilmeDiretor (
	idFilmeDiretor int not null auto_increment primary key,
	idFilme int not null,
    idDiretor int not null,
	constraint FK_Filme_FilmeDiretor
	foreign key (idFilme)
	references tblFilme (idFilme),

	#Relacionamento com Diretor
    constraint FK_Diretor_FilmeDiretor
    foreign key (idDiretor)
    references tblDiretor (idDiretor),
    
    unique index (idFilmeDiretor)
);

#Tabela Ator
create table tblAtor (
	idAtor int not null auto_increment primary key,
    nome varchar(80),
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    idSexo int not null,
    unique index (idAtor)
);

desc tblAtor;

#Alterando a estrutura de uma tabela
#modify column - Permite alterar as propriedades de um atributo
alter table tblAtor 
   modify column nome varchar(80) not null;
    
#change -> Alterar nome de uma coluna da Tabela
   alter table tblAtor change column dataNasc dataNascimento  date not null;
   
   
## add colunm -> permite adicionar um novo atributo   
alter table tblAtor
    add column foto varchar(80);  
    
desc tblAtor;

## add constraint -> permite adicionar um relacionamento em uma tabela ja existente
alter table tblAtor
     add constraint FK_Sexo_Ator
     foreign key (idSexo)
     references tblSexo (idSexo);

## drop column -> permite apagar um atributo
alter table tblAtor
   drop column idSexo;

## drop foreign key -> permite apagar o relacionamento 
alter table tblAtor
   drop foreign key FK_Sexo_Ator;  
   
desc tblAtor;

alter table tblAtor
     add column idSexo int not null,
     add constraint FK_Sexo_Ator
		 foreign key (idSexo)
		 references tblSexo(idSexo);
         
desc tblAtor;
         
