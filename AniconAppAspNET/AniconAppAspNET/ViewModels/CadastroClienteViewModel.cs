using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using AniconAppAspNET.Models;

namespace AniconAppAspNET.ViewModels
{
    public class CadastroClienteViewModel
    {
        
        [Display(Name = "Nome")]
        [Required(ErrorMessage = "O nome é obrigatório")]
        [MaxLength(100)]
        public string Cli_Nome { get; set; }

        [MaxLength(50)]
        [Display(Name = "Nome Social")]
        public string Cli_NomeSoc { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "O email é obrigatório")]
        [MaxLength(100)]
        public string Cli_Email { get; set; }

        [Display(Name = "Senha")]
        [Required(ErrorMessage = "O campo \'senha\' é obrigatório.")]
        [MaxLength(100, ErrorMessage = "a senha deve conter no máximo 100 caracteres")]
        [MinLength(5, ErrorMessage = "A senha deve conter no mínimo 5 caracteres")]
        [DataType(DataType.Password)]
        public string Cli_Senha { get; set; }

        [Display(Name = "Confirme a senha")]
        [Required(ErrorMessage = "Confirme a senha")]
        [DataType(DataType.Password)]
        [Compare(nameof(Cli_Senha), ErrorMessage = "As senhas são diferentes")]
        public string ConfirmarSenha { get; set; }

        [Display(Name = "CEP")]
        [Required(ErrorMessage = "O CEP é obrigatório")]
        [StringLength(8, ErrorMessage = "O CEP deve possuir 8 números")]
        public string Cep { get; set; }

        [Required(ErrorMessage = "O telefone é obrigatório")]
        [StringLength(11, ErrorMessage = "O telefone deve possuir 11 números")]
        public int Telefone { get; set; }

        [Required(ErrorMessage = "A data de nascimento é obrigatória")]
        [DataType(DataType.Date)]
        public DateTime Cli_DataNasc { get; set; }


        [Required(ErrorMessage = "O CPF é obrigatório")]
        [StringLength(11, ErrorMessage = "O CPF deve possuir 11 números")]

        public string Cli_Cpf { get; set; }

        [Required(ErrorMessage = "O campo sexo é obrigatório")]
        public string Cli_Sexo { get; set; }

        [Required(ErrorMessage ="O Logradouro é obrigatório")]
        [MinLength(1, ErrorMessage ="Favor inserir o Logradouro")]
        [MaxLength(100, ErrorMessage ="O Logradouro deve ter até 100 caracteres")]
        public string Logradouro { get; set; }

        [Required(ErrorMessage = "O bairro é obrigatório")]
        [MinLength(1, ErrorMessage = "Favor inserir o bairro")]
        [MaxLength(100, ErrorMessage = "O Bairro deve ter até 100 caracteres")]
        public string Bairro { get; set; }

        [Required(ErrorMessage = "A cidade é obrigatória")]
        [MinLength(1, ErrorMessage = "Favor inserir a Cidade")]
        [MaxLength(100, ErrorMessage = "A cidade deve ter até 100 caracteres")]
        public string Cidade { get; set; }


        [Required(ErrorMessage = "O estado é obrigatório")]
        [MinLength(1, ErrorMessage = "Favor inserir o Estado")]
        [MaxLength(100, ErrorMessage = "O Estado deve ter até 100 caracteres")]
        public string Estado { get; set; }


    }
}