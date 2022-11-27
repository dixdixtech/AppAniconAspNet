using AniconAppAspNET.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;
using AniconAppAspNET.Models;
using AniconAppAspNET.Utils;
using System.Security.Claims;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace AniconAppAspNET.Controllers
{
    public class AutenticacaoController : Controller
    {
        public ActionResult Error(string mensagem)
        {
            //FAZENDO UMA VIEWBAG PARA ERRO
            ViewBag.error = "Entre em contato com o TI do site e passe a seguinte mensagem: {"+mensagem+"}";
            return View();
        }
    
        [HttpGet]
        public ActionResult Insert()
        {
            //CONECTANDO COM O BANCO
            MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);

            //FAZENDO O TRY CATCH CASO ALGUM ERRO COM A CONEXÃO ACONTEÇA
            try
            {
                conexao.Open();
            }
            catch (Exception e)
            {
                return RedirectToAction("Error", new { mensagem = e.Message }); //REDIRECIONANDO PARA A VIEW DE ERRO
            }
            finally
            {
                if (conexao.State == ConnectionState.Open)
                    conexao.Close();

            };
            return View();
        }

        [HttpPost]
        public ActionResult Insert(CadastroClienteViewModel vielModel) //MÉTODO DE INSERÇÃO DE CLIENTE [POST]
        {
            //VERIFICANDO O MODELSTATE
            if(!ModelState.IsValid)
                return View(vielModel);


            Cliente novoCliente = new Cliente //DECLARANDO O CLIENTE
            {
                //PASSANDO OS VALORES
                Cli_Cpf = vielModel.Cli_Cpf,
                Cli_Nome = vielModel.Cli_Nome,
                Cli_NomeSoc = vielModel.Cli_NomeSoc,
                Cli_Email = vielModel.Cli_Email,
                Cli_Senha = Hash.GerarHash(vielModel.Cli_Senha),
                Cli_DataNasc = vielModel.Cli_DataNasc,
                Cli_Sexo = vielModel.Cli_Sexo,
                Tel_Num = vielModel.Tel_Num,
                Cep = vielModel.Cep,
                Estado_Nome = vielModel.Estado_Nome,
                Cidade_Nome = vielModel.Cidade_Nome,
                Bairro_Nome = vielModel.Bairro_Nome,
                Logradouro = vielModel.Logradouro,
                Num_Res = vielModel.Num_Res,
                Complemento = vielModel.Complemento
            };
            
            var newcliente = new Cliente();
            newcliente.InsertCliente(novoCliente); // ACIONANDO O MÉTODO DE INSERT

            //ADICIONANDO UMA TEMP DATA DEPOIS DE CADASTRAR
            TempData["MsgLogin"] = "Cadastro realizado com sucesso! Faça o Login."; 

            return RedirectToAction("Login", "Autenticacao"); // REDIRECIONANDO PARA A VIEW LOGIN
        }

        public ActionResult SelectEmail(string vCli_Email) // MÉTODO DE SELECT DE EMAIL
        {
            bool LoginExists;
 
            string login = new Cliente().SelectCliEmail(vCli_Email);

            //VERIFICANDO SE O EMAIL EXISTE
            if (login.Length == 0)
            {
                LoginExists = false;
            }
            else
            {
                LoginExists = true;
            }
            return Json(!LoginExists, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Login(string ReturnUrl) //MÉTODO DE LOGIN
        {
            var viewmodel = new LoginViewModel //PEGANDO ATRIBUTO DE RETORNO DA VIEW MODEL DE LOGIN
            {
                UrlRetorno = ReturnUrl
            };
            return View(viewmodel);
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel viewmodel) //MÉTODO DE LOGIN [POST]
        {
            if (!ModelState.IsValid) //VERIFICANDO O MODEL STATE
            {
                return View(viewmodel);
            }

            //CONECTANDO COM O BANCO
            MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);

            //FAZENDO O TRY CATCH CASO ALGUM ERRO COM A CONEXÃO ACONTEÇA
            try
            {
                conexao.Open();
            }
            catch (Exception e)
            {
                return RedirectToAction("Error", new { mensagem = e.Message }); //REDIRECIONANDO PARA A VIEW DE ERRO
            }
            finally
            {
                if (conexao.State == ConnectionState.Open)
                    conexao.Close();

            };

            Cliente cliente = new Cliente(); //INSTANCIANDO O CLIENTE PELA MODEL CLIENTE
            cliente = cliente.SelectCliente(viewmodel.Cli_Email);//CHAMANDO O MÉTODO SELECCLIENTE


            if (cliente.Cli_Email != viewmodel.Cli_Email)//VERIFICANDO SE O EMAIL ESTÁ CORRETO
            {
                ModelState.AddModelError("Cli_Email", "Login Incorreto"); //DA UM ERRO SE O EMAIL ESTIVER ERRADO
                return View(viewmodel);
            }
            if(cliente.Cli_Senha != Hash.GerarHash(viewmodel.Cli_Senha))//VERIFICANDO SE A SENHA ESTÁ CORRETA
            {
                ModelState.AddModelError("Cli_Senha", "Senha Incorreta");//ERRO SE A SENHA ESTIVER ERRADA
                return View(viewmodel);
            }

            var identity = new ClaimsIdentity(new[] //USANDO A IDENTIDADE
            {
                new Claim(ClaimTypes.Name, cliente.Cli_Nome), //DEFININDO O NOME DO CLAIM TYPE COMO O NOME DO CLIENTE
                new Claim("Cli_Email", cliente.Cli_Email)
            }, "AppAplicationCookie");

            Request.GetOwinContext().Authentication.SignIn(identity); //AUTENTIDANDO E LOGANDO

            if (!String.IsNullOrWhiteSpace(viewmodel.UrlRetorno) || Url.IsLocalUrl(viewmodel.UrlRetorno))
                return Redirect(viewmodel.UrlRetorno); 
            else
                return RedirectToAction("Index", "Home");//SE ESTIVER TUDO CORRETO, RETORNO A VIEW HOME
        }
        
        public ActionResult Logout() //MÉTODO DE LOGOUT
        {
            Request.GetOwinContext().Authentication.SignOut("AppAplicationCookie"); //PEGANDO O COOKIE E DANDO LOGOUT
            return RedirectToAction("Index", "Home");
        }


        [Authorize]
        public ActionResult Alterarsenha() //MÉTODO DE ALTERAR SENHA
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Alterarsenha(AlterarSenhaViewModel viewmodel)//MÉTODO DE ALTERAR SENHA [POST]
        {
            if (!ModelState.IsValid) //VERIFICANDO MODEL STATE
            {
                return View();
            }

            var identity = User.Identity as ClaimsIdentity; //PEGANDO O USUÁRIO PELO CLAIMS IDENTITY
            var login = identity.Claims.FirstOrDefault(c => c.Type == "Cli_Email").Value; //USUÁRIO DEFINIDO PELO EMAIL

            Cliente cliente = new Cliente();
            cliente = cliente.SelectCliente(login); //DANDO SELECT NO CLIENTE

            if (Hash.GerarHash(viewmodel.SenhaAtual) != cliente.Cli_Senha) 
            {
                //SE A SENHA ATUAL FOR DIFERENTE DA SENHA DO BANCO DE DADOS, DA ERRO
                ModelState.AddModelError("SenhaAtual", "Senha incorreta");
                return View();
            }

            if (Hash.GerarHash(viewmodel.NovaSenha) == cliente.Cli_Senha)
            {
                //SE A NOVA SENHA FOR IGUAL A DO BANCO DE DADOS, DA ERRO
                ModelState.AddModelError("NovaSenha", "A nova senha é igual a antiga");
                return View();
            }

            //SE ESTIVER TUDO BEM, ALTERA A SENHA
            cliente.Cli_Senha = Hash.GerarHash(viewmodel.NovaSenha);

            cliente.UpdateSenha(cliente);

            //MENSAGEM QUANDO A SENHA FOR ALTERADA
            TempData["MsgLogin"] = "Senha alterada com sucesso!";

            return RedirectToAction("Index", "Home"); // REDIRECIONANDO PARA A INDEX DA HOME
        }

      
    }
}