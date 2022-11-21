using AniconAppAspNET.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AniconAppAspNET.Models;

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
                Cli_Senha = vielModel.Cli_Senha,
                Cli_DataNasc = vielModel.Cli_DataNasc,
                Cli_Sexo = vielModel.Cli_Sexo
            };

            Telefone novotelefone = new Telefone
            {
                Tel_Num = vielModel.Tel_Num
            };

            Endereco novoendereco = new Endereco 
            {
                Cep = vielModel.Cep,
                Logradouro = vielModel.Logradouro,
                Num_Res = vielModel.Num_Res,
                Complemento = vielModel.Complemento

            };

            Estado novoestado = new Estado
            {
                Estado_Nome = vielModel.Estado_Nome
            };

            Cidade novacidade = new Cidade
            {
                Cidade_Nome = vielModel.Cidade_Nome
            };

            Bairro novobairro = new Bairro
            {
                Bairro_Nome = vielModel.Bairro_Nome
            };

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
    }
}