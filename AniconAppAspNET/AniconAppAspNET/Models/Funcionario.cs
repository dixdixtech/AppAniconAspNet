using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Funcionario
    {
        public int Func_Id { get; set; }

        public string Func_Nome { get; set; }

        public string Func_NomeSoc { get; set; }

        public string Func_Cargo { get; set; }

        public DateTime Func_DataNasc { get; set; }

        public int fkTel_Id { get; set; }

        public string fkCep { get; set; }

        public string Func_Cpf { get; set; }

        public string Func_Email { get; set; }

        public string Func_Senha { get; set; }

        public string Func_Sexo { get; set; }
    }
}