using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AniconAppAspNET.ViewModels;
using AniconAppAspNET.Models;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace AniconAppAspNET.Controllers
{
    public class ProdutoController : Controller
    {
        // GET: Produto
        public ActionResult IndexProd()
        {
            
            var tempProdList = new Produto().ListAllProds();
            var tempProdViewList = new List<ListAllProdViewModel>();

            foreach(var tempProd in tempProdList)
            {
                var tempProdView = new ListAllProdViewModel();
                    tempProdView.Prod_Nome = tempProd.Prod_Nome;
                    tempProdView.Prod_Val = tempProd.Prod_Val;
                    tempProdView.Prod_Descri = tempProd.Prod_Descri;
                    tempProdView.Prod_Img = tempProd.Prod_Img;

                tempProdViewList.Add(tempProdView);
            }

            return View(tempProdViewList);
        }
    }
}