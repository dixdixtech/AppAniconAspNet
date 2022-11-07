using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Endereco
    {
        public string Cep { get; set; }

        public int fkEstado_Id { get; set; }

        public int fkCidade_Id { get; set; }

        public int fkBairro_Id { get; set; }

        public string Logradouro { get; set; }

        public int Num_Res { get; set; }
        
        public string Complemento { get; set; }


    }
}