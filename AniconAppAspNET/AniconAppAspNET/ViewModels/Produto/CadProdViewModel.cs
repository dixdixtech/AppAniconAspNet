using AniconAppAspNET.ViewModels.Categoria;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.ViewModels.Produto
{
    public class CadProdViewModel
    {
        //public int Prod_Cod { get; set; }

        [Display(Name = "Nome")]
        [Required(ErrorMessage = "O nome é obrigatório")]
        [MinLength(4, ErrorMessage = "O nome deve ter no mínimo 4 caracteres")]
        [MaxLength(100, ErrorMessage = "O nome deve ter no máximo 100 caracteres")]
        public string Prod_Nome { get; set; }

        //[Display(Name = "Categoria")]
        //[Required(ErrorMessage = "A categoria é obrigatória")]
        //public string Categ_Nome { get; set; }

        [Display(Name = "Categoria")]
        [Required(ErrorMessage = "A categoria é obrigatória")]
        public DropViewCateg nome_categ { get; set; }

        [Display(Name = "Garantia")]
        [Required(ErrorMessage = "A garantia é obrigatória")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime Prod_Garant { get; set; }

        [Display(Name = "Preço")]
        [Required(ErrorMessage = "O preço é obrigatório")]
        public double Prod_Val { get; set; }

        [Display(Name = "Quantidade do Estoque")]
        [Required(ErrorMessage = "A quantidade do estoque é obrigatória")]
        [Range(1, 500, ErrorMessage = "A quantidade do estoque deve ser no minimo 1 e no máximo 500")]
        public int Prod_QuantEstoq { get; set; }

        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "A descrição é obrigatória")]
        [MinLength(10, ErrorMessage = "A descrição deve ter no mínimo 10 caracteres")]
        [MaxLength(1500, ErrorMessage = "A descrição deve ter no máximo 1500 caracteres")]
        public string Prod_Descri { get; set; }

        [Display(Name = "Imagem")]
        [Required(ErrorMessage = "A imagem é obrigatória")]
        public string Prod_Img { get; set; }
    }
}