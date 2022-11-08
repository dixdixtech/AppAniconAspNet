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
        [Required]
        [MaxLength(100)]
        public string Cli_Nome { get; set; }

        [MaxLength(50)]
        [Display(Name = "Nome Social")]
        public string Cli_NomeSoc { get; set; }

        [Display(Name = "Email")]
        [Required]
        [MaxLength(100)]
        public string Cli_Email { get; set; }

        [Display(Name = "Senha")]
        [Required(ErrorMessage = "O campo \'senha\' é obrigatório.")]
        [MaxLength(100, ErrorMessage = "a senha deve conter no máximo 100 caracteres")]
        [MinLength(5, ErrorMessage = "A senha deve conter no mínimo 5 caracteres")]
        [DataType(DataType.Password)]
        public string Cli_Senha { get; set; }

        [Display(Name = "Nome")]
        [Required]
        [MaxLength(20)]
        public string ConfirmarSenha { get; set; }

        [Display(Name = "CEP")]
        [Required]
        [MaxLength(8)]
        public string Cep { get; set; }

        [Required]
        [MaxLength(11)]
        public int Telefone { get; set; }

        public DateTime Cli_DataNasc { get; set; }

        public string Cli_Cpf { get; set; }

        public string Cli_Sexo { get; set; }
    }
}