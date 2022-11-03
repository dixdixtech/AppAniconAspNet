using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Endereco
    {
        public string Cep { get; set; }

        public int Estado_Id { get; set; }

        public int Cidade_Id { get; set; }

        public int Bairro_Id { get; set; }

        public string Logradouro { get; set; }

        public int Num_Res { get; set; }
        
        public string Complemento { get; set; }


    }
}