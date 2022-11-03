-- Script para comandos do banco dbDix :D

use dbDix;

-- ------------------------------------------------------------------------------------- CALL ---------------------------------------------------------------------------------------

-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										 TELEFONE											    |			
-- |________________________________________________________________________________________________|
-- | ADD			    | UP				 | DEL			   | LIST							    |
-- | Número do Telefone | Número do Telefone | Id do Telefone  | Lista os Telefones já cadastrados  |
-- | Tipo do Telefone   | Tipo do Telefone   |				   |									|
-- | 				    | Id do Telefone     |				   |									|
-- |____________________|____________________|_________________|____________________________________|
-- |										Observações												|
-- |																							    |
-- | - Número do Telefone: VARCHAR de no máximo 20 caracteres, NÃO NULO E ÚNICO;					|
-- | - Tipo do Telefone: VARCHAR de no máximo 30 caracteres e NÃO NULO;								|
-- | - Id do Telefone: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;	    	|
-- |________________________________________________________________________________________________|

-- | Call's Telefone -------------------------------------------------------------------------------|
call addTelefone('551194858-1774','Celular');
call addTelefone('551194576-6789','Celular');
call addTelefone('786784327-7328','Celular');
call addTelefone('786784327-7370','Celular');
call addTelefone('551190321-8282','Residencial');
call addTelefone('551190321-8912','Residencial');
call addTelefone('551287978-3217','Residencial');
call upTelefone('551193724-6792','Empresarial','2');
call delTelefone('4');
call listTelefone;

-- |------------------------------------------------------------------------------------------------|


-- Call's Telefone ----------------------------------------------------------------------------------
-- Estado -> Nome do estado (ja incluso)
call listEstado;
-- --------------------------------------------------------------------------------------------------


-- |_______________________________________________________________________________________________|
-- |																							   |		
-- |										 CIDADE												   |			
-- |_______________________________________________________________________________________________|
-- | ADD			   | UP					|  DEL			  | LIST							   |
-- | Nome da Cidade    | Nome da Cidade     |  ID da Cidade   | Lista as Cidades ja cadastradas    |
-- | 				   | ID da Cidade       |				  |									   |
-- |___________________|____________________|_________________|____________________________________|
-- |										Observações							   				   |
-- |																							   |
-- | - Nome da Cidade: VARCHAR de no máximo 50 caracteres e NÃO NULO;				   			   |
-- | - ID da Cidade: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;			   |
-- |_______________________________________________________________________________________________|

-- | Call's Cidade --------------------------------------------------------------------------------|
call addCidade ('tucuruvi');
call addCidade ('calunga');
call addCidade ('Armarinhos Fernando');
call addCidade ('Armarinhos Fernando');
call addCidade ('Armarinhos Fernando');
call upCidade ('Granja Julieta','4');
call delCidade ('5');
call listCidade;
-- |-----------------------------------------------------------------------------------------------|


-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										  BAIRRO											    |			
-- |________________________________________________________________________________________________|
-- | ADD			   | UP					|  DEL			  | LIST							    |
-- | Nome do Bairro    | Nome do Bairro     |  ID do Bairro   | Lista os Bairros ja cadastrados     |
-- | ID da Cidade 	   | ID da Cidade	    |				  |									    |
-- | 				   | ID do Bairro       |				  |									    |
-- |___________________|____________________|_________________|_____________________________________|
-- |										Observações							   				    |
-- |																								|
-- | - Nome do Bairro: VARCHAR de no máximo 100 caracteres e NÃO NULO;				   				|
-- | - ID da Cidade: INTEIRO, CHAVE ESTRANGEIRA	da tabela CIDADE, NÃO NULO;	   					    |
-- | - ID do Bairro: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;				|
-- |________________________________________________________________________________________________|
  
-- | Call's Bairro ---------------------------------------------------------------------------------|         
call addBairro('Santa da Tijuca');
call addBairro('Lucinao Hulk');
call addBairro('Aí mds é o braia');
call addBairro('Logo Ali');
call addBairro('Logo Ali');
call upBairro('Um bairrozinho bem piquinininho','1');
call delBairro('5');
call listBairro;
-- |------------------------------------------------------------------------------------------------|


-- |__________________________________________________________________________________________________|
-- |																							      |		
-- |										   ENDERECO											      |			
-- |__________________________________________________________________________________________________|
-- | ADD				  | UP					 |  DEL			  | LIST							  |
-- | CEP		 		  | Id do estado		 | CEP			  |	Lista os Enderecos ja cadastrados |
-- | Id do estado 		  | Id da cidade		 |				  |									  |
-- | Id da cidade   	  | ID do Bairro	     |      		  |  								  |
-- | ID do Bairro	   	  | Logradouro 	    	 |				  |									  |
-- | Logradouro		   	  | Numero da residencia |     			  |				  					  |
-- | Numero da residencia | Complemento		     |				  |									  |
-- | Complemento		  | CEP				     |				  |									  |
-- |______________________|______________________|________________|___________________________________|
-- |										Observações							   				      |
-- |																								  |
-- | - CEP: VARCHAR de no máximo 8 caracteres, CHAVE PRIMÁRIA desta tabela, NÃO NULO;				  |
-- | - ID do Estado: INTEIRO, CHAVE ESTRANGEIRA	da tabela ESTADO, NÃO NULO;							  |
-- | - ID da Cidade: INTEIRO, CHAVE ESTRANGEIRA	da tabela CIDADE, NÃO NULO;							  |
-- | - ID do Bairro: INTEIRO, CHAVE ESTRANGEIRA	da tabela BAIRRO, NÃO NULO;							  |
-- | - Logradouro: VARCHAR de no máximo 50 caracteres, NÃO NULO;									  |
-- | - Numero da residencia: INTEIRO, NULO															  |
-- | - Complemento: VARCHAR de no máximo 255 caracteres, NULO										  |
-- |__________________________________________________________________________________________________| 
-- Cep, Id do estado, id da cidade, id do bairro, logradouro, numero da residencia, complemento
-- Id do estado, Id da cidade, Id do bairro, logradouro, numero da residencia, complemento
-- | Call's Endereco ---------------------------------------------------------------------------------|
call addEndereco ('12345679','1','1','1','Morro','481',null);
call addEndereco ('12345672','2','1','1','Morro','653','cuidado com os cara da casa 481, eles sao de medo');
call addEndereco ('92356790','3','3','2','Praça','345',null);
call addEndereco ('78942323','4','4','2','Praça','217',null);
call addEndereco ('57843237','1','3','4','Avenida','789',null);
call addEndereco ('57843236','3','2','4','Avenida','777',null);
call upEndereco ('2','3','1','Avenida','589','é um apartamento, só pra dizer mesmo','12345672');
call delEndereco ('6');
call listEndereco;

-- |------------------------------------------------------------------------------------------------|


-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										  CATEGORIA											    |			
-- |________________________________________________________________________________________________|
-- | ADD			   | UP					|  DEL			   | LIST							    |
-- | Nome da Categoria | Nome da Categoria  |  ID da Categoria | Lista as Categorias ja cadastradas |
-- | 				   | ID da Categoria	|				   |									|
-- | 				   | 			        |				   |									|
-- |___________________|____________________|__________________|____________________________________|
-- |										Observações							   				    |
-- |																								|
-- | - Nome da Categoria: VARCHAR de no máximo 50 caracteres, NÃO NULO;							    |
-- | - ID da Categoria: INTEIRO, VALOR AUTOMÁTICO, CHAVE PRIMÁRIA desta tabela, NÃO NULO;			|
-- |________________________________________________________________________________________________| 

-- | Call's Categoria ------------------------------------------------------------------------------|
call addCategoria ('Eletrodomético');
call addCategoria ('Cosplay');
call addCategoria ('Cosplay');
call addCategoria ('Animers');
call upCategoria ('Itens de manobra','1');
call delCategoria ('3');
call listCategoria;

-- |------------------------------------------------------------------------------------------------|


-- |_____________________________________________________________________________________________________|
-- |																							    	 |		
-- |										  	  PRODUTO											     |			
-- |_____________________________________________________________________________________________________|
-- | ADD			   		| UP					|  DEL			  | LIST						     |
-- | Id da Cateoria    		| Id da Cateoria		|  Id do Produto  | Lista os Produtos ja cadastrados |
-- | Nome do Produto 	    | Nome do Produto	    |				  |									 |
-- | Data de Garantia		| Data de Garantia      |				  |									 |
-- | Valor do Produto		| Valor do Produto		|				  |									 |
-- | Quatidade em Estoque	| Quatidade em Estoque	|				  |									 |
-- | Imagem do Produto		| Imagem do Produto		|				  |									 |
-- | 						| ID do Produto			|				  |									 |
-- |________________________|_______________________|_________________|__________________________________|
-- |										    Observações							   				     |
-- |																									 |
-- | - Id do Produto: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;					 |
-- | - Id da Categoria: INTEIRO, CHAVE ESTRANGEIRA da tabela CATEGORIA, NÃO NULO;				    	 |
-- | - Nome do Produto: VARCHAR de no máximo 100 caracteres, NÃO NULO;									 |
-- | - Data da Garantida: DATE (ANO/MES/DIA), NÃO NULO;													 |
-- | - Valor do Produto: DOUBLE (EXEMPLO DE VALOR: 26.50), NÃO NULO;									 | 
-- | - Quantidade em Estoque: INT de no máximo 10 caracteres, NÃO NULO;									 |
-- | - Imagem do Produto: VARCHAR de no máximo 500 caracteres, NULO;									 |
-- |_____________________________________________________________________________________________________| 

-- | Call's Produto -------------------------------------------------------------------------------------|

call addProduto('1','Dongonshgondondon','2001/12/30','52','6','berinbal.png');
call addProduto('2','Luiz Gonzaga','2004/12/19','6.50','42','ele.png');
call addProduto('2','Luiz Gonzaga','2004/12/19','6.50','42','ele.png');
call upProduto('2','Guiz Lonzagas','2005/11/18','6.55','43','realmentEle.png','2');
call delProduto('3');
call listProduto;

-- |-----------------------------------------------------------------------------------------------------|


-- |_________________________________________________________________________________________________________|
-- |																							    	 	 |		
-- |										  	   CLIENTE 									    	     	 |			
-- |_________________________________________________________________________________________________________|
-- | ADD			   		| UP					 |  DEL			  	  | LIST						     |
-- | CEP do Cliente    		| CEP do Cliente		 |  ID do Cliente	  | Lista os Clientes ja cadastrados |
-- | ID do Telefone 	    | ID do Telefone	     |				  	  |									 |
-- | Nome do Cliente		| Nome do Cliente        |				  	  |									 |
-- | Nome Social do Cliente	| Nome Social do Cliente |				  	  |									 |
-- | Email do Cliente		| Email do Cliente		 |				  	  |									 |
-- | Senha do Cliente		| Senha do Cliente		 |				  	  |									 |
-- | Data de Nascimento		| Data de Nascimento	 |				  	  |									 |
-- | CPF do Cliente			| CPF do Cliente		 |					  |									 |
-- | Sexo					| Sexo					 |					  |									 |
-- |						| ID do Cliente		 	 |					  |									 | 
-- |________________________|________________________|____________________|__________________________________|
-- |										     Observações							   				     |
-- |                                                                                                         |
-- | - ID do Cliente: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;						 |
-- | - CEP: INTEIRO, CHAVE ESTRANGEIRA da tabela ENDERECO, NÃO NULO;										 |
-- | - ID do Telefone: INTEIRO, CHAVE ESTRANGEIRA da tabela TELEFONE, NÃO NULO;								 |
-- | - Nome do Cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO; 										 |
-- | - Nome Social do Cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO; 								 |
-- | - Email do Cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO; 									 |
-- | - Senha do Cliente: VARCHAR de no máximo 100 caracteres, NÃO NULO; 									 |
-- | - Data de Nascimento: DATE (ANO/MES/DIA), NÃO NULO; 													 |
-- | - CPF do Cliente: VARCHAR de no máximo 20 caracteres, NÃO NULO; 										 |
-- | - Sexo: VARCHAR de no máximo 1 caractere, NÃO NULO; 													 |
-- |_________________________________________________________________________________________________________| 

-- | Call's Cliente -----------------------------------------------------------------------------------------|
call addCliente ('12345672','1','Kaio Gomes','Soca fofo','kupyskii@gmail.com','12345678','2005/05/03','476-895-578-99','M');
call addCliente ('12345672','1','Kaio Gomes','Soca fofo','kupyskii@gmail.com','12345678','2005/05/03','476-895-578-99','M');
call addCliente ('12345672','1','Kaio Gomes','Soca fofo','kupyskii@gmail.com','12345678','2005/05/03','476-895-578-99','M');
call upCliente ('92356790','3','Julião Tavares','Taveira','jujudopix@gmail.com','33489620','1963/05/03','345-412-543-31','M','2');
call delCliente ('3');
call listCliente;

-- |---------------------------------------------------------------------------------------------------------|


-- |_____________________________________________________________________________________________________|
-- |																							    	 |		
-- |										  	  PEDIDO											     |			
-- |_____________________________________________________________________________________________________|
-- | ADD			   	   | UP					   |  DEL			   | LIST							 |
-- | Código do produto     | Código do produto     |  Código do pedido | Lista os pedidos ja cadastradas |
-- | ID do cliente		   | ID do cliente	       |				   |							     |
-- | Valor total do pedido | Valor total do pedido |				   |							     |
-- |					   | Código do pedido	   |				   |								 |
-- |_______________________|_______________________|___________________|_________________________________|
-- |										    Observações							   				     |
-- |																									 |
-- | - Código do pedido: INTEIRO, VALOR AUTOMÁTICO, CHAVE PRIMÁRIA dos dados desta tabela;				 |
-- | - Código do produto: INTEIRO, CHAVE ESTRANGEIRA da tabela PRODUTO, NÃO NULO;						 |
-- | - ID do cliente: INTEIRO, CHAVE ESTRANGEIRA da tabela CLIENTE, NÃO NULO;							 |
-- | - Valor total do produto: DOUBLE (EXEMPLO DE VALOR: 26.50), NÃO NULO;								 |
-- |_____________________________________________________________________________________________________| 

-- | Call's Pedido --------------------------------------------------------------------------------------|
call addPedido('2','1','6.50');
call addPedido('2','1','6.50');
call addPedido('2','1','6.50');
call upPedido('1','2','23.90','2');
call delPedido('3');
call listPedido;

-- |-----------------------------------------------------------------------------------------------------|


-- |________________________________________________________________________________________________________________________|
-- |																							    					    |		
-- |										 				DELIVERY											    	    |			
-- |________________________________________________________________________________________________________________________|
-- | ADD			   			   | UP							  |  DEL		  		| LIST					    	    |
-- | Código do Pedido    		   | Código do Pedido   		  |  Código do Delivery | Lista os Deliverys ja cadastradas |
-- | CEP de onde vai ser entregue  | CEP de onde vai ser entregue |				  		|								    |
-- | Data do Delivery			   | Data do Delivery			  |				  		|								    |
-- |							   | Código do Delivery 		  |						|								    |
-- |_______________________________|______________________________|_____________________|___________________________________|
-- |										               Observações							   				    	    |
-- |																									                    |
-- | - Código do Delivery: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;							    |
-- | - Código do Pedido: INTEIRO, CHAVE ESTRANGEIRA da tabela PEDIDO, NÃO NULO;											    |
-- | - CEP de onde vai ser entregue: VARCHAR de no máximo 8 caracteres, CHAVE ESTRANGEIRA da tabela ENDERECO, NÃO NULO;	    |
-- | - Data do Delivery: DATE (ANO/MES/DIA), NÃO NULO;																	    |
-- |________________________________________________________________________________________________________________________| 

-- | Call's Delivery -------------------------------------------------------------------------------------------------------|
call addDelivery('1','12345672','2001/01/01');
call addDelivery('1','12345672','2001/01/01');
call addDelivery('1','12345672','2001/01/01');
call upDelivery('2','78942323','2022/09/29','2');
call delDelivery('3');
call listDelivery;

-- |------------------------------------------------------------------------------------------------------------------------|


-- |_______________________________________________________________________________________________________________|
-- |																							    			   |		
-- |										  		   DEVOLUCAO					    			    		   |			
-- |_______________________________________________________________________________________________________________|
-- | ADD				     | UP					   |  DEL			  	  | LIST							   |
-- | Codigo do Pedido		 | Codigo do Pedido 	   |  Codigo da Devolucao | Lista os Devolucoes ja cadastradas |
-- | Codigo do Delivery 	 | Codigo do Delivery 	   |				  	  |									   |
-- | Valor a ser Reembolsado | Valor a ser Reembolsado |				   	  |								       |
-- |						 | Codigo da Devolucao	   |					  |									   |
-- |_________________________|_________________________|______________________|____________________________________|
-- |										         Observações							   				       |
-- |																									           |
-- | - Codigo da Devolucao: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;					   |
-- | - Codigo do Pedido: INTEIRO, CHAVE ESTRANGEIRA da tabela PEDIDO, NÃO NULO;									   |
-- | - Codigo do Delivery: INTEIRO, CHAVE ESTRANGEIRA da tabela DELIVERY, NÃO NULO;				    			   |
-- | - Valor a ser Reembolsado:	DOUBLE (EXEMPLO DE VALOR: 26.50), NÃO NULO;			   							   |
-- |_______________________________________________________________________________________________________________| 

-- | Call's Devolucao ---------------------------------------------------------------------------------------------|
call addDevolucao('1','1','6.50');
call addDevolucao('1','1','6.50');
call addDevolucao('1','1','6.50');
call upDevolucao('2','2','20','2');
call delDevolucao('3');
call listDevolucao;

-- |---------------------------------------------------------------------------------------------------------------|


-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										  PAGAMENTO											    |			
-- |________________________________________________________________________________________________|
-- | ADD			   | UP					| DEL			   | LIST							    |
-- | ID do Cliente     | ID do Cliente      | ID do Pagamento  | Lista os Pagamentos ja cadastrados |
-- | Tipo de Pagamento | Tipo de Pagamento  |				   |									|
-- | 				   | ID do Pagamento    |				   |									|
-- |___________________|____________________|__________________|____________________________________|
-- |										Observações							   				    |
-- |																							    |
-- | - ID do Pagamento: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;			|
-- | - ID do Cliente: INTEIRO, CHAVE ESTRANGEIRA da tabela BAIRRO, NÃO NULO;						|
-- | - Tipo de Pagamento: VARCHAR de no máximo 50 caracteres, NÃO NULO;								|
-- |________________________________________________________________________________________________| 

-- | Call's Pagamento ------------------------------------------------------------------------------|
call addPagamento('1','Credito');
call addPagamento('1','Debito');
call addPagamento('1','Debito');
call upPagamento('2','A vista','3');
call listPagamento;

-- |------------------------------------------------------------------------------------------------|


-- |__________________________________________________________________________________________________________________|
-- |																							    	 	 		  |		
-- |										  			FUNCIONARIO									     	 	      |			
-- |__________________________________________________________________________________________________________________|
-- | ADD			   			| UP					 	 |  DEL			  	  | LIST						      |
-- | Nome do Funcionario 		| Nome do Funcionario		 |  ID do Funcionario | Lista os Funcionarios cadastrados |
-- | Nome social do Funcionario | Nome social do Funcionario |				      |									  |
-- | Cargo do Funcionario		| Cargo do Funcionario 		 |				  	  |									  |
-- | Data de Nascimento			| Data de Nascimento 		 |				  	  |									  |
-- | CEP do Funcionario			| CEP do Funcionario		 |				  	  |									  |
-- | Email do Funcionario 		| Email do Funcionario		 |					  |									  |
-- | Senha do Funcionario		| Senha do Funcionario		 |				  	  |									  |
-- | Sexo						| Sexo						 |					  |									  |
-- |							| ID do Funcionario		 	 |					  |									  | 
-- |____________________________|____________________________|____________________|___________________________________|
-- |													Observações							   				    	  |
-- |																												  |
-- | - ID do Funcionario: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;							  |						 								 
-- | - Nome do Funcionario: VARCHAR de no máximo 200 caracteres, NÃO NULO; 										 	  |
-- | - Nome social do Funcionario: VARCHAR de no máximo 200 caracteres, NÃO NULO; 								 	  |
-- | - Cargo: VARCHAR de no máximo 50 caracteres, NÃO NULO;															  |
-- | - Data de Nascimento: DATE (ANO/MES/DIA), NÃO NULO;															  |
-- | - ID do Telefone: INTEIRO, CHAVE ESTRANGEIRA da tabela TELEFONE, NÃO NULO;										  |
-- | - CEP: INTEIRO, CHAVE ESTRANGEIRA da tabela ENDERECO, NÃO NULO;										 		  |
-- | - CPF do Funcionario: VARCHAR de no máximo 20 caracteres, NÃO NULO; 											  |
-- | - Email do Funcionario: VARCHAR de no máximo 200 caracteres, NÃO NULO; 									 	  |
-- | - Senha do Funcionario: VARCHAR de no máximo 100 caracteres, NÃO NULO; 									 	  |								 
-- | - Sexo: VARCHAR de no máximo 1 caractere, NÃO NULO; 													 		  |
-- |__________________________________________________________________________________________________________________| 
 
-- | Call's Funcionario ----------------------------------------------------------------------------------------------|
call addFuncionario('Rebecca','Bea','Ser a Rebecca Beca','2004/12/24','2','92356790','123-534-423-98','rebeccabeca@gmail.com','skiimeuamor','F');
call addFuncionario('Rebecca','Bea','Ser a Rebecca Beca','2004/12/24','2','92356790','123-534-423-98','rebeccabeca@gmail.com','skiimeuamor','F');
call addFuncionario('Rebecca','Bea','Ser a Rebecca Beca','2004/12/24','2','92356790','123-534-423-98','rebeccabeca@gmail.com','skiimeuamor','F');
call upFuncionario('Hamanujan','Indiano','Ser mulato médio','1986/08/14','5','57843236','123-534-857-93','dingdindingdindingdin@gmail.com','312678','M','2');
call delFuncionario('3');
call listFuncionario;

-- |------------------------------------------------------------------------------------------------------------------|


-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										   VENDA											    |			
-- |________________________________________________________________________________________________|
-- | ADD			   	 | UP			  	   | DEL		   | LIST							    |
-- | Código do Pedido    | Código do Pedido    | ID da Venda   | Lista as Vendas ja cadastradas     |
-- | ID do Funcionário 	 | ID do Funcionário   |			   |									|
-- | Código de Pagamento | Código de Pagamento | 		       |				  					|
-- |					 | Codigo de Venda 	   |			   |									|
-- |_____________________|_____________________|_______________|____________________________________|
-- |										Observações							   				    |
-- |																								|
-- | - Codigo da Venda: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;			|
-- | - Código do Pedido: INTEIRO, CHAVE ESTRANGEIRA da tabela PEDIDO, NÃO NULO;						|		
-- | - Código do Funcionário: INTEIRO, CHAVE ESTRANGEIRA da tabela PAGAMENTO, NÃO NULO;				|
-- | - Código de Pagamento: INTEIRO, CHAVE ESTRANGEIRA da tabela PAGAMENTO, NÃO NULO;			    |
-- |________________________________________________________________________________________________|
 
-- | Call's Venda ----------------------------------------------------------------------------------|
call addVenda('1','1','1');
call addVenda('1','1','1');
call addVenda('1','1','1');
call upVenda('2','2','2','2');
call delVenda('3');
call listVenda;

-- |------------------------------------------------------------------------------------------------|

-- ------------------------------------------------------------------------------------- INNER ---------------------------------------------------------------------------------------
-- Serve para ter uma visão melhor sobre o banco, aqui da pra ver a junção de diversas tabelas em uma,
-- Juntei as informações mais importantes sobre cada tabela abaixo 


-- Produto
select Prod_Cod as 'Código', Prod_Nome as "Produto" , Categ_Nome as 'Categoria', C.Categ_Id as 'ID Categoria', Prod_Val as 'Preço', Prod_QuantEstoq as 'Em estoque',
	   Prod_Garant as 'Garantia',Prod_Img as 'Imagem'
from Categoria as C inner join Produto as P on  P.Categ_Id = C.Categ_Id;

-- Endereco 
select Endeco.Cep, Est.Estado_Nome as 'Estado', Cid.Cidade_nome as 'Cidade', Bai.Bairro_Nome as 'Bairro', Logradouro, Num_Res as 'Numero residencial', Complemento
from Endereco as Endeco inner join Estado as Est on Endeco.Estado_Id = Est.Estado_Id
						inner join Cidade as Cid on Endeco.Cidade_Id = Cid.Cidade_Id
                        inner join Bairro as Bai on Endeco.Bairro_Id = Bai.Bairro_Id;
-- Funcionario                   
select Func_Nome as 'Nome', Tel_Num as 'Telefone', Tel_Tipo as 'Tipo telefone', Endeco.Cep, Est.Estado_Nome as 'Estado', Cid.Cidade_nome as 'Cidade', Bai.Bairro_Nome as 'Bairro', Logradouro, Num_Res as 'Numero residencial', Complemento
from Endereco as Endeco inner join Estado as Est on Endeco.Estado_Id = Est.Estado_Id
						inner join Cidade as Cid on Endeco.Cidade_Id = Cid.Cidade_Id
                        inner join Bairro as Bai on Endeco.Bairro_Id = Bai.Bairro_Id
                        inner join Funcionario as Func on Endeco.Cep = Func.Cep
                        inner join Telefone as Tel on Func.Tel_Id = Tel.Tel_Id;                   
-- Cliente                   
select Cli_Nome as 'Nome', Tel_Num as 'Telefone', Tel_Tipo as 'Tipo telefone', Endeco.Cep, Est.Estado_Nome as 'Estado', Cid.Cidade_nome as 'Cidade', Bai.Bairro_Nome as 'Bairro', Logradouro, Num_Res as 'Numero residencial', Complemento
from Endereco as Endeco inner join Estado as Est on Endeco.Estado_Id = Est.Estado_Id
						inner join Cidade as Cid on Endeco.Cidade_Id = Cid.Cidade_Id
                        inner join Bairro as Bai on Endeco.Bairro_Id = Bai.Bairro_Id
                        inner join Cliente as Cli on Endeco.Cep = Cli.Cep
                        inner join Telefone as Tel on Cli.Tel_Id = Tel.Tel_Id;                       
-- Pagamento
select C.Cli_Id as 'ID Cliente', Cli_Nome as 'Cliente', Cli_NomeSoc as 'Nome social', Pagto_Tipo as 'Tipo Pagto', Pagto_Cod as 'Código de pagamento'
from Cliente as C inner join Pagamento as P on C.Cli_Id = P.Cli_Id;

-- Pedido
select Cli_Nome as 'Cliente', Cli_NomeSoc as 'Nome social', Categ_Nome as 'Categoria', Prod_Nome as 'Produto', P.Prod_Cod as 'Código do produto', Prod_QuantEstoq as 'Em estoque',
	   Prod_Val as 'Preço', Ped_Valor as 'Valor total', Prod_Garant as 'Garantia', Prod_Img as 'Imagem'
from Categoria as C inner join Produto as P on P.Categ_Id = C.Categ_Id
					inner join Pedido as PED on P.Prod_Cod = PED.Prod_Cod
                    inner join Cliente as CLI on CLI.Cli_Id = PED.Cli_Id;  
                    
-- Venda
select Cli_Nome as 'Cliente', Cli_NomeSoc as 'Nome social Cli', Categ_Nome as 'Categoria', Prod_Nome as 'Produto', P.Prod_Cod as 'Código do produto', Prod_QuantEstoq as 'Em estoque',
	   Prod_Val as 'Preço', Ped_Valor as 'Valor total', Prod_Garant as 'Garantia', Prod_Img as 'Imagem', Func_Nome as 'Funcionario', Func_NomeSoc 'Nome social Func', V.Venda_Cod as 'Código de Venda'
from Categoria as C inner join Produto as P on P.Categ_Id = C.Categ_Id
					inner join Pedido as PED on P.Prod_Cod = PED.Prod_Cod
                    inner join Venda as V on PED.Ped_Cod = V.Ped_Cod
                    inner join Cliente as CLI on CLI.Cli_Id = PED.Cli_Id
                    inner join Funcionario as F on V.Func_Id = F.Func_Id;
                                        

-- Delivery


select Endeco.Cep, Est.Estado_Nome as 'Estado', Cid.Cidade_nome as 'Cidade', Bai.Bairro_Nome as 'Bairro', Logradouro, Num_Res as 'Numero residencial', Complemento, Cli_Nome as 'Cliente',
Cli_NomeSoc as 'Nome Social', Prod_Nome as 'Produto', Prod.Prod_Cod as 'Código do produto', Deliv_Data 'Data de delievry'									
from Endereco as Endeco inner join Estado as Est on Endeco.Estado_Id = Est.Estado_Id
						inner join Cidade as Cid on Endeco.Cidade_Id = Cid.Cidade_Id
                        inner join Bairro as Bai on Endeco.Bairro_Id = Bai.Bairro_Id
                        inner join Delivery as Deliv on Endeco.Cep = Deliv.Cep
                        inner join Pedido as Ped on Deliv.Ped_Cod = Ped.Ped_Cod
                        inner join Produto as Prod on Ped.Prod_Cod = Prod.Prod_Cod
                        inner join Cliente as Cli on Ped.Cli_Id = Cli.Cli_Id;select Endeco.Cep, Est.Estado_Nome as 'Estado', Cid.Cidade_nome as 'Cidade', Bai.Bairro_Nome as 'Bairro', Logradouro, Num_Res as 'Numero residencial', Complemento, Cli_Nome as 'Cliente',


-- Devolução
Cli_NomeSoc as 'Nome Social', Prod_Nome as 'Produto', Prod.Prod_Cod as 'Código do produto', Deliv_Data 'Data de delievry', Devol_ValReem as 'Valor de reebolso' 									
from Endereco as Endeco inner join Estado as Est on Endeco.Estado_Id = Est.Estado_Id
						inner join Cidade as Cid on Endeco.Cidade_Id = Cid.Cidade_Id
                        inner join Bairro as Bai on Endeco.Bairro_Id = Bai.Bairro_Id
                        inner join Delivery as Deliv on Endeco.Cep = Deliv.Cep
                        inner join Pedido as Ped on Deliv.Ped_Cod = Ped.Ped_Cod
                        inner join Produto as Prod on Ped.Prod_Cod = Prod.Prod_Cod
                        inner join Cliente as Cli on Ped.Cli_Id = Cli.Cli_Id
                        inner join Devolucao as Devol on Deliv.Deliv_Cod = Devol.Deliv_Cod;    