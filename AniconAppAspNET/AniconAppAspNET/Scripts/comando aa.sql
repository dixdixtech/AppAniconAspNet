-- insert dos estados
insert into Estado (Estado_Id, Estado_Nome)
			values (default,'AC'), (default,'AL'), (default,'AP'), (default,'AM'), (default,'BA'), (default,'CE'),
                   (default,'DF'), (default,'ES'), (default,'GO'), (default,'MA'), (default,'MT'),
				   (default,'MG'), (default,'PA'), (default,'PB'), (default,'PR'), (default,'PE'),
				   (default,'PI'), (default,'RJ'), (default,'RN'), (default,'RS'), (default,'RO'),
				   (default,'RR'), (default,'SC'), (default,'SP'), (default,'SE'), (default,'TO');  
-- Endereco
call addEndereco('12345050','SP','São Paulo','Lapa','Rua da Federal',481,'cuidado com os bequinhos');
select * from Endereco;

-- Funcionario
call addFuncionario ('12345678902','Mare','Rainha vermelha','Prata','2001/01/01','1155948581774','rebecabeca@gmail.com','123456','F','12345678','PA','Cidade','Bairro','Logradouro',123,'Complemento');
select * from Funcionario;

-- Cliente
 call addCliente ('47689557899','Kaio','Soca fofo','kupyskii@gmail.com','12345678','2005/05/03','M','5511948581775','23567789','SP','Grajaú','Vila Natal','Rua','481','Ala eu');
 select * from Endereco;
 select * from Telefone;
 select * from Cliente;
 
 -- Produto
 call addProduto ('Fone animers','Animers','01/01/2025','46.99','12','a','imagemDoFoneAnimers');
 call addProduto ('CAMISETA LOL THRESH','Camisetas','02/06/2023','39.90','5','A camiseta LOL Thresh é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no jogo eletrônico de estratégia League of Legends, conquistou fãs ao redor do mundo. Na Piticas, prezamos por qualidade, diversidade e conforto. A T-Shirt clássica confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã. - Modelo feminino veste tamanho 14 / Modelo masculino veste tamanho GG.','camisetalol.png');
 call addProduto ('Camiseta Dupla Face','Camisetas','02/06/2023','89.90','432','O doutor Stephen Vincent Strange era um brilhante neurocirurgião, porém egoísta e com um QI próximo a 177 pontos. Após um acidente de carro que danificou de forma bem severas suas mãos e dificultou sua capacidade de realizar cirurgias, Stephen Strange viajou pelo mundo em busca de uma cura e encontrou o Ancião. Após se tornar um dos antigos alunos do Mago Supremo, Strange se tornou um praticante tanto das artes místicas como das artes marciais. Além de conhecer muitos feitiços poderosos, ele possui dois objetos místicos que lhe concedem poderes adicionais: o Manto da Levitação e o Olho de Agamotto. Ao longo de sua jornada, Stephen é auxiliado por seu amigo, Wong, e uma grande variedade de objetos místicos. Ele passa a residir em uma mansão chamada Sanctum Sanctorum, localizada na cidade de Nova Iorque. Mais tarde, Strange ganha o título de Mago Supremo.','duplafacekk.png');
 call addProduto ('CAMISETA HARRY POTTER QUADRIBOL LUFA LUFA','Camisetas','02/06/2023','89.90','21','A camiseta Harry Potter Quadribol Lufa Lufa é um produto original, licenciado e exclusivo Piticas. Estampa inspirada na história do bruxo Harry Potter que conquistou milhares de fãs ao redor do mundo. Para quem é fã use e colecione sua camiseta Piticas. Na Piticas, prezamos por qualidade, diversidade e conforto. A T-Shirt clássica foi confeccionada em algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã. Composição: 100% Algodão.','.png');
 call addProduto ('CAMISETA LEAGUE OF LEGENDS AKALI','Camisetas','02/06/2023','79.90','54','A camiseta LOL Akali é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no jogo eletrônico de estratégia League of Legends, conquistou fãs ao redor do mundo. Na Piticas, prezamos por qualidade, diversidade e conforto. A T-Shirt clássica confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã. - Modelo veste tamanho GG.','.png');
 call addProduto ('CAMISETA DRAGON BALL KAMEHAMEHA','Camisetas','02/06/2023','69.90','796','A camiseta Dragon Ball Kamehameha, é um produto original, licenciado e exclusivo Piticas. Estampa inspirada no uniforme do Goku, o seu ideograma ¿Go¿, diferente do ideograma ¿Kame¿ e outros anteriormente utilizados por Goku que referiam-se aos seus mestres. O uso do ¿Go¿ é a representação de sua autossuficiência, de quem caminha e aprende por conta própria. Nas Mangas seu poder mais famoso entre os fãs, o kamehameha. E nas costas traz o personagem disparando seu poder com as assinaturas de Dragon Ball Super em Kanj. A T-Shirt clássica foi confeccionada em 100% algodão, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã.','.png');
 call addProduto ('CHINELO HAVAIANAS MARVEL PANTERA NEGRA','Acessórios','10/08/2023','59.90','2','O Chinelo Havaianas Marvel Pantera Negra é inspirado no universo Geek. Produzido em borracha, no modelo tradicional de tiras e com solado emborrachado, os chinelos garantem conforto máximo para te acompanhar em diversos momentos. Nas palmilhas, temos uma padronagem especial do Marvel, que lembra os quadrinhos! Selecionado pela Piticas para vestir o seu lado fã com muito orgulho. Todos os produtos são ORIGINAIS, enviados na sua embalagem original adquiridos diretamente das fábricas e seus distribuidores.','.png');
 call addProduto ('GARGANTILHA CHOKER PANTERA NEGRA','Acessórios','10/08/2023','119.90','32','A Bijuteria Choker Pantera Negra, é para você fã de Pantera Negra, esse choker é a peça perfeita para presentear quem você ama, conta com estilo autêntico, feita pelos nossos nerdsigners para vestir seu lado fã! Vista com orgulho, vista seu lado fã','.png');
 call addProduto ('SUPORTE PARA CELULAR POP HARRY POTTER: GRIFINÓRIA','Acessórios','10/08/2023','29.90','6','O Suporte Para Celular Pop Harry Potter: Grifinória é produto original e exclusido Piticas. Oferece uma pegada segura para que você possa digitar com uma mão, tirar melhores fotos e assistir a vídeos sem tocar no telefone, adere melhor em invólucros duros e lisos. Medida aproximida: 5cm','.png');
 call addProduto ('CHAVEIRO DRAGON BALL - VEGETA','Acessórios','10/08/2023','34.90','5','O Chaveiro Vegeta é um produto original e licenciado, exclusivo Piticas. Este produto é de Produção nacional e feito em 100% Polidoreto de Vinila. Prezamos pela qualidade e diversidade. Use e Colecione, expresse todo o seu lado fã. Medida do personagem: Altura: 6,30cm | Largura: 3,30cm','.png');
 call addProduto ('CHAVEIRO CORDÃO LEAGUE OF LEGENDS - KDA','Acessórios','10/08/2023','20','34','O Chaveiro Cordão League Of Legends - KDA é um produto original e licenciado, exclusivo Piticas. Confeccionado em 100% poliéster Premium de alta qualidade com tratamento para maior resistência com impressão digital/sublimação de alta definição (Não descasca), possuí fecho de encaixe para fácil manuseio do chaveiro. Use e Colecione, expresse todo o seu lado fã.','.png');
 call addProduto ('VARINHA HARRY POTTER','Acessórios','11/09/2027','199.90','29','Varinha do Harry Potter para colecionar, pacote misterioso. Cada pacote contém 1 varinha, no total são 9 modelos diferentes para montar sua coleção.
','.png');
 call addProduto ('MACHADO ELETRÔNICO DO THOR - STORMBREAKER: MARVEL VINGADORES: ULTIMATO','Acessórios','11/09/2027','1999.90','2','O Machado Eletrônico do Thor - Stormbreaker: Marvel Vingadores: Ultimato é um produto original e produzido pela Hasbro. Thor, filho de Odin, guerreiro com poder do trovão, usa os seus poderes para proteger tanto Asgard quanto o planeta terra do mal Thor empunha um machado após a sua maligna irmã destruir o seu martelo Mjölnir. Fãs e crianças podem imaginar-se em aventuras com os seus heróis favoritos, como Homem de Ferro, Capitão América, Homem-Aranha, Viúva Negra, Hulk, Pantera Negra e outros Vingadores! Imaginar-se derrotando Thanos com este Machado Eletrônico do Thor! Basta apertar um botão para ativar os sons. Agora, os fãs Marvel podem imaginar aventuras ao lado dos heróis com este item realístico inspirado no filme Vingadores: Ultimato!','.png');
 call addProduto ('NENDOROID 390 - LEVI - ATTACK ON TITAN','Acessórios','11/09/2027','','','','.png');
 call addProduto ('','Acessórios','11/09/2027','','','','.png');
 call addProduto ('','Acessórios','11/09/2027','','','','.png');
 
select * from Categoria;
select * from Produto;

-- Pedido
select * from Cliente;
call addPedido('Fone animers','Kaio','1');
select * from Pedido;


-- Delivrey
call addDelivery('1','23567789');
select * from Delivery;
select * from Endereco;


-- Devolucao
 call addDevolucao('1','1');   
 select * from Devolucao;
 
 -- Pagamento 
  call addPagamento ('47689557899','1','Parcelado');
 select * from Cliente;
 select * from Pagamento;
 
 -- Venda
call addVenda('1','12345678902','1');
select * from Pedido;
select * from Venda;
select * from Funcionario;
drop procedure addVenda;

call spSelectEmail('kupyskii@gmail.com');
select * from Cliente;