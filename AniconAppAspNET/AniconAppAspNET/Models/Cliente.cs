﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Cliente
    {
        public int Cli_ID { get; set; }

        public string Cep { get; set; }

        public int Tel_Id { get; set; }

        public string Cli_Nome { get; set; }

        public string Cli_NomeSoc { get; set; }
        
        public string Cli_Email { get; set; }

        public string Cli_Senha { get; set; }

        public DateTime Cli_DataNasc {  get; set; }

        public string Cli_Cpf { get; set; }

        public string Cli_Sexo { get; set; }

    
    }
}