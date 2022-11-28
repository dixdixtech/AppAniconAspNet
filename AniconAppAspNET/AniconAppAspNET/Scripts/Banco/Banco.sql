drop database if exists dbdix;
create database dbdix;
use dbdix;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------| TABELAS |-------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
drop database if exists dbdix;
create database dbdix;
use dbdix;

create table Estado(
  Estado_Id int primary key auto_increment,
  Estado_Nome varchar(2) not null
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
  Cep varchar(9) primary key,
  Estado_Id int not null,
  Cidade_Id int not null,
  Bairro_Id int not null,
  Logradouro varchar(50) not null,
  Num_Res int,
  Complemento varchar (255),
  -- FK
  constraint Endereco_c_Bairro
  foreign key (Bairro_Id) references Bairro (Bairro_Id),
  constraint Cidade_c_Estado
  foreign key (Estado_Id) references Estado (Estado_Id),
  constraint Bairro_c_Cidade
  foreign key (Cidade_Id) references Cidade (Cidade_Id)
);

create table Telefone(
	Tel_Id int primary key auto_increment,
    Tel_Num varchar(20) not null unique
);
	
create table Funcionario(
	Func_Cpf varchar(14) primary key,
    Func_Nome varchar(200) not null,
    Func_NomeSoc varchar(200),
    Func_Cargo varchar(50) not null,
    Func_DataNasc DATETIME not null,
    Tel_Id int not null,
    Cep varchar(9) not null,
    Func_Email varchar(200) not null,
	Func_Senha varchar(100) not null,
    Func_Sexo varchar(1) not null,
    -- FK
    constraint Func_c_Tel
    foreign key (Tel_Id) references Telefone (Tel_Id),
    constraint Func_c_Endeco
	foreign Key (Cep) references Endereco (Cep)
);
create table Cliente(
	Cli_Cpf varchar(14) primary key,
    Cep varchar(9) not null,
    Tel_id int not null,
    Cli_Nome varchar(200) not null,
    Cli_NomeSoc varchar(200),
    Cli_Email varchar(200) not null,
    Cli_Senha varchar(100) not null,
    Cli_DataNasc DATETIME not null,
    Cli_Sexo varchar(1) not null,
     -- FK
	constraint Cli_c_Endereco
	foreign key (Cep) references Endereco (Cep),
    constraint Cli_c_Tel
    foreign key (Tel_Id) references Telefone (Tel_Id)
);

create table Categoria(
	Categ_Id int primary key auto_increment,
    Categ_Nome varchar(50) not null
);                      
create table Produto(
	Prod_Cod int primary key not null auto_increment,
    Categ_Id int not null,
    Prod_Nome varchar (100) not null,
    Prod_Garant DATETIME not null,
    Prod_Val double not null,
    Prod_QuantEstoq int (10) not null,
    Prod_Descri varchar(1500) not null,
    Prod_Img varchar (500),
    -- FK
    constraint Prod_c_Categ
    foreign key (Categ_Id) references Categoria (Categ_Id)
);
create table Pedido(
	Ped_Cod int primary key not null auto_increment,
    Prod_Cod int not null,
	Cli_Cpf varchar (14) not null,
    Ped_Quant int not null,
    Ped_valor double not null,
    Ped_Data DATETIME not null,
    Ped_Status varchar(20),
    -- FK
	constraint Ped_c_Prod
    foreign key (Prod_Cod) references Produto (Prod_Cod),
    constraint Ped_c_Cli
    foreign key (Cli_Cpf) references Cliente (Cli_Cpf)
);
create table Delivery(
	Deliv_Cod int primary key not null auto_increment,
    Ped_Cod int not null,
	Cep varchar(9) not null,
    Deliv_Data DATETIME not null, 
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
    Devol_Data DATETIME not null,
	Devol_ValReem double not null,
    -- FK
    constraint Devol_c_Ped
    foreign key (Ped_Cod) references Pedido (Ped_Cod),
    constraint Devol_c_Deliv
    foreign key (Deliv_Cod) references Delivery (Deliv_Cod)
);
create table Pagamento(
	Pagto_Cod int primary key not null auto_increment,
    Cli_Cpf varchar(14) not null,
    Ped_Cod int not null,
    Pagto_Total double not null,
    Pagto_Tipo varchar(50) not null,
    -- FK
	constraint Pagto_c_Cli
    foreign key (Cli_Cpf) references Cliente (Cli_Cpf),
    constraint Pagto_c_Ped
    foreign key (Ped_Cod) references Pedido (Ped_Cod)
);
create table Venda(
	Nota_Fiscal int primary key auto_increment,
    Ped_Cod int not null,
    Pagto_Cod int not null,
    Venda_Val double not null,
    -- FK
    constraint Vend_c_Ped
    foreign key (Ped_Cod) references Pedido (Ped_Cod),
    constraint Vend_c_Pagto
    foreign key (Pagto_Cod) references Pagamento (Pagto_Cod)
);

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------| PROCEDURE ADICIONAR (ADD) |---------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
create procedure addTelefone (pTelNum varchar(20))
begin
	insert into Telefone (Tel_Num)
			      values (pTelNum);
end;
$$
              

Delimiter $$
create procedure addCidade (vCidadeNome varchar(50)) -- Nome da cidade e o id do estado
begin insert into Cidade (Cidade_Nome)
				  values (vCidadeNome);
end;
$$
Delimiter $$
create procedure addBairro (vBaiNome varchar(100)) -- Nome da bairro e o id da cidade
begin insert into Bairro (Bairro_Nome)
				  values (vBaiNome);
end;
$$
Delimiter $$ 
create procedure addEndereco(vCEP varchar(9),vEstado char(2),vCidade varchar(200),vBairro varchar(200),vLogradouro varchar(200),vNumRes int,vComplemento varchar(255))
Begin

declare vBairroId int;
declare vCidadeId int;
declare vUFId int;
set vBairroId =  (select Bairro_Id From Bairro where Bairro_Nome = vBairro);
set vCidadeId =  (select Cidade_Id From Cidade where Cidade_Nome = vCidade);
set vUFId =  (select Estado_Id From Estado where Estado_Nome = vEstado);

if not exists (select CEP From Endereco where CEP = vCEP) then
      if (vBairroId is null) then
        insert into Bairro (Bairro_Nome) values(vBairro);
        set vBairroId :=  (select Bairro_Id From Bairro where Bairro_Nome = vBairro);
      End if;
	   if (vCidadeId is null) then
        insert into Cidade (Cidade_Nome) values(vCidade);
        set vCidadeId :=  (select Cidade_Id From Cidade where Cidade_Nome = vCidade);
      End if;
      if (vUFId is null) then
        insert into Estado (Estado_Nome) values(vEstado);
        set vUFId :=  (select Estado_Id From Estado where Estado_Nome = vEstado);
      End if;        
  insert into Endereco  (CEP,Estado_Id,Cidade_Id,Bairro_Id,Logradouro,Num_Res,Complemento)
			        values(vCEP,vUFId,vCidadeId,vBairroId,vLogradouro,vNumRes,vComplemento);
 ELSE
  SELECT 'Já existe';
 End If;  
End $$         
-- Cpf, Nome, nome social, cargo, data nasc, tel, email, senha, sexo(F/M), Cep, estado, cidade, bairro, logradouro, numero res, complemento
Delimiter $$ 
create procedure addFuncionario(vFuncCpf varchar(14),vFuncNome varchar(200),vFuncNomeSoc varchar(200),vFuncCargo varchar(50),vFuncDataNasc DATETIME,vTel varchar(20),vFuncEmail varchar(200),vFuncSenha varchar(100),vFuncSexo varchar(1),vCEP varchar(9),vEstado char(2),vCidade varchar(200),vBairro varchar(200),vLogradouro varchar(200),vNumRes int,vComplemento varchar(255))
Begin

declare vCEPIdFunc decimal(8,0);
declare vCEPId decimal(8,0);
declare vBairroId int;
declare vCidadeId int;
declare vEstadoId int;
declare vTelId int;
set vCEPIdFunc =  (select Cep from Funcionario where Cep = vCEP);
set vCEPId     =  (select Cep from Endereco where Cep = vCEP);
set vBairroId  =  (select Bairro_Id From Bairro where Bairro_Nome = vBairro);
set vCidadeId  =  (select Cidade_Id From Cidade where Cidade_Nome = vCidade);
set vEstadoId  =  (select Estado_Id From Estado where Estado_Nome = vEstado);
set vTelId     =  (select Tel_Id from Telefone where Tel_Num = vTel);

	if not exists (select Cep From Endereco where Cep = vCEP) then
      if (vBairroId is null) then
        insert into Bairro (Bairro_Nome) values(vBairro);
        set vBairroId :=  (select Bairro_Id From Bairro where Bairro_Nome = vBairro);
      End if;
	  if (vCidadeId is null) then
        insert into Cidade (Cidade_Nome) values(vCidade);
        set vCidadeId :=  (select Cidade_Id From Cidade where Cidade_Nome = vCidade);
	  End if;
      if (vEstadoId is null) then
        insert into Estado (Estado_Nome) values(vEstado);
        set vEstadoId :=  (select Estado_Id From Estado where Estado_Nome = vEstado);
      End if;    
      insert into Endereco(Cep,Estado_Id,Cidade_Id,Bairro_Id,Logradouro,Num_Res,Complemento)
			        values(vCEP,vEstadoId,vCidadeId,vBairroId,vLogradouro,vNumRes,vComplemento);
    else
	 select 'fudeu';
	end if;
    
    if not exists (select Tel_Id from Telefone where Tel_num = vTel) then
		if(vTelId is null) then
			insert into Telefone (Tel_Num) values (vTel);
			set vTelId := (select Tel_Id from Telefone where Tel_Num = vTel);
        end if;
	else
		select 'Telefone ja existe';
    end if;
	if not exists (select Func_Cpf from Funcionario where Func_Cpf = vFuncCpf) then
	   insert into Funcionario (Func_Cpf,Func_Nome,Func_NomeSoc,Func_Cargo,Func_DataNasc,Tel_Id,Func_Email,Func_Senha,Func_Sexo,Cep)
				   values (vFuncCpf,vFuncNome,vFuncNomeSoc,vFuncCargo,vFuncDataNasc,vTelId,vFuncEmail,vFuncSenha,vFuncSexo,vCEP);
 ELSE
  SELECT 'Já existe';
 End If;
 end $$    

-- Cpf, Nome, nome social, cargo, data nasc, tel, email, senha, sexo(F/M), Cep, estado, cidade, bairro, logradouro, numero res, complemento


select * from Endereco;
select * from Funcionario;	
select * from Telefone;

-- Cpf, Nome, nome social, email, senha, data nasc, sexo(F/M), tel, Cep, estado, cidade, bairro, logradouro, numero res, complemento
Delimiter $$ 
create procedure addCliente(vCliCpf varchar(14),vCliNome varchar(200),vCliNomeSoc varchar(200),vCliEmail varchar(200),vCliSenha varchar(100),vCliDataNasc DATETIME,vCliSexo varchar(1),
vTel varchar(20),vCep varchar(9),vEstado char(2),vCidade varchar(200),vBairro varchar(200),vLogradouro varchar(200),vNumRes int,vComplemento varchar(255))
Begin

declare vCEPIdCli decimal(8,0);
declare vCEPId decimal(8,0);
declare vBairroId int;
declare vCidadeId int;
declare vEstadoId int;
declare vTelId int;
set vCEPIdCli  =  (select Cep from Cliente where Cep = vCEP);
set vCEPId     =  (select Cep from Endereco where Cep = vCEP);
set vBairroId  =  (select Bairro_Id From Bairro where Bairro_Nome = vBairro);
set vCidadeId  =  (select Cidade_Id From Cidade where Cidade_Nome = vCidade);
set vEstadoId  =  (select Estado_Id From Estado where Estado_Nome = vEstado);
set vTelId     =  (select Tel_Id from Telefone where Tel_Num = vTel);

	if not exists (select Cep From Endereco where Cep = vCEP) then
      if (vBairroId is null) then
        insert into Bairro (Bairro_Nome) values(vBairro);
        set vBairroId :=  (select Bairro_Id From Bairro where Bairro_Nome = vBairro);
      End if;
	  if (vCidadeId is null) then
        insert into Cidade (Cidade_Nome) values(vCidade);
        set vCidadeId :=  (select Cidade_Id From Cidade where Cidade_Nome = vCidade);
	  End if;
      if (vEstadoId is null) then
        insert into Estado (Estado_Nome) values(vEstado);
        set vEstadoId :=  (select Estado_Id From Estado where Estado_Nome = vEstado);
      End if;    
      insert into Endereco(Cep,Estado_Id,Cidade_Id,Bairro_Id,Logradouro,Num_Res,Complemento)
			        values(vCEP,vEstadoId,vCidadeId,vBairroId,vLogradouro,vNumRes,vComplemento);
    else
	 select 'fudeu';
	end if;
    
    if not exists (select Tel_Id from Telefone where Tel_num = vTel) then
		if(vTelId is null) then
			insert into Telefone (Tel_Num) values (vTel);
			set vTelId := (select Tel_Id from Telefone where Tel_Num = vTel);
        end if;
	else
		select 'Telefone ja existe';
    end if;
	if not exists (select Cli_Cpf from Cliente where Cli_Cpf = vCliCpf) then
	   insert into Cliente (Cli_Cpf,Cep,Tel_id,Cli_Nome,Cli_NomeSoc,Cli_Email,Cli_Senha,Cli_DataNasc,Cli_Sexo)
				   values (vCliCpf,vCep,vTelid,vCliNome,vCliNomeSoc,vCliEmail,vCliSenha,vCliDataNasc,vCliSexo);
                   
                   
	
 ELSE
  SELECT 'Já existe';
 End If;
 end $$

delimiter $$
create procedure addCategoria (pCategNome varchar(50))
begin insert into Categoria(Categ_Nome)
				values(pCategNome);
end;
$$
 
 Delimiter $$
create procedure addProduto(vProd varchar(100),vCateg varchar(50),vProdGarant datetime, vProdVal double,vProdQuantEstoq int(10),vProdDescri varchar(10000),vProdImg varchar(500))
begin
	declare vCategId int;
    set vCategId = (select Categ_Id from Categoria where Categ_Nome = vCateg);

	if not exists(select Prod_Cod from Produto where Prod_Nome = vProd) then
		if(vCategId is null) then
			insert into Categoria (Categ_Nome) values (vCateg);
            set vCategId := (select Categ_Id from Categoria where Categ_Nome = vCateg);
            select 'Categoria Cadastrada';
		end if;
     insert into Produto(Prod_Nome,Categ_Id,Prod_Garant,Prod_Val,Prod_QuantEstoq,Prod_Img,Prod_Descri)
				 values (vProd,vCategId,vProdGarant,vProdVal,vProdQuantEstoq,vProdImg,vProdDescri);   
        -- select 'Produto foi cadastrado com sucesso';
    else
		select 'Produto ja cadastrado';
	end if;
end $$


-- Valor do Pedido, ID do Produto, ID do Cliente;
delimiter $$
create procedure addPedido (vProd varchar(100), vCli varchar(100), vPedQuant int)
begin

declare vCliCpf varchar(20);
declare vProdCod int;
set vCliCpf  = (select Cli_Cpf from Cliente where vCli = Cli_Nome);
set vProdCod = (select Prod_Cod from Produto where vProd = Prod_Nome);

if (vCliCpf is null) then
	select 'Cliente não existe, faça o cadastro de um novo cliente';
end if;
if not exists (select Prod_Cod from Produto where Prod_Nome = vProd) then
	select 'Produto não cadastrado';
end if;
	insert into Pedido (Prod_Cod, Cli_Cpf, Ped_Quant,Ped_valor,Ped_Data,Ped_Status)
		 values (vProdCod,vCliCpf,vPedQuant,(select Prod_Val from Produto where Prod_Nome = vProd) * vPedQuant,current_date(),null);
         

end;
$$ 



Delimiter $$
create procedure addDelivery(vPed int,vCep varchar(20))
Begin

declare vPedCod int;
declare vCepId int;
set vPedCod = (select Ped_Cod from Pedido where Ped_Cod = vPed);
set vCepId  = (select Cep from Endereco where Cep = vCep);

if (vPedCod is null) then
	select 'Pedido não existe!';
end if;
if (vCepId is null) then
	select 'Cep não cadastrado!';
end if;
	insert into Delivery (Ped_Cod,Cep,Deliv_Data)
				  values (vPedCod,vCepId,current_date());
                  
                  
end $$


Delimiter $$
create procedure addDevolucao(vPed int,vDeliv varchar(20))
Begin

declare vPedCod int;
declare vDelivCod int;
set vPedCod = (select Ped_Cod from Pedido where Ped_Cod = vPed);
set vDelivCod  = (select Deliv_Cod from Delivery where Deliv_Cod = vDeliv);

if (vPedCod is null) then
	select 'Pedido não existe!';
end if;
if (vDelivCod is null) then
	select 'Delivery não cadastrado!';
end if;
	insert into Devolucao (Ped_Cod,Deliv_Cod,Devol_ValReem,Devol_Data)
				  values (vPedCod,vDelivCod,(select Ped_Valor from Pedido where Ped_Cod = vPed),current_date());
                  
                  
end $$
 
 Delimiter $$
 create procedure addPagamento(vCli varchar(11),vPed int,vPagtoTipo varchar(50))
 Begin
	
declare vCliCpf varchar(11);
declare vPedCod int;
set vCliCpf = (select Cli_Cpf from Cliente where Cli_Cpf = vCli);
set vPedCod = (select Ped_Cod from Pedido where Ped_Cod = vPed);


if (vCliCpf is null) then
	select 'Cliente não cadastrado!';
end if;
if (vPedCod is null) then
	select 'Pedido não cadastrado!';
end if;
	insert into Pagamento (Cli_Cpf,Ped_Cod,Pagto_Total,Pagto_Tipo)
				   values (vCli,vPedCod,(select Ped_valor from Pedido where Ped_Cod = vPed),vPagtoTipo);

 end $$

Delimiter $$
create procedure addVenda (vPed int,vPagto int)
Begin

declare vPedCod int;
declare vPagtoCod int;
set vPedCod   = (select Ped_Cod from Pedido where Ped_Cod = vPed);
set vPagtoCod = (select Pagto_Cod from Pagamento where Pagto_Cod = vPagto);

if (vPedCod is null) then
	select 'Pedido não registrado';
end if;
if (vPagtoCod is null) then
	select 'Pagamento não realizado';
end if;
	insert into Venda (Ped_Cod,Pagto_Cod,Venda_Val)
			   values (vPedCod,vPagtoCod,(select Pagto_Total from Pagamento where Pagto_Cod = vPagto));
End $$

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------| PROCEDURE ATUALIZAR (UP) |--------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
create procedure spUpdateSenha(vEmail varchar(200), vSenha varchar(100))
begin
update Cliente set Cli_Senha = vSenha where Cli_Email = vEmail;
end $$
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------| PROCEDURE LISTAR (LIST) |----------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Delimiter $$
create procedure spSelectEmail(vEmail varchar(200))
begin
select Cli_Email from Cliente where Cli_Email = vEmail;
end $$

Delimiter $$
create procedure spSelectCliente(vEmail varchar(200))
begin
select * from Cliente where Cli_Email = vEmail;
end $$

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
end; $$

Delimiter $$
create procedure listEstado()
begin
	select * from Estado;
end; $$

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------| PROCEDURE EXCLUIR (DEL) |--------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

delimiter $$
create procedure PesquisaProd (Pesquisa varchar(150))
begin
	select Prod_Cod, Prod_Nome, Prod_Garant, Prod_Val, Prod_QuantEstoq, Prod_Descri, Prod_Img from Produto where Prod_Nome
    like CONCAT('%',Pesquisa,'%') or Prod_Descri like CONCAT('%',Pesquisa,'%');
end $$

delimiter %%
create trigger trgPagtoVenda After Insert on Pagamento
for each row
begin
         INSERT INTO Venda 
                 SET  Ped_Cod = New.Ped_Cod,
					  Pagto_Cod = New.Pagto_Cod,
                      Venda_Val = New.Pagto_Total;

end;
%%
