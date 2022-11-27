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
            ViewBag.error = "Entre em contato com o TI do site e passe a seguinte mensagem: {"+mensagem+"}";
            return View();
        }

        [HttpGet]
        public ActionResult Insert()
        {
            MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);

            try
            {
                conexao.Open();
            }
            catch (Exception e)
            {
                return RedirectToAction("Error", new { mensagem = e.Message });
            }
            finally
            {
                if (conexao.State == ConnectionState.Open)
                    conexao.Close();

            };
            return View();
        }

        [HttpPost]
        public ActionResult Insert(CadastroClienteViewModel vielModel)
        {
            if (!ModelState.IsValid)
                return View(vielModel);

            Cliente novoCliente = new Cliente
            {
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
            newcliente.InsertCliente(novoCliente);


            TempData["MsgLogin"] = "Cadastro realizado com sucesso! Faça o Login.";

            return RedirectToAction("Login", "Autenticacao");
        }

        public ActionResult SelectEmail(string vCli_Email)
        {
            bool LoginExists;
 
            string login = new Cliente().SelectCliEmail(vCli_Email);

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

        public ActionResult Login(string ReturnUrl)
        {
            var viewmodel = new LoginViewModel
            {
                UrlRetorno = ReturnUrl
            };
            return View(viewmodel);
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel viewmodel)
        {
            if (!ModelState.IsValid)
            {
                return View(viewmodel);
            }

            MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);

            try
            {
                conexao.Open();
            }
            catch (Exception e)
            {
                return RedirectToAction("Error", new { mensagem = e.Message });
            }
            finally
            {
                if (conexao.State == ConnectionState.Open)
                    conexao.Close();

            };

            Cliente cliente = new Cliente();
            cliente = cliente.SelectCliente(viewmodel.Cli_Email);

            if(cliente.Cli_Email != viewmodel.Cli_Email)
            {
                ModelState.AddModelError("Cli_Email", "Login Incorreto");
                return View(viewmodel);
            }
            if(cliente.Cli_Senha != Hash.GerarHash(viewmodel.Cli_Senha))
            {
                ModelState.AddModelError("Cli_Senha", "Senha Incorreta");
                return View(viewmodel);
            }

            var identity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Name, cliente.Cli_Email),
                new Claim("Cli_Email", cliente.Cli_Email)
            }, "AppAplicationCookie");

            Request.GetOwinContext().Authentication.SignIn(identity);

            if (!String.IsNullOrWhiteSpace(viewmodel.UrlRetorno) || Url.IsLocalUrl(viewmodel.UrlRetorno))
                return Redirect(viewmodel.UrlRetorno);
            else
                return RedirectToAction("Perfil", "Home");
        }
        
        public ActionResult Logout()
        {
            Request.GetOwinContext().Authentication.SignOut("AppAplicationCookie");
            return RedirectToAction("Index", "Home");
        }


        [Authorize]
        public ActionResult Alterarsenha()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult Alterarsenha(AlterarSenhaViewModel viewmodel)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var identity = User.Identity as ClaimsIdentity;
            var login = identity.Claims.FirstOrDefault(c => c.Type == "Cli_Email").Value;

            Cliente cliente = new Cliente();
            cliente = cliente.SelectCliente(login);

            if (Hash.GerarHash(viewmodel.SenhaAtual) != cliente.Cli_Senha)
            {
                ModelState.AddModelError("SenhaAtual", "Senha incorreta");
                return View();
            }

            if (Hash.GerarHash(viewmodel.NovaSenha) == cliente.Cli_Senha)
            {
                ModelState.AddModelError("NovaSenha", "A nova senha é igual a antiga");
                return View();
            }

            cliente.Cli_Senha = Hash.GerarHash(viewmodel.NovaSenha);

            cliente.UpdateSenha(cliente);

            TempData["MsgLogin"] = "Senha alterada com sucesso!";

            return RedirectToAction("Index", "Home");
        }

      
    }
}