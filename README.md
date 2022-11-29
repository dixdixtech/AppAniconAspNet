# AppAniconAspNet

## Descrição do Projeto
<p align="center">Este é um projeto de TCC, realizado por alunos do curso de Desenvolvimento de Sistemas Integrado ao Médio da escola ETEC Professor Basilides de Godoy.</p>
<p align="center">Este TCC reune conhecimentos desde o primeiro ano de curso.</p>
<p align="center">O sistema em questão é feito por uma empresa fictícia chamada DixTech. O cliente que pediu o sistema é uma loja de produtos da cultura pop japonesa, chamada Anicon.</p>
<p align="center">A aplicação consiste em um e-commerce que conecta com o banco de dados MySql para fazer as operações necessárias.</p>

## Desenvolvedores do projeto

Arthur Renan Gutierrez Dias Pereira - Desenvolvedor Back-End
Rodrigo Barreto Moraes Costa - Desenvolvedor Front-End

# Como usar o Sistema ASP.NET da Anicon:

## 1° Passo - instalação:

Baixe o projeto zipado e extraia tudo.

Ou

Copie o código do projeto e clone ele no Git Bash/Git Hub Desktop


## 2° Passo - Banco de dados:

Antes de tudo, se a sua senha do MySql for "12345678", tudo será mais fácil.
Se a sua senha for outra, mais para frente irá ser explicado o que fazer.

Abra o seu MySql e aperte CTRL+SHIFT+O, ou Vá em File -> Open SQL Script nas opções de menu.

Vá aonde você extraiu o zip do projeto ou aonde você clonou o projeto.

Siga o caminho de pastas a seguir:


AppAniconAspNet -> AniconAppAspNET -> AniconAppAspNET -> Scripts -> Banco de Dados

Irá aparecer dois scripts, abra o "Banco.sql", depois abra o "Comandos.sql".

Rode o script "Banco.sql".

Rode o script "Comandos.sql".


## 3° Passo - Visual Studio:

Novamente, vá aonde você extraiu o zip do projeto ou aonde você clonou o projeto.

AppAniconAspNet -> AniconAppAspNET

Abra o arquivo AniconAppAspNET.sln

Você será redirecionado para o Visual Studio.

Se a sua senha do MySql do usuário root NÃO for "12345678", siga as seguintes instruções:

Pela Solution Explorer, localizada à direita do seu Visual Studio, procure a pasta Web.Config.
CUIDADO: o arquivo Web.Config também está presente dentro da pasta View, MAS ESSE NÃO SERA USADO.
O Web.Config que SERÁ USADO é o que está lá embaixo, sendo o último arquivo do PROJETO EM SI.

Após abrir ele, procure a parte que está comentada (caracterizada pela cor verde), nela será
instruída aonde você irá SUBSTITUIR a senha que está lá pela sua senha ATUAL do usuário ROOT do 
seu MySQL.


## INICIAÇÃO:

Na parte superior do Visual Studio tem uma seta verde e que do lado está escrito ISS EXPRESS.

Clique nesta opção e rode o Sistema da Anicon :)


OPCIONAL:

Se você quiser cadastrar algum produto, vá na url do site, e digite "/Produto/CadProdAnicon" 
depois do localhost. EXEMPLO: https://localhost:12345/Produto/CadProdAnicon

OU

Termine a execução do sistema e na Solution Explorer vá na pasta Views -> Produto -> 
CadProdAnicon.cshtml

E inicie o sistema a partir desse arquivo.


