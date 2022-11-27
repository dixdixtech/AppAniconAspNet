-- Script para comandos do banco dbDix :D

use dbDix;

-- ------------------------------------------------------------------------------------- CALL ---------------------------------------------------------------------------------------

-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										 TELEFONE											    |			
-- |________________________________________________________________________________________________|
-- | ADD			    | UP				 | DEL			   | LIST							    |
-- | Número do Telefone | Número do Telefone | Id do Telefone  | Lista os Telefones já cadastrados  |
-- | 				    | Id do Telefone     |				   |									|
-- |____________________|____________________|_________________|____________________________________|
-- |										Observações												|
-- |																							    |
-- | - Número do Telefone: VARCHAR de no máximo 20 caracteres, NÃO NULO E ÚNICO;					|
-- | - Tipo do Telefone: VARCHAR de no máximo 30 caracteres e NÃO NULO;								|
-- | - Id do Telefone: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;	    	|
-- |________________________________________________________________________________________________|

-- | Call's Telefone -------------------------------------------------------------------------------|
call addTelefone('551194858-1774');
call addTelefone('551194576-6789');
call addTelefone('786784327-7328');
call addTelefone('786784327-7370');
call addTelefone('551190321-8282');
call addTelefone('551190321-8912');
call addTelefone('551287978-3217');
-- call upTelefone('551193724-6792','2');
call delTelefone('4');
call listTelefone;

-- |------------------------------------------------------------------------------------------------|


-- Call's Estado ------------------------------------------------------------------------------------
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
-- call upCidade ('Granja Julieta','4');
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
-- call upBairro('Um bairrozinho bem piquinininho','1');
call delBairro('5');
call listBairro;
-- |------------------------------------------------------------------------------------------------|


-- |__________________________________________________________________________________________________|
-- |																							      |		
-- |										   ENDERECO											      |			
-- |__________________________________________________________________________________________________|
-- | ADD				  | UP					 |  DEL			  | LIST							  |
-- | CEP		 		  | Unidade Federativa	 | CEP			  |	Lista os Enderecos ja cadastrados |
-- | Unidade Federativa   | Nome da cidade		 |				  |									  |
-- | Nome da cidade   	  | Nome do Bairro	     |      		  |  								  |
-- | Nome do Bairro	   	  | Logradouro 	    	 |				  |									  |
-- | Logradouro		   	  | Numero da residencia |     			  |				  					  |
-- | Numero da residencia | Complemento		     |				  |									  |
-- | Complemento		  | CEP				     |				  |									  |
-- |______________________|______________________|________________|___________________________________|
-- |										Observações							   				      |
-- |																								  |
-- | - CEP: VARCHAR de no máximo 9 caracteres, CHAVE PRIMÁRIA desta tabela, NÃO NULO; (12345-678)	  |
-- | - Unidade Federativa: VARCHAR de no máximo 2 caracteres, NÃO NULO;	('SP')						  |
-- | - Nome da cidade: VARCHAR de no máximo 100 caracteres, NÃO NULO;								  |
-- | - Nome do Bairro: VARCHAR de no máximo 50 caracteres, NÃO NULO;								  |
-- | - Logradouro: VARCHAR de no máximo 50 caracteres, NÃO NULO;	('Parque'),('Rua'),('Morro')	  |
-- | - Numero da residencia: INTEIRO, NULO															  |
-- | - Complemento: VARCHAR de no máximo 255 caracteres, NULO										  |
-- |__________________________________________________________________________________________________| 

-- | Call's Endereco ---------------------------------------------------------------------------------|

call addEndereco ('12345-050','SP','São Paulo','Lapa','Rua da Federal',481,'cuidado com os bequinhos');
call addEndereco ('12345-679','MG','Ponte Preta','Congo','Morro','481',null);
call addEndereco ('12345-672','RJ','Pão Doce','Bem docinho mesmo','Morro','653','cuidado com os cara da casa 481, eles sao de medo');
call addEndereco ('92356-790','PA','Pororóca','Pururuca','Praça','345',null);
call addEndereco ('78942-323','BA','Tabuão','Da serra','Praça','217',null);
call addEndereco ('78942-324','BA','Tabuão','Da serra','Praça','217',null);
-- call upEndereco ('2','3','1','Avenida','589','é um apartamento, só pra dizer mesmo','12345672');
-- call delEndereco ('12345-050');
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
call addCategoria ('Vestuário');
call addCategoria ('Colecionáveis');
call addCategoria ('Acessório');
call addCategoria ('Livros');
call addCategoria ('Decorações');
call addCategoria ('Decorações');
call addCategoria ('Animers');
-- call upCategoria ('Itens de manobra','1');
call delCategoria ('6');
call listCategoria;

-- |------------------------------------------------------------------------------------------------|


-- |_____________________________________________________________________________________________________|
-- |																							    	 |		
-- |										  	  PRODUTO											     |			
-- |_____________________________________________________________________________________________________|
-- | ADD			   		| UP					|  DEL			  | LIST						     |
-- | Nome do Produto 	    | Nome do Produto	    |  Id do Produto  |	Lista os Produtos ja cadastrados |
-- | Nome da Categoria 	    | Nome da Categoria	    |				  |									 |
-- | Data de Garantia		| Data de Garantia      |				  |									 |
-- | Valor do Produto		| Valor do Produto		|				  |									 |
-- | Quatidade em Estoque	| Quatidade em Estoque	|				  |									 |
-- | Descrição do produto 	| Descrição do produto	|				  |									 |
-- | Imagem do Produto		| Imagem do Produto		|				  |									 |
-- | 						| ID do Produto			|				  |									 |
-- |________________________|_______________________|_________________|__________________________________|
-- |										    Observações							   				     |
-- |																									 |
-- | - Id do Produto: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;					 |
-- | - Nome do Produto: VARCHAR de no máximo 100 caracteres, NÃO NULO;									 |
-- | - Nome da Categoria: INTEIRO, CHAVE ESTRANGEIRA da tabela CATEGORIA, NÃO NULO;				    	 |
-- | - Data da Garantida: DATE (ANO/MES/DIA), NÃO NULO;													 |
-- | - Valor do Produto: DOUBLE (EXEMPLO DE VALOR: 26.50), NÃO NULO;									 | 
-- | - Quantidade em Estoque: INTEIRO, NÃO NULO;									 					 |
-- | - Descrição do Produto: VARCHAR de no máximo 1500 caracteres, NULO;								 |
-- | - Imagem do Produto: VARCHAR de no máximo 500 caracteres, NULO;									 |
-- |_____________________________________________________________________________________________________| 

-- | Call's Produto -------------------------------------------------------------------------------------|

call addProduto ('Fone animers','Animers','01/01/2025','46.99','12','a','.imagemMuitoLinda');

call addProduto('CAMISETA ONE PIECE GRUPO','Vestuário','13/01/2043','69.90','342','A Camiseta One Piece Grupo é um produto original, licenciado e exclusivo Piticas. Estampa inspirada nos personagens do mangá One Piece. O anime conta as aventuras de Luffy e a sua tripulação, os Piratas do Chapéu de Palha que exploram a Grand Line em busca do tesouro mais procurado do mundo. Na Piticas, prezamos por qualidade, diversidade e conforto. A camiseta foi confeccionada em algodão e conta com estilo único, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA DUPLA FACE ONE PIECE IRMÃOS','Vestuário','13/01/2043','79.90','4','A Camiseta Dupla Face One Piece Irmãos é um produto original, licenciado e exclusivo Piticas. Estampa inspirada nos personagens do mangá One Piece. O anime conta as aventuras de Luffy e a sua tripulação, os Piratas do Chapéu de Palha que exploram a Grand Line em busca do tesouro mais procurado do mundo. Na Piticas, prezamos por qualidade, diversidade e conforto. A camiseta foi confeccionada em algodão e conta com estilo único, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA CROPPED DIGIMON TAILMON','Vestuário','13/01/2043','79.90','24','A Camiseta Cropped Tailmon Digimon é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no anime Digimon, contendo toda autenticidade e a magia que os fãs dessa saga tanto procuram. Para quem é fã use e colecione sua camiseta Piticas. Na Piticas, prezamos por qualidade, diversidade e conforto. Confeccionada em algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA NARUTO - ITACHI UCHIHA','Vestuário','13/01/2043','79.90','67','A camiseta Naurto Itachi Uchiha é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no Mangá do jovem ninja Itachi foi um prodígio do clã Uchiha de Konohagakure. Ele se tornou um criminoso internacional depois de assassinar seu clã inteiro, poupando apenas seu irmão mais novo, Sasuke. Na Piticas, prezamos por qualidade, diversidade e conforto. A T-Shirt clássica foi confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA DUPLA FACE RICK & MORTY CAVEIRAS','Vestuário','13/01/2043','89.90','63','A camiseta Dupla Face Rick & Morty Caveiras, é um produto original, licenciado e exclusivo Piticas. Pra quem é fã do Unveriso alternativo do cientista maluco Ricky e seu neto aborrescente Morty. Na Piticas, prezamos por qualidade, diversidade e conforto. A T-Shirt clássica foi confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã. Modelo masculino veste tamanho M / Modelo feminino veste tamanho P.','.png');
call addProduto('CAMISETA ATTACK OF TITAN CAPITÃO LEVI','Vestuário','13/01/2043','79.90','56','A Camiseta AOT Capitão Levi foi selecionada pela Piticas, pensando no seu lado fã. Considerando sempre qualidade, diversidade e autenticidade. Uma peça totalmente versátil com uma modelagem confortável e um caimento leve.Composição: 100% Algodão','.png');
call addProduto('CAMISETA NARUTO KAKASHI ANBU','Vestuário','13/01/2043','69.90','43','A camiseta Naruto Kakashi Anbu é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no Mangá do jovem ninja Naruto Uzumaki, retrata o inicio promissor de Kakashi no ¿Esquadrão Especializado em Táticas de Assassinato¿ (ANBU), a curta saga segue as historias dos jovens Kakashi, Itachi, Yamato e Minato se tornando o quarto Hokage. Confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA OVERSIZE HELLO KITTY PARADE BLACK','Vestuário','13/01/2043','69.90','31','A Camiseta Hello Kitty Parade Black é um produto original, licenciado e exclusivo Piticas. Estampa inspirada na personagem mais fofa do mundo Kawaii, que é adora entre os adultos e crianças. A coleção da Hello Kitty para Piticas envolve nostalgia e aventura no mundo temático cheia de tendência da cultura pop japonesa. Confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA DUPLA FACE NARUTO AKATSUKI','Vestuário','13/01/2043','79.90','35','A camiseta Dupla Face Naruto é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no Mangá do jovem ninja Naruto Uzumaki, a série divida em duas partes, conquistou fãs ao redor do mundo. Na Piticas, prezamos por qualidade, diversidade e conforto. A T-Shirt clássica foi confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('CAMISETA ATTACK ON TITAN MURALHA','Vestuário','13/01/2043','79.90','45','Essa camiseta foi selecionada pela Piticas, pensando no seu lado fã. Considerando sempre qualidade, diversidade e autenticidade. Uma peça totalmente versátil com uma modelagem confortável e um caimento leve.','.png');

call addProduto('MOCHILA KAKASHI - NARUTO','Acessório','12/12/2022','359.90','4','A Mochila Kakashi é um produto original, licenciado e exclusivo Piticas. Para colecionar e usar, desenvolvida pelos nossos nerdsigners para vestir seu lado fã!','.png');
call addProduto('BOLSA MY HERO ACADEMIA MIDORIYA','Acessório','12/12/2024','119.90','65','A Bolsa My Hero Academia Midoriya é um produto original, licenciado e exclusivo Piticas. Inspirada no mangá que relata a história Izuku Midoriya, que tem o sonho de se tornar um super herói e acaba recebendo os poderes do maior herói do mundo, após ajuda-lo e receber o seu reconhecimento e auxilio para se matricular em uma escola para heróis em formação. Confeccionada em 100% Poliéster, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
call addProduto('PIN DIGIMON PATAMON','Acessório','12/12/2024','59.90','43','O Pin Digimon Patamon é um produto original e licenciado, exclusivo Piticas. Produção nacional, feito em Zamac e Metal pintado, prezamos pela qualidade e diversidade. Use e Colecione, expresse todo o seu lado fã.','.png');
call addProduto('BOLSA NARUTO SAGE MODE','Acessório','12/12/2024','269.90','21','A Bolsa Naruto Sage Mode é um produto original, licenciado e exclusivo Piticas. Para colecionar e usar, desenvolvida pelos nossos nerdsigners para vestir seu lado fã!','.png');
call addProduto('CHINELO HAVAIANAS POKEMON','Acessório','12/12/2024','67.90','57','O Chinelo Havaianas Pokemon é inspirado no universo Geek. Produzido em borracha, no modelo tradicional de tiras e com solado emborrachado, os chinelos garantem conforto máximo para te acompanhar em diversos momentos. Nas palmilhas, temos uma padronagem especial de Pokemon, que lembra esse fantástico anime! Selecionado pela Piticas para vestir o seu lado fã com muito orgulho. Todos os produtos são ORIGINAIS, enviados na sua embalagem original adquiridos diretamente das fábricas e seus distribuidores.','.png');
call addProduto('CHINELO HAVAIANAS NARUTO AKATSUKI','Acessório','12/12/2024','59.90','2','O Chinelo Havaianas Naruto Akatsuki é inspirado no universo Geek. Produzido em borracha, no modelo tradicional de tiras e com solado emborrachado, os chinelos garantem conforto máximo para te acompanhar em diversos momentos. Nas palmilhas, temos uma padronagem especial da Akatsuki, que lembra a organização de ninjas mercenários! Selecionado pela Piticas para vestir o seu lado fã com muito orgulho. Todos os produtos são ORIGINAIS, enviados na sua embalagem original adquiridos diretamente das fábricas e seus distribuidores.','.png');
call addProduto('BANDANA NARUTO - ALDEIA DA FOLHA','Acessório','12/12/2024','49.90','34','A Bandana Naruto Símbolo Aldeia da Folha é um produto original, licenciado e exclusivo Piticas. Monte o figurino cosplay do seu personagem favorito! Feita pelos nossos nerdsigners para vestir seu lado fã! Na Piticas, prezamos por qualidade, diversidade e conforto com estilo autêntico! Vista com orgulho, vista seu lado fã. Medida aproxima do comprimento110cm','.png');
call addProduto('SUPORTE PARA CELULAR POP EXPLORAÇÃO','Acessório','12/12/2024','24.90','4','O Suporte Para Celular Pop Exploração é produto original e exclusido Piticas. Oferece uma pegada segura para que você possa digitar com uma mão, tirar melhores fotos e assistir a vídeos sem tocar no telefone, adere melhor em invólucros duros e lisos. Médida aproximida: 5cm','.png');
call addProduto('CHAVEIRO DEMON SLAYER SHINOBU KOCHO','Acessório','12/12/2024','89.90','6','O Chaveiro Demon Slayer Shinobu Kocho é um produto licenciado e exclusivo da Bandai. O anime conhecido como Kimetsu no Yaba, traz uma série de figuras chaveiros chibificadas. Características do produto: 5,5cm e feito em PVC.','.png');
call addProduto('SUPORTE PARA CELULAR POP THE SEVEN DEADLY SINS HAWK','Acessório','12/12/2024','24.90','9','O Suporte Para Celular Pop The Seven Deadly Sins Hawk é produto original e exclusido Piticas. Oferece uma pegada segura para que você possa digitar com uma mão, tirar melhores fotos e assistir a vídeos sem tocar no telefone, adere melhor em invólucros duros e lisos. Médida aproximida: 5cm','.png');

call addProduto('POP UP PARADE - INOSUKE HASHIBIRA - DEMON SLAYER: KIMETSU NO YAIBA','Colecionáveis','10/11/2025','499.99','4','O Pop Up Parade - Inosuke Hashibira - Demon Slayer: Kimetsu no Yaiba é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.','.png');
call addProduto('NENDOROID 1569 - SABITO - DEMON SLAYER: KIMETSU NO YAIBA','Colecionáveis','10/11/2025','899.99','20','O Nendoroid 1569 - Sabito - Demon Slayer: Kimetsu no Yaiba é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura articulada medindo cerca de 10cm de altura.','.png');
call addProduto('NENDOROID 1578 - RACING MIKU 2021 - HATSUNE MIKU GT PROJECT','Colecionáveis','10/11/2025','849.99','6','O Nendoroid 1578 - Racing Miku 2021 - Hatsune Miku GT Project é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura articulada medindo cerca de 10cm de altura.','.png');
call addProduto('NENDOROID 390 - LEVI - ATTACK ON TITAN','Colecionáveis','10/11/2025','699.99','7','O Nendoroid 390 - Levi - Attack on Titan é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura articulada medindo cerca de 10cm de altura.','.png');
call addProduto('SURPRISE ATTACK GAME - SQUIRTLE E JIGLYPUFF','Colecionáveis','10/11/2025','309.90','20','Pokémon são criaturas fictícias que pertencem ao universo da série de mesmo nome - Pokémon. Originalmente, a série foi criada como um jogo de videogame e, com a sua popularização, se espalhou para diversos outros formatos, como séries de TV, filmes e livros.','.png');
call addProduto('POP UP PARADE - JUNKO ENOSHIMA - DANGANRONPA RELOAD','Colecionáveis','10/11/2025','499.99','8','O Pop Up Parade - Junko Enoshima - Danganronpa Reload é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura estática e sem articulações medindo cerca de 17cm de altura.','.png');
call addProduto('NENDOROID 903 - NADESHIKO KAGAMIHARA - LAID-BACK CAMP','Colecionáveis','10/11/2025','699.99','3','O Nendoroid 903 - Nadeshiko Kagamihara - Laid-Back Camp é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura articulada medindo cerca de 10cm de altura.','.png');
call addProduto('POP UP PARADE - SETO KAIBA - YU-GI-OH!','Colecionáveis','10/11/2025','499.99','8','O Pop Up Parade - Seto Kaiba - Yu-Gi-Oh! é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura estática e sem articulações medindo cerca de 18cm de altura.','.png');
call addProduto('POP UP PARADE - RAM ICE SEASON - RE:ZERO - STARTING LIFE IN ANOTHER WORLD','Colecionáveis','10/11/2025','499.99','16','O Pop Up Parade - Ram Ice Season - Re:Zero - Starting Life in Another World é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição.Figura estática e sem articulações medindo cerca de 17cm de altura.','.png');
call addProduto('POP UP PARADE - AMATERASU - OKAMI','Colecionáveis','10/11/2025','549.99','5','O Pop Up Parade - Amaterasu - Okami é um produto original da Goodsmile Company. A Good Smile Company é uma fabricante japonesa de produtos para hobby, como as linhas de produtos Nendoroid e figma, bem como figuras em escala. Além da produção e fabricação, seus negócios incluem design, marketing e distribuição. Figura estática e sem articulações medindo cerca de 13cm de altura.','.png');

call addProduto('LIVRO NARUTO GOLD - 10','Livros','01/01/2027','33.90','40','O torneio preliminar da terceira fase está acirrado! Chegou a hora de Lee, que conta apenas com seu taijutsu sobre-humano, enfrentar o misterioso Gaara e seu poder de controlar livremente a areia!!','.png');
call addProduto('LIVRO NARUTO GOLD - 16','Livros','01/01/2027','29.90','50','Com a vida de Sakura em perigo, Naruto e Gamabunta partem para cima de Gaara transformado! Enquanto isso, a luta entre Orochimaru e o Hokage finalmente chega a um fim, mas a Vila da Folha não tem tempo para lidar com o resultado do embate, pois duas misteriosas pessoas se aproximam!','.png');
call addProduto('LIVRO NARUTO GOLD - 04','Livros','01/01/2027','33.90','67','Sasuke desmaia ao proteger Naruto...!! Nessemomento, o garoto, tomado por ira e tristeza, sofre uma transformação. O que vai ser de Haku, atingido pelo punho enfurecido de Naruto...?! E que rumo tomará o combate entre Zabuza e Kakashi?! O "arco do País das Ondas" chega a um fim turbulento!!','.png');
call addProduto('LIVRO SEM SAÍDA - 03','Livros','01/01/2027','22.90','56','Yuri é uma colegial que, de repente, apareceu em um mundo de prédios e arranha-céus repletos de pessoas mascaradas assassinas. Ela se une à uma garota sobrevivente e descobre que ela tem um celular! Agora, ela pode tentar novamente reencontrar o irmão!!','.png');
call addProduto('LIVRO TOKYO GHOUL: RE - 05','Livros','01/01/2027','24.90','54','Durante a investigação sobre "Rose", os experientes investigadores dão mostras de sua individualidade, enquanto Haise Sasaki começa a descobrir fatos sobre seus vinte anos em branco e a silhueta da dúvida e da verdade vai se revelando aos poucos. Enquanto isso, Kanae planeja matar os membros da Equipe Quinx de Haise, pelo bem de seu patrão, Shu Tsukiyama, e contata a Árvore de Aogiri. Muitos passos se aproximam da casa da família Tsukiyama e o cenário é alinhavado por um olho vermelho que rasteja...!','.png');
call addProduto('LIVRO TOKYO GHOUL: RE - 04','Livros','01/01/2027','24.90','24','Seis meses se passaram após a operação "Limpa-leilão". Shu Tsukiyama está em um vórtice de sofrimento e, para ajudá-lo, Kanae von Rosewald e a família Tsukiyama realizam novamente um sequestro em massa que chamam de "colheita". Porém, ao ver que seu mestre não se recupera, Kanae começa a agir por conta própria e pede a ajuda da fotógrafa Chie Hori.Enquanto isso, Haise e a Equipe Quinx são promovidos, e seu próximo alvo é o ghoul "Rose".Qual é a relação entre essas pessoas e "Ken Kaneki"?','.png');
call addProduto('LIVRO TOKYO GHOUL: RE - 03','Livros','01/01/2027','24.90','8','Os ghouls se reuniram no local do "leilão" para vender e comprar humanos sequestrados. Com o objetivo de exterminar o maior número possível de ghouls procurados, o CCG dá início à operação "Limpa-leilão" com um grande contingente de oficiais. Haise e a equipe Quinx entram na batalha para capturar seu alvo principal, a ghoul "Nut Cracker", e se deparam com uma estranha figura que é chamada de "Owl". A imagem fugaz de um rosto conhecido enche Haise de tristeza e ele escuta uma "voz" em sua mente!','.png');
call addProduto('LIVRO THE PROMISED NEVERLAND - 20','Livros','01/01/2027','24.90','7','As crianças enfrentam novamente Peter Ratri na casa Grace Field, mas o conflito toma um rumo inesperado. Enquanto isso, Mujika e Sonju testemunham a aparição de uma figura que mudará a situação na Capital Real. Qual será o destino de Emma?! Crianças eternas, superem o desespero! A surpreendente história de fuga chega ao fim!!','.png');
call addProduto('LIVRO THE PROMISED NEVERLAND - 11','Livros','01/01/2027','29.90','23','Lewis confronta as crianças com seu poder avassalador. Nessa situação desesperadora, Emma e os outros se jogam na batalha, acreditando na vitória. A batalha decisiva no campo de caça se aproxima do fim! A excitante história de fuga continua! Crianças eternas, superem o desespero!','.png');
call addProduto('LIVRO FIRE FORCE - 05','Livros','01/01/2027','29.90','27','Joker, o homem misterioso, diz a Shinra que seu irmão mais novo está vivo e faz parte do grupo da Apóstolo. Seus companheiros da Unidade 8 aceitarão essa verdade? Além disso, a origem da Unidade 8 é descoberta e eles são enviados para Asakusa seguindo os rastros da Apóstolo e acabam desafiando a Unidade 7!','.png');

call addProduto('CANECA NARUTO AKATSUKI ITACHI','Decorações','04/12/2024','79.90','34','Chegou a caneca paras os fãs do anime mais amado, a Caneca Naruto Akatsuki Itachi veio para deixa seu dia-a-dia mais ninja e ainda pode ser uma linda opção para presentear e decorar. E assim poder expressar seu lado fã! Capacidade 300ml. Medidas: 8,5 X 13 X 8cm.','.png');
call addProduto('CANECA ONE PIECE BOJUDA CHOPPER','Decorações','04/12/2024','89.90','23','A Caneca One Piece Bojuda Chopper é um produto original, licenciado e exclusivo Piticas. Essa caneca é essencial para você tomar aquele café ou a sua bebida de preferência e maratonar os episódios do seu anime, sendo ideal para presentear ou colecionar.','.png');
call addProduto('CANECA ATTACK ON TITAN CAPTAIN LEVI','Decorações','04/12/2024','89.90','28','A Caneca Attack On Titan Captain Levi é ideal para colencionar e presentear em grande estilo. Caneca de cerâmica - Altura: 8,5cm | Comprimento: 7,5cm | Largura: 11,5cm capacidade: 300ml','.png');
call addProduto('ALMOFADA THE SEVEN DEADLY SINS - KING','Decorações','04/12/2024','89.90','73','A almofada The Seven Deadly Sins - King é um produto original e licenciado da Piticas. Pensando no seu lado fã, a Piticas desenvolveu um produto da marca para colecionar e presentear fãs de todo o Brasil. Confeccionado: 100% Poliéster. Medidas aporximadas - Largura: 68cm | Altura: 36cm.','.png');
call addProduto('ALMOFADA ONE PIECE CAVEIRAS','Decorações','04/12/2024','28.90','5','A Almofada One Piece Caveiras é um produto original e licenciado da Piticas. Pensando no seu lado fã, a Piticas desenvolveu um produto da marca para colecionar e presentear fãs de todo o Brasil.','.png');
call addProduto('QUADRO ATTACK ON TITAN COLOSSAL','Decorações','04/12/2024','44.90','30','Chegaram nossos quadros decorativos, perfeito para decorar sua casa até mesmo presentear aquela pessoa especial que você se identifica e expressar seu lado fã. Composição: Chapa de Metal. Dimensões: 200 X 260 MM','.png');
call addProduto('QUADRO THE SEVEN DEADLY SINS','Decorações','04/12/2024','44.90','26','Chegaram nossos quadros decorativos, perfeito para decorar sua casa até mesmo presentear aquela pessoa especial que você se identifica e expressar seu lado fã. Composição: Chapa de Metal. Dimensões: 200 X 260 mm.','.png');
call addProduto('QUADRO ATTACK ON TITAN A TITAN','Decorações','04/12/2024','44.90','32','Chegaram nossos quadros decorativos, perfeito para decorar sua casa até mesmo presentear aquela pessoa especial que você se identifica e expressar seu lado fã. Composição: Chapa de Metal. Dimensões: 200 X 260 mm.','.png');
call addProduto('COPO VIAGEM DRAGON BALL Z - MR. SATAN','Decorações','04/12/2024','69.90','3','Copo viagem satan. copo satan perfeito para relembrar os melhores momentos de dragon ball z. Comprimento: 8cm| Altura: 18cm| Largura: 8cm|peso: 0,235| capacidade: 450ml','.png');
call addProduto('COPO CANUDO DIGIMON GRUPO','Decorações','04/12/2024','49.90','8','O Copo Canudo Digimon Grupo é um produto original e licenciado, exclusivo Piticas. Produção nacional, feito em plástico e poliéster acetinado. Na Piticas prezamos pela qualidade e diversidade. Use e Colecione, expresse todo o seu lado fã.','.png');
call delProduto('1');
call listProduto;

-- |-----------------------------------------------------------------------------------------------------|


-- |_________________________________________________________________________________________________________|
-- |																							    	 	 |		
-- |										  	   CLIENTE 									    	     	 |			
-- |_________________________________________________________________________________________________________|
-- | ADD			   		| UP					 |  DEL			  	  | LIST						     |
-- | CPF do Cliente    		| Nome do Cliente  	 	 |  CPF do Cliente	  | Lista os Clientes ja cadastrados |
-- | Nome do Cliente		| Nome Social do Cliente |				  	  |									 |
-- | Nome Social do Cliente	| Email do Cliente 		 |				  	  |									 |
-- | Email do Cliente		| Senha do Cliente		 |				  	  |									 |
-- | Senha do Cliente		| Data de Nascimento	 |				  	  |									 |
-- | Data de Nascimento		| Sexo	 				 |				  	  |									 |
-- | Sexo					| Número do Telefone	 |					  |									 |
-- | Número do Telefone     | Nome do bairro		 |				  	  |									 |
-- | CEP do cliente			| Unidade federativa 	 |					  |									 | 
-- | Unidade federativa 	| Nome da cidade		 |					  |									 |
-- | Nome da cidade 		| Nome do bairro		 |					  |									 |
-- | Nome do bairro 		| Logradouro			 |					  |									 |
-- | Logradouro 			| Número de residência 	 |					  |									 |
-- | Número de residência 	| Complemento 			 |					  |									 |
-- | Complemento 			| CPF do Cliente		 |					  |									 |
-- |________________________|________________________|____________________|__________________________________|
-- |										     Observações							   				     |
-- |                                                                                                         |
-- | - CPF do Cliente: VARCHAR de no máximo 14 caracteres, CHAVE PRIMÁRIA dos dados desta tabela;			 |
-- | - Nome do Cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO; 										 |
-- | - Nome Social do Cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO; 								 |
-- | - Email do Cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO; 									 |
-- | - Senha do Cliente: VARCHAR de no máximo 100 caracteres, NÃO NULO; 									 |
-- | - Data de Nascimento: DATE (ANO/MES/DIA), NÃO NULO; 													 |
-- | - CPF do Cliente: VARCHAR de no máximo 20 caracteres, NÃO NULO; 										 |
-- | - Sexo: VARCHAR de no máximo 1 caractere, NÃO NULO; 													 |
-- | - Numero do Telefone: VARCHAR de no máximo 20 caracteres, NÃO NULO; 									 |
-- | - CEP: VARCHAR de no máximo 9 caracteres, CHAVE PRIMÁRIA desta tabela, NÃO NULO; (12345-678)	  		 |
-- | - Unidade Federativa: VARCHAR de no máximo 2 caracteres, NÃO NULO;	('SP')						  		 |
-- | - Nome da cidade: VARCHAR de no máximo 100 caracteres, NÃO NULO;								  		 |
-- | - Nome do Bairro: VARCHAR de no máximo 50 caracteres, NÃO NULO;								  		 |
-- | - Logradouro: VARCHAR de no máximo 50 caracteres, NÃO NULO;	('Parque'),('Rua'),('Morro')	  		 |
-- | - Numero da residencia: INTEIRO, NULO															  		 |
-- | - Complemento: VARCHAR de no máximo 255 caracteres, NULO										  		 |
-- |_________________________________________________________________________________________________________| 
	
-- | Call's Cliente -----------------------------------------------------------------------------------------|

call addCliente ('47689557899','Kaio','Soca fofo','kupyskii@gmail.com','12345678','2005/05/03','M','5511948581775','23567789','SP','Grajaú','Vila Natal','Rua','481','Ala eu');
-- call upCliente ('92356790','3','Julião Tavares','Taveira','jujudopix@gmail.com','33489620','1963/05/03','345-412-543-31','M','2');
-- call delCliente ('3');
call listCliente;

-- |---------------------------------------------------------------------------------------------------------|


-- |_____________________________________________________________________________________________________|
-- |																							    	 |		
-- |										  	  PEDIDO											     |			
-- |_____________________________________________________________________________________________________|
-- | ADD			   	   | UP					   |  DEL			   | LIST							 |
-- | Nome do produto       | Nome do produto       |  Código do pedido | Lista os pedidos ja cadastradas |
-- | Nome do cliente	   | Nome do cliente       |				   |							     |
-- | Quantidade do produto | Quantidade do produto |				   |							     |
-- |					   | Código do pedido	   |				   |								 |
-- |_______________________|_______________________|___________________|_________________________________|
-- |										    Observações							   				     |
-- |																									 |
-- | - Código do pedido: INTEIRO, VALOR AUTOMÁTICO, CHAVE PRIMÁRIA dos dados desta tabela;				 |
-- | - Nome do produto: VARCHAR de no máximo 100 caracteres, NÃO NULO;						 			 |
-- | - Nome do cliente: VARCHAR de no máximo 200 caracteres, NÃO NULO;						 			 |
-- | - Quantidade do produto: INTEIRO, NÃO NULO;					 									 |
-- |_____________________________________________________________________________________________________| 

-- | Call's Pedido --------------------------------------------------------------------------------------|

call addPedido('CANECA NARUTO AKATSUKI ITACHI','Kaio','1');
call addPedido('CANECA NARUTO AKATSUKI ITACHI','Kaio','2');
call addPedido('CANECA NARUTO AKATSUKI ITACHI','Kaio','3');
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
-- |							   | Código do Delivery 		  |						|								    |
-- |_______________________________|______________________________|_____________________|___________________________________|
-- |										               Observações							   				    	    |
-- |																									                    |
-- | - Código do Delivery: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;							    |
-- | - Código do Pedido: INTEIRO, CHAVE ESTRANGEIRA da tabela PEDIDO, NÃO NULO;											    |
-- | - CEP de onde vai ser entregue: VARCHAR de no máximo 8 caracteres, CHAVE ESTRANGEIRA da tabela ENDERECO, NÃO NULO;	    |
-- |________________________________________________________________________________________________________________________| 

-- | Call's Delivery -------------------------------------------------------------------------------------------------------|
call addDelivery('1','23567789');
-- call upDelivery('2','78942323','2022/09/29','2');
-- call delDelivery('3');
call listDelivery;

-- |------------------------------------------------------------------------------------------------------------------------|


-- |_______________________________________________________________________________________________________________|
-- |																							    			   |		
-- |										  		   DEVOLUCAO					    			    		   |			
-- |_______________________________________________________________________________________________________________|
-- | ADD				     | UP					   |  DEL			  	  | LIST							   |
-- | Codigo do Pedido		 | Codigo do Pedido 	   |  Codigo da Devolucao | Lista os Devolucoes ja cadastradas |
-- | Codigo do Delivery 	 | Codigo do Delivery 	   |				  	  |									   |
-- |						 | Codigo da Devolucao	   |					  |									   |
-- |_________________________|_________________________|______________________|____________________________________|
-- |										         Observações							   				       |
-- |																									           |
-- | - Codigo da Devolucao: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;					   |
-- | - Codigo do Pedido: INTEIRO, CHAVE ESTRANGEIRA da tabela PEDIDO, NÃO NULO;									   |
-- | - Codigo do Delivery: INTEIRO, CHAVE ESTRANGEIRA da tabela DELIVERY, NÃO NULO;				    			   |
-- |_______________________________________________________________________________________________________________| 

-- | Call's Devolucao ---------------------------------------------------------------------------------------------|
call addDevolucao('1','1'); 
-- call upDevolucao('2','2','20','2');
-- call delDevolucao('3');
call listDevolucao;

-- |---------------------------------------------------------------------------------------------------------------|


-- |_____________________________________________________________________________________________________|
-- |																							         |		
-- |										  PAGAMENTO											     	 |			
-- |_____________________________________________________________________________________________________|
-- | ADD			   | UP					 | DEL			    	| LIST							     |
-- | CPF do Cliente    | CPF do Cliente      | Código do Pagamento  | Lista os Pagamentos ja cadastrados |
-- | Código do pedido  | Código do pedido    |  			    	| 									 |
-- | Tipo de Pagamento | Tipo de Pagamento   |				    	|									 |
-- | 				   | Código do Pagamento |			  	    	|									 |
-- |___________________|_____________________|______________________|____________________________________|
-- |										Observações								   				     |
-- |																								     |
-- | - Código do Pagamento: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;			 |
-- | - ID do Pagamento: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;			 	 |
-- | - CPF do Cliente: INTEIRO, CHAVE ESTRANGEIRA da tabela BAIRRO, NÃO NULO;						 	 |
-- | - Tipo de Pagamento: VARCHAR de no máximo 50 caracteres, NÃO NULO;								 	 |
-- |_____________________________________________________________________________________________________| 

-- | Call's Pagamento ------------------------------------------------------------------------------|
call addPagamento ('47689557899','1','Parcelado');
call listPagamento;

-- |------------------------------------------------------------------------------------------------|


-- |__________________________________________________________________________________________________________________|
-- |																							    	 	 		  |		
-- |										  			FUNCIONARIO									     	 	      |			
-- |__________________________________________________________________________________________________________________|
-- | ADD			   			| UP						 |  DEL			  	   | LIST						      |
-- | CPF do Funcionario			| Nome do funcionário	 	 |  CPF do Funcionario | Lista os Clientes ja cadastrados |
-- | Nome do Funcionario 		| Nome social do Funcionario |  				   |								  |
-- | Nome social do Funcionario | Cargo do Funcionario 		 |				       |								  |
-- | Cargo do Funcionario		| Data de Nascimento		 |				  	   |								  |
-- | Data de Nascimento			| Número do Telefone 		 |				  	   |								  |
-- | Número do Telefone			| Email do funcionário		 |					   |								  |
-- | Email do funcionário		| Senha do funcionário	 	 |				  	   |								  |
-- | Senha do funcionário		| Sexo	 					 |				  	   |								  |
-- | Sexo						| CEP do funcionário		 |					   |								  |
-- | CEP do cliente				| Unidade federativa 	 	 |					   |								  | 
-- | Unidade federativa 		| Nome da cidade		 	 |					   |								  |
-- | Nome da cidade 			| Nome do bairro		 	 |					   |								  |
-- | Nome do bairro 			| Logradouro			 	 |					   |								  |
-- | Logradouro 				| Número de residência 	  	 |					   |								  |
-- | Número de residência 		| Complemento 			 	 |				  	   |								  |
-- | Complemento 				| CPF do Cliente		 	 |					   |								  |
-- |____________________________|____________________________|_____________________|__________________________________|
-- |										    		 Observações							   				      |
-- |                                                                                                      		      |
-- | - CPF do funcionário: VARCHAR de no máximo 14 caracteres, CHAVE PRIMÁRIA dos dados desta tabela;			 	  |
-- | - Nome do funcionário: VARCHAR de no máximo 200 caracteres, NÃO NULO; 											  |
-- | - Nome Social do funcionário: VARCHAR de no máximo 200 caracteres, NÃO NULO; 									  |
-- | - Email do funcionário: VARCHAR de no máximo 200 caracteres, NÃO NULO; 										  |
-- | - Senha do funcionário: VARCHAR de no máximo 100 caracteres, NÃO NULO; 									      |
-- | - Data de Nascimento: DATE (ANO/MES/DIA), NÃO NULO; 													 		  |
-- | - CPF do funcionário: VARCHAR de no máximo 20 caracteres, NÃO NULO; 											  |
-- | - Sexo: VARCHAR de no máximo 1 caractere, NÃO NULO; 													 		  |
-- | - Numero do Telefone: VARCHAR de no máximo 20 caracteres, NÃO NULO; 									 		  |
-- | - CEP do funcionário: VARCHAR de no máximo 9 caracteres, CHAVE PRIMÁRIA desta tabela, NÃO NULO; (12345-678)	  |
-- | - Unidade Federativa: VARCHAR de no máximo 2 caracteres, NÃO NULO;	('SP')						  		 		  |
-- | - Nome da cidade: VARCHAR de no máximo 100 caracteres, NÃO NULO;								  		 		  |
-- | - Nome do Bairro: VARCHAR de no máximo 50 caracteres, NÃO NULO;								  		 		  |
-- | - Logradouro: VARCHAR de no máximo 50 caracteres, NÃO NULO;	('Parque'),('Rua'),('Morro')	  		 		  |
-- | - Numero da residencia: INTEIRO, NULO															  		 		  |
-- | - Complemento: VARCHAR de no máximo 255 caracteres, NULO										  		 		  |
-- |__________________________________________________________________________________________________________________| 
 
-- | Call's Funcionario ----------------------------------------------------------------------------------------------|
call addFuncionario ('12345678902','Mare','Rainha vermelha','Prata','2001/01/01','1155948581774','rebecabeca@gmail.com','123456','F','12345678','PA','Cidade','Bairro','Logradouro',123,'Complemento');
-- call addFuncionario('Rebecca','Bea','Ser a Rebecca Beca','2004/12/24','2','92356790','123-534-423-98','rebeccabeca@gmail.com','skiimeuamor','F');
-- call addFuncionario('Rebecca','Bea','Ser a Rebecca Beca','2004/12/24','2','92356790','123-534-423-98','rebeccabeca@gmail.com','skiimeuamor','F');
-- call addFuncionario('Rebecca','Bea','Ser a Rebecca Beca','2004/12/24','2','92356790','123-534-423-98','rebeccabeca@gmail.com','skiimeuamor','F');
-- call upFuncionario('Hamanujan','Indiano','Ser mulato médio','1986/08/14','5','57843236','123-534-857-93','dingdindingdindingdin@gmail.com','312678','M','2');
-- call delFuncionario('3');
call listFuncionario;

-- |------------------------------------------------------------------------------------------------------------------|


-- |________________________________________________________________________________________________|
-- |																							    |		
-- |										   VENDA											    |			
-- |________________________________________________________________________________________________|
-- | ADD			   	 | UP			  	   | DEL		   | LIST							    |
-- | Código do Pedido    | Código do Pedido    | ID da Venda   | Lista as Vendas ja cadastradas     |
-- | Código de Pagamento | Código de Pagamento | 		       |				  					|
-- |					 | Codigo de Venda 	   |			   |									|
-- |_____________________|_____________________|_______________|____________________________________|
-- |										Observações							   				    |
-- |																								|
-- | - Codigo da Venda: INTEIRO, VALOR AUTOMATICO, CHAVE PRIMÁRIA dos dados desta tabela;			|
-- | - Código do Pedido: INTEIRO, CHAVE ESTRANGEIRA da tabela PEDIDO, NÃO NULO;						|		
-- | - Código de Pagamento: INTEIRO, CHAVE ESTRANGEIRA da tabela PAGAMENTO, NÃO NULO;			    |
-- |________________________________________________________________________________________________|
 
-- | Call's Venda ----------------------------------------------------------------------------------|
call addVenda('1','1');
-- call upVenda('2','2','2','2');
-- call delVenda('3');
call listVenda;

-- |------------------------------------------------------------------------------------------------|
