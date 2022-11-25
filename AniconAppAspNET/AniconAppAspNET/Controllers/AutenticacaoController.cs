using AniconAppAspNET.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AniconAppAspNET.Models;
using AniconAppAspNET.Utils;

namespace AniconAppAspNET.Controllers
{
    public class AutenticacaoController : Controller
    {
        [HttpGet]
        public ActionResult Insert()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Insert(CadastroClienteViewModel vielModel)
        {
            if(!ModelState.IsValid)
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
            

            

            return RedirectToAction("Index", "Home");
        }

        public ActionResult SelectEmail(string Email)
        {
            bool LoginExists;
 
            string login = new Cliente().SelectEmail(Email);

            if (login.Length == 0)
                LoginExists = false;
            else
                LoginExists = true;
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
    }
}