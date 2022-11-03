-- integrantes:
-- Kaio Gomes;
-- João Vitor;
-- Arthur Renan;
-- Gustavo Souza;
-- Levi Ribeiro;
-- Luiz Felipe;
-- Rodrigo barreto; 

drop database if exists dbDix;

create database dbDix;

use dbDix;

--------------------------------------------------------------------------------------- TABELAS ---------------------------------------------------------------------------------------------------
create table Telefone(
	Tel_Id int primary key auto_increment,
    Tel_Num varchar(20) not null unique,
    Tel_Tipo varchar(30) not null
);
create table Estado(
	Estado_Id int primary key auto_increment,
    Estado_Nome varchar(50) not null
);
create table Cidade(
	Cidade_Id int primary key auto_increment,
    Cidade_Nome varchar(50) not null
);
create table Bairro(
	Bairro_Id int primary key auto_increment,
    Bairro_Nome varchar(100) not null
);
create table Endereco(
	Cep varchar(8) primary key,
    Estado_Id int not null,
    Cidade_Id int not null,
    Bairro_Id int not null,
    Logradouro varchar(50) not null,
    Num_Res int,
    Complemento varchar (255),
    
    constraint Endereco_c_Bairro
    foreign key (Bairro_Id) references Bairro (Bairro_Id),
    
    constraint Cidade_c_Estado
    foreign key (Estado_Id) references Estado (Estado_Id),
    
    constraint Bairro_c_Cidade
    foreign key (Cidade_Id) references Cidade (Cidade_Id)
);

	

create table Categoria(
	Categ_Id int primary key auto_increment,
    Categ_Nome varchar(50) not null
);                      
create table Produto(
	Prod_Cod int primary key not null auto_increment,
    Categ_Id int not null,
    Prod_Nome varchar (100) not null,
    Prod_Garant date not null,
    Prod_Val double not null,
    Prod_QuantEstoq int (10) not null,
    Prod_Img varchar (500),
    -- FK
    constraint Prod_c_Categ
    foreign key (Categ_Id) references Categoria (Categ_Id)
);

create table Cliente(
	Cli_Id int primary key not null auto_increment,
    Cep varchar(8) not null,
    Tel_id int not null,
    Cli_Nome varchar(200) not null,
    Cli_NomeSoc varchar(200) not null,
    Cli_Email varchar(200) not null,
    Cli_Senha varchar(100) not null,
    Cli_DataNasc date not null,
    Cli_Cpf varchar(20) not null,
    Cli_Sexo varchar(1) not null,
     -- FK
	constraint Cli_c_Endereco
	foreign key (Cep) references Endereco (Cep),
    constraint Cli_c_Tel
    foreign key (Tel_Id) references Telefone (Tel_Id)
);
create table Pedido(
	Ped_Cod int primary key not null auto_increment,
    Prod_Cod int not null,
	Cli_Id int not null,
    Ped_valor double not null,
    -- FK
	constraint Ped_c_Prod
    foreign key (Prod_Cod) references Produto (Prod_Cod),
    constraint Ped_c_Cli
    foreign key (Cli_Id) references Cliente (Cli_Id)
);
create table Delivery(
	Deliv_Cod int primary key not null auto_increment,
    Ped_Cod int not null,
	Cep varchar(8) not null,
    Deliv_Data date not null, 
    -- FK
    constraint Deliv_c_Ped
    foreign key (Ped_Cod) references Pedido (Ped_Cod),
	constraint Deliv_c_Endeco
	foreign key (Cep) references Endereco (Cep)
);
create table Devolucao(
	Devol_Cod int primary key not null auto_increment,
    Ped_Cod int not null,
    Deliv_Cod int not null,
	Devol_ValReem double not null,
    -- FK
    constraint Devol_c_Ped
    foreign key (Ped_Cod) references Pedido (Ped_Cod),
    constraint Devol_c_Deliv
    foreign key (Deliv_Cod) references Delivery (Deliv_Cod)
);

create table Pagamento(
	Pagto_Cod int primary key not null auto_increment,
    Cli_Id int not null,
    Pagto_Tipo varchar(50) not null,
    -- FK
	constraint Pagto_c_Cli
    foreign key (Cli_Id) references Cliente (Cli_Id)
);
create table Funcionario(
	Func_Id int primary key auto_increment,
    Func_Nome varchar(200) not null,
    Func_NomeSoc varchar(200) not null,
    Func_Cargo varchar(50) not null,
    Func_DataNasc date not null,
    Tel_Id int not null,
    Cep varchar(8) not null,
    Func_Cpf varchar(20) not null,
    Func_Email varchar(200) not null,
	Func_Senha varchar(100) not null,
    Func_Sexo varchar(1) not null,
    
    -- FK
    constraint Func_c_Tel
    foreign key (Tel_Id) references Telefone (Tel_Id),
    constraint Func_c_Endeco
	foreign Key (Cep) references Endereco (Cep)
);
create table Venda(
	Venda_Cod int primary key auto_increment,
    Ped_Cod int not null,
    Func_Id int not null,
    Pagto_Cod int not null,
    -- FK
    constraint Vend_c_Ped
    foreign key (Ped_Cod) references Pedido (Ped_Cod),
    constraint Vend_c_Pagto
    foreign key (Pagto_Cod) references Pagamento (Pagto_Cod),
    constraint Vend_c_Func
    foreign key (Func_Id) references Funcionario (Func_Id)
);
 --------------------------------------------------------------------------------- PROCEDURES ADICIONAR (ADD) ---------------------------------------------------------------------------------------------------
-- insert dos estados
insert into Estado (Estado_Id, Estado_Nome)
			values (default,'AC'), (default,'AL'), (default,'AP'), (default,'AM'), (default,'BA'), (default,'CE'),
                   (default,'DF'), (default,'ES'), (default,'GO'), (default,'MA'), (default,'MT'),
				   (default,'MG'), (default,'PA'), (default,'PB'), (default,'PR'), (default,'PE'),
				   (default,'PI'), (default,'RJ'), (default,'RN'), (default,'RS'), (default,'RO'),
				   (default,'RR'), (default,'SC'), (default,'SP'), (default,'SE'), (default,'TO');                  

$$
-- Cidade
delimiter $$
create procedure addCidade (vCidadeNome varchar(50)) -- Nome da cidade e o id do estado
begin insert into Cidade (Cidade_Nome)
				  values (vCidadeNome);
end;
$$

-- Bairro 
delimiter $$
create procedure addBairro (vBaiNome varchar(100)) -- Nome da bairro e o id da cidade
begin insert into Bairro (Bairro_Nome)
				  values (vBaiNome);
end;
$$

-- Endereco
delimiter $$ 

-- Cep, Id do estado, id da cidade, id do bairro, logradouro, numero da residencia, complemento
create procedure addEndereco(pCep varchar(8), vEstadoId int ,vCidadeId int, pBairroId int, pLog varchar(50), pNumRes int, pComplemento varchar(255))
begin insert into Endereco (Cep, Estado_Id, Cidade_Id, Bairro_Id, Logradouro, Num_Res, Complemento)
				  Values (pCep, vEstadoId, vCidadeId, pBairroId, pLog, pNumRes, pComplemento);
end;
$$

-- Categoria
delimiter $$
create procedure addCategoria (pCategNome varchar(50))
begin insert into Categoria(Categ_Nome)
				values(pCategNome);
end;
$$

-- Id da Categoria do Produto, Nome do Produto, Garantia do Produto, Valor do Produto, Quantidade do Produto em Estoque, Imagem do Produto

delimiter $$
create procedure addProduto (pCategId int,pProdNome varchar (100), pProdGarant date, pProdVal double, pProdQuantEstoq int (10), pProdImg varchar (200))
begin
	insert into Produto (Categ_Id, Prod_Nome, Prod_Garant, Prod_Val, Prod_QuantEstoq, Prod_Img)
				 values (pCategId, pProdNome, pProdGarant, pProdVal, pProdQuantEstoq, pProdImg);
end;
$$

-- Nome do Cliente, Email do Cliente, Senha do Cliente, CPF do Cliente, Idade do Cliente, CEP do Cliente;
delimiter $$
create procedure addCliente (pCliCep varchar(8), pIdTel int, pCliNome varchar(200), pCliNomeSoc varchar(200), pCliEmail varchar(200), pCliSenha varchar(100),pDataNasc date, 
							 pCliCpf varchar(20), pSexo varchar(1))
begin
	insert into CLiente (Cep, Tel_id, Cli_Nome, Cli_NomeSoc, Cli_Email, Cli_Senha, Cli_DataNasc, Cli_Cpf, Cli_Sexo)
				Values (pCliCep, pIdTel, pCliNome, pCliNomeSoc, pCliEmail, pCliSenha, pDataNasc, pCliCpf, pSexo);
end;	
$$




-- Valor do Pedido, ID do Produto, ID do Cliente;
delimiter $$
create procedure addPedido (pProdCod int, pCliId int, pPedvalor double)
begin
	insert into Pedido (Prod_Cod, Cli_Id, Ped_valor)
		 values (pProdCod, pCliId, pPedvalor);
end;
$$ 

-- Código do pedido, Cep onde vai ser entregue, data do delivery
delimiter $$
create procedure addDelivery (pPedCod int, pCep varchar(8), pDelivData date)
begin
	insert into Delivery (Ped_Cod, Cep, Deliv_Data)
				  values (pPedCod, pCep, pDelivData);
end;
$$


-- Código do pedido, Código do delivery, Valor a ser reembolsado
delimiter $$
create procedure addDevolucao (pPedCod int,  pDelivCod int, pDevolValorReem double)
begin 
	insert into Devolucao (Ped_Cod, Deliv_Cod, Devol_ValReem)
			       values (pPedCod, pDelivCod, pDevolValorReem);
end;
$$

-- Tipo de Pagamento, ID do Cliente;
delimiter $$
create procedure addPagamento (pCliId int, pPagtoTipo varchar(50))
begin
	insert into Pagamento (Cli_Id, Pagto_Tipo)
				   values (pCliId, pPagtoTipo);
end;
$$

-- Nome do Funcionário, Cargo do Funcionário, Data de Nascimento do Funcionário, Telefone do Funcionário, CPF do Funcionário, Email do Funcionário, Senha do Funcionário, Sexo do Funcionário;
delimiter $$
create procedure addFuncionario (pFuncNome varchar(200), pFuncNomeSoc varchar(200), pFuncCargo varchar(50), pFuncDataNasc date, pTelId int, pCep varchar(8), pFuncCpf varchar(20),
						pFuncEmail varchar(200), pFuncSenha varchar(100), pFuncSexo varchar(1))
begin
	insert into Funcionario (Func_Nome, Func_NomeSoc, Func_Cargo, Func_DataNasc, Tel_Id, Cep, Func_Cpf, Func_Email, Func_Senha, Func_Sexo)
					 values (pFuncNome, pFuncNomeSoc, pFuncCargo, pFuncDataNasc, pTelId, pCep, pFuncCpf, pFuncEmail, pFuncSenha, pFuncSexo);
end;
$$

-- ID do Pedido, ID do Funcionário, ID do Pagamento;
delimiter $$
create procedure addVenda (pPedCod int, pFuncId int, pPagtoCod int)
begin
	insert into Venda (Ped_Cod, Func_Id, Pagto_Cod)
			   values (pPedCod, pFuncId, pPagtoCod);
end;
$$

-- Número do Telefone, Tipo de Telefone;
delimiter $$
create procedure addTelefone (pTelNum varchar(20), pTelTipo varchar(30))
begin
	insert into Telefone (Tel_Num, Tel_Tipo)
			      values (pTelNum, pTelTipo);
end;
$$



------------------------------------------------------------------------------ PROCEDURES ATUALIZAR (UP) ---------------------------------------------------------------------------------------------------
-- Estados;
delimiter $$
create procedure listEstado ()
begin
	select * from Estado;
end;
$$

-- Cidade
delimiter $$
create procedure upCidade (vCidadeNome varchar(50), vCidadeId int) -- Nome da cidade e o id do estado
begin 
		update Cidade set Cidade_Nome = vCidadeNome where Cidade_Id = vCidadeId;
end;
$$


-- Bairro 
-- Oque vai ser mudado: Id da Cidade, Nome do bairro => Id do bairro
delimiter $$
create procedure upBairro (vBaiNome varchar(100), vBaiId int) -- Nome da bairro e o id da cidade
begin                   
	update Bairro set Bairro_Nome = vBaiNome where Bairro_Id = vBaiId;
end;
$$

-- Endereco
delimiter $$ 
 
-- Nome da cidade, Id do Estado, Nome do Bairro, Id da Cidade, Cep, Logradouro, Id do Bairro;
create procedure upEndereco(vEstadoId int, vCidadeId int, pBairroId int, pLog varchar(50), pNumRes int, pComplemento varchar(255),pCep varchar(8))
begin 
	update Endereco set Estado_Id = vEstadoId, Cidade_Id = vCidadeId, Bairro_Id = pBairroId, Logradouro = pLog, Num_Res = pNumRes, Complemento = pComplemento where Cep = pCep;
                  
end;
$$

-- Categoria
delimiter $$
create procedure upCategoria (pCategNome varchar(50), pCategoriaId int)
begin 
	update Categoria set Categ_Nome = pCategNome where Categ_Id = pCategoriaId;
end;
$$

-- Id da Categoria do Produto, Nome do Produto, Garantia do Produto, Valor do Produto, Quantidade do Produto em Estoque, Imagem do Produto

delimiter $$
create procedure upProduto (pCategId int,pProdNome varchar (100), pProdGarant date, pProdVal double, pProdQuantEstoq int (10), pProdImg varchar (200), pProdCod int)
begin
	update Produto set Categ_Id = pCategId, Prod_Nome = pProdNome, Prod_Garant = pProdGarant, Prod_Val = pProdVal, Prod_QuantEstoq = pProdQuantEstoq, Prod_Img = pProdImg where Prod_Cod = pProdCod;
end;
$$

-- Nome do Cliente, Email do Cliente, Senha do Cliente, CPF do Cliente, Idade do Cliente, CEP do Cliente;
-- Oque vai ser mudado: Cep, Id do telefone, Nome do cliente, Nome social do cliente, 
delimiter $$
create procedure upCliente (pCliCep varchar(8), pIdTel int, pCliNome varchar(200), pCliNomeSoc varchar(200), pCliEmail varchar(200), pCliSenha varchar(100),pDataNasc date, 
							pCliCpf varchar(20), pSexo varchar(1), pCliId int)
begin
	update CLiente set Cep = pCliCep, Tel_Id = pIdTel, Cli_Nome = pCliNome, Cli_NomeSoc = pCliNomeSoc, Cli_Email = pCliEmail, Cli_Senha = pCliSenha, 
    Cli_DataNasc = pDataNasc, Cli_Cpf = pCliCpf, Cli_Sexo = pSexo where Cli_Id = pCliId;
end;	
$$
call upCliente



-- Valor do Pedido, ID do Produto, ID do Cliente;

delimiter $$
create procedure upPedido (pProdCod int, pCliId int, pPedValor double, pPedCod int)
begin
	update Pedido set Prod_Cod = pProdCod, Cli_Id = pCliId, Ped_valor = pPedValor where Ped_Cod = pPedCod;      
end;
$$ 

-- Código do pedido, Cep onde vai ser entregue, data do delivery

delimiter $$
create procedure upDelivery (pPedCod int, pCep varchar(8), pDelivData date, pDelivCod int)
begin
	update Delivery set Ped_Cod = pPedCod, Cep = pCep, Deliv_Data = pDelivData where Deliv_Cod = pDelivCod;
end;
$$


-- Código do pedido, Código do delivery, Valor a ser reembolsado

delimiter $$
create procedure upDevolucao (pPedCod int,  pDelivCod int, pDevolValorReem double, pDevolCod int)
begin 
	update Devolucao set Ped_Cod = pPedCod, Deliv_Cod = pDelivCod, Devol_ValReem = pDevolValorReem where Devol_Cod = pDevolCod;
end;
$$

-- Tipo de Pagamento, ID do Cliente;

delimiter $$
create procedure upPagamento (pCliId int, pPagtoTipo varchar(50), pPagtoCod int)
begin
	update Pagamento set Cli_Id = pCliId, Pagto_Tipo = pPagtoTipo where Pagto_Cod = pPagtoCod;
end;
$$

-- Nome do Funcionário, Cargo do Funcionário, Data de Nascimento do Funcionário, Telefone do Funcionário, CPF do Funcionário, Email do Funcionário, Senha do Funcionário, Sexo do Funcionário;

delimiter $$
create procedure upFuncionario (pFuncNome varchar(200), pFuncNomeSoc varchar(200), pFuncCargo varchar(50), pFuncDataNasc date, pTelId int, pCep varchar(8), pFuncCpf varchar(20),
						pFuncEmail varchar(200), pFuncSenha varchar(100), pFuncSexo varchar(1), pFuncId int)
begin
	update Funcionario set Func_Nome = pFuncNome, Func_NomeSoc = pFuncNomeSoc, Func_Cargo = pFuncCargo, Func_DataNasc = pFuncDataNasc, 
	   				       Tel_Id =  pTelId, Cep = pCep, Func_Cpf = pFuncCpf, Func_Email = pFuncEmail, Func_Senha = pFuncSenha, Func_Sexo = pFuncSexo
                           where Func_Id = pFuncId;
end;
$$

-- ID do Pedido, ID do Funcionário, ID do Pagamento;
delimiter $$
create procedure upVenda (pPedCod int, pFuncId int, pPagtoCod int, pVendaCod int)
begin
	update Venda set Ped_Cod = pPedCod, Func_Id = pFuncId, Pagto_Cod = pPagtoCod where Venda_Cod = pVendaCod;
end;
$$

-- Número do Telefone, Tipo de Telefone;
delimiter $$
create procedure upTelefone (pTelNum varchar(20), pTelTipo varchar(30), pTelId int)
begin
	update Telefone set Tel_Num = pTelNum, Tel_Tipo = pTelTipo where Tel_Id = pTelId;
end;
$$

--------------------------------------------------------------------------------- PROCEDURES LISTAR (LIST) ---------------------------------------------------------------------------------------------------
-- Cidade
delimiter $$
create procedure listCidade()
begin 
	select * from Cidade;
end;
$$

-- Bairro 
delimiter $$
create procedure listBairro()
begin                   
	select * from Bairro;
end;
$$

-- Endereco
delimiter $$ 
create procedure listEndereco()
begin 
	select * from Endereco;
end;
$$

-- Categoria
delimiter $$
create procedure listCategoria ()
begin 
	select * from Categoria;
end;
$$

delimiter $$
create procedure listProduto ()
begin
	select * from Produto;
end;
$$

-- Cliente
delimiter $$
create procedure listCliente ()
begin
	select * from Cliente;
end;	
$$
call upCliente

-- Pedido
delimiter $$
create procedure listPedido ()
begin
	select * from Pedido;
end;
$$ 

-- Delivery
delimiter $$
create procedure listDelivery ()
begin
	select * from Delivery;
end;
$$

-- Devolucao
delimiter $$
create procedure listDevolucao ()
begin 
		select * from Devolucao;
end;
$$

-- Pagamento
delimiter $$
create procedure listPagamento ()
begin
		select * from Pagamento;
end;
$$

-- Funcionário
delimiter $$
create procedure listFuncionario ()
begin
	select * from Funcionario;
end;
$$

-- ID do Pedido, ID do Funcionário, ID do Pagamento;
delimiter $$
create procedure listVenda ()
begin
	select * from Venda;
end;
$$

-- Número do Telefone, Tipo de Telefone;
delimiter $$
create procedure listTelefone ()
begin
	select * from Telefone;
end;
$$


--------------------------------------------------------------------------------- PROCEDURES EXCLUIR (DEL) ----------------------------------------------------------------------------------------------------- Cidade
-- Cidade
delimiter $$
create procedure delCidade (vCidadeId int)
begin 
	delete from Cidade where Cidade_Id = vCidadeId;
end;
$$

-- Bairro 
delimiter $$
create procedure delBairro (vBaiId int)
begin                   
	delete from Bairro where Bairro_Id = vBaiId;
end;
$$

-- Endereco
delimiter $$ 
create procedure delEndereco(pCep varchar(8))
begin 
	delete from Endereco where Cep = pCep;
end;
$$

-- Categoria
delimiter $$
create procedure delCategoria (pCategoriaId int)
begin 
		delete from Categoria where Categ_Id = pCategoriaId;
end;
$$

-- Produto
delimiter $$
create procedure delProduto (pProdCod int)
begin
		delete from Produto where Prod_Cod = pProdCod;
end;
$$

-- Cliente
delimiter $$
create procedure delCliente (pCliId int)
begin
	delete from Cliente where Cli_Id = pCliId;
end;	
$$
call upCliente

-- Pedido
delimiter $$
create procedure delPedido (pPedCod int)
begin
	delete from Pedido where Ped_Cod = pPedCod;   
end;
$$ 

-- Delivery
delimiter $$
create procedure delDelivery (pDelivCod int)
begin
	delete from Delivery where Deliv_Cod = pDelivCod;
end;
$$

-- Devolucao
delimiter $$
create procedure delDevolucao (pDevolCod int)
begin 
	delete from Devolucao where Devol_Cod = pDevolCod;
end;
$$

-- Pagamento
delimiter $$
create procedure delPagamento (pPagtoCod int)
begin
	delete from Pagamento where Pagto_Cod = pPagtoCod;
end;
$$

-- Funcionario
delimiter $$
create procedure delFuncionario (pFuncId int)
begin
	delete from Funcionario where Func_Id = pFuncId;
end;
$$

-- Venda
delimiter $$
create procedure delVenda (pVendaCod int)
begin
	delete from Venda where Venda_Cod = pVendaCod;
end;
$$

-- Telefone
delimiter $$
create procedure delTelefone (pTelId int)
begin
	delete from Telefone where Tel_Id = pTelId;
end;
$$
