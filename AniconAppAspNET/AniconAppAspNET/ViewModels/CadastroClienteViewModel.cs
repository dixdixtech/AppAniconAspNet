using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace AniconAppAspNET.ViewModels
{
    public class CadastroClienteViewModel
    {
        
        [Display(Name = "Nome")] 
        public string Cli_Nome { get; set; }

        public string Cli_NomeSoc { get; set; }

        public string Cli_Email { get; set; }

        public string Cli_Senha { get; set; }

        public string ConfirmarSenha { get; set; }

        public string Cep { get; set; }

        public int Telefone { get; set; }

        public DateTime Cli_DataNasc { get; set; }

        public string Cli_Cpf { get; set; }

        public string Cli_Sexo { get; set; }
    }
}