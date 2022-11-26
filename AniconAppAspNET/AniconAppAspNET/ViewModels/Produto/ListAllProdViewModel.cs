using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.ViewModels
{
    public class ListAllProdViewModel
    {
        [Display(Name = "Nome")]
        public string Prod_Nome { get; set; }

        //public DateTime Prod_Garant { get; set; }

        [Display(Name = "Preço")]
        public double Prod_Val { get; set; }

        //public int Prod_QuantEstoq { get; set; }

        [Display(Name = "Descrição")]
        public string Prod_Descri { get; set; }

        [Display(Name = "Imagem")]
        public string Prod_Img { get; set; }
    }
}