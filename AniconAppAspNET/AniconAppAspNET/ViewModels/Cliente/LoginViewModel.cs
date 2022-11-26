using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.ViewModels
{
    public class LoginViewModel
    {
        public string UrlRetorno { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage ="Informe o Email")]
        [MaxLength(200, ErrorMessage = "O email deve ter até 200 caracteres")]
        [MinLength(20, ErrorMessage = "O email deve ter pelo menos 20 caracteres")]
        public string Cli_Email { get; set; }

        [Display(Name = "Senha")]
        [Required(ErrorMessage ="Informe a senha")]
        [MinLength(6, ErrorMessage ="A senha deve ter pelo menos 6 caracteres")]
        [DataType(DataType.Password)]
        public string Cli_Senha { get; set; }
    }
}