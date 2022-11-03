using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Produto
    {
        public int Prod_Cod { get; set; }

        public int Categ_Id { get; set; }
        public string Prod_Nome { get; set; }

        public DateTime Prod_Garant { get; set; }

        public double Prod_Val { get; set; }

        public int Prod_QuantEstoq { get; set; }

        public string Prod_Img { get; set; }

       
    }
}