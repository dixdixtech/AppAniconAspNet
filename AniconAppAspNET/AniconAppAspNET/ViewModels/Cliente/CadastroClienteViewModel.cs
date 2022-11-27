using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using AniconAppAspNET.Models;
using Compare = System.ComponentModel.DataAnnotations.CompareAttribute;
using System.Web.Mvc;


namespace AniconAppAspNET.ViewModels
{
    public class CadastroClienteViewModel
    {
        [Required(ErrorMessage = "O CPF é obrigatório")]
        [RegularExpression(@"([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})", ErrorMessage = "Preencha um CPF válido, ex.:123.456.789-00")]
        [Display(Name = "CPF")]
        public string Cli_Cpf { get; set; }

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
        [Remote("SelectEmail", "Autenticacao", ErrorMessage = "O email já está cadastrado!")]
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

        [Required(ErrorMessage = "A data de nascimento é obrigatória")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name = "Data de Nascimento")]
        public DateTime Cli_DataNasc { get; set; }

        [Required(ErrorMessage = "O campo sexo é obrigatório")]
        [Display(Name = "Sexo")]
        public string Cli_Sexo { get; set; }

        [Display(Name = "Telefone")]
        [Required(ErrorMessage = "O telefone é obrigatório")]
        [RegularExpression(@"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$", ErrorMessage = "O telefone deve ter essa estrutura:(xx)xxxxx-xxxx")]
        public string Tel_Num { get; set; }

        [Display(Name = "CEP")]
        [Required(ErrorMessage = "O CEP é obrigatório")]
        [RegularExpression(@"^\d{5}-\d{3}$", ErrorMessage = "Preencha um CEP válido, ex.: 12345-678")]
        public string Cep { get; set; }

        [Display(Name = "Estado")]
        [Required(ErrorMessage = "O estado é obrigatório")]
        [MinLength(1, ErrorMessage = "Favor inserir o Estado")]
        [MaxLength(100, ErrorMessage = "O Estado deve ter até 100 caracteres")]
        public string Estado_Nome { get; set; }

        [Display(Name = "Cidade")]
        [Required(ErrorMessage = "A cidade é obrigatória")]
        [MinLength(1, ErrorMessage = "Favor inserir a Cidade")]
        [MaxLength(100, ErrorMessage = "A cidade deve ter até 100 caracteres")]
        public string Cidade_Nome { get; set; }

        [Display(Name = "Bairro")]
        [Required(ErrorMessage = "O bairro é obrigatório")]
        [MinLength(1, ErrorMessage = "Favor inserir o bairro")]
        [MaxLength(100, ErrorMessage = "O Bairro deve ter até 100 caracteres")]
        public string Bairro_Nome { get; set; }

        [Required(ErrorMessage = "O Logradouro é obrigatório")]
        [MinLength(1, ErrorMessage = "Favor inserir o Logradouro")]
        [MaxLength(150, ErrorMessage = "O Logradouro deve ter até 100 caracteres")]
        public string Logradouro { get; set; }

        [Display(Name = "Número de Residência")]
        [Required(ErrorMessage = "O número da residência é obrigatório")]
        public int Num_Res { get; set; }


        [MinLength(1, ErrorMessage = "Favor inserir o complemento")]
        public string Complemento { get; set; }
    }
}