using AniconAppAspNET.Models;
using AniconAppAspNET.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace AniconAppAspNET.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string search)
        {
            var tempProdViewList = new List<ListAllProdViewModel>();
            var tempProdList = new List<Produto>();
            if (search == null)
            {
                tempProdList = new Produto().ListAllProds();//CHAMANDO O MÉTODO DE LISTAR TODOS OS PRODUTOS
            }
            else
            {
                tempProdList = new Produto().SearchProd(search);//CHAMANDO O MÉTODO DE LISTAR TODOS OS PRODUTOS
            }

            foreach (var tempProd in tempProdList)
            {
                //DEFININDO OS CAMPOS DA LISTA
                var tempProdView = new ListAllProdViewModel();
                tempProdView.Prod_Cod = tempProd.Prod_Cod;
                tempProdView.Prod_Nome = tempProd.Prod_Nome;
                tempProdView.Prod_Val = tempProd.Prod_Val;
                tempProdView.Prod_Descri = tempProd.Prod_Descri;
                tempProdView.Prod_Img = tempProd.Prod_Img;

                tempProdViewList.Add(tempProdView);
            }

            return View(tempProdViewList);
        }

        [HttpGet]
        public ActionResult DetalhesProduto(string Prod_Cod)//DETALHES DO PRODUTO
        {
            if (Prod_Cod == null)
            {
                //SE O CÓDIGO DO PRODUTO FOR NULO, REDIRECIONA PARA A INDEX DOS PRODUTOS
                return RedirectToAction("Index", "Home");
            }

            //LISTANDO O PRODUTO PELO CÓDIGO DELE
            var tempProd = new Produto().ListProdByCod(Prod_Cod);

            return View(tempProd);
        }

    }  
}