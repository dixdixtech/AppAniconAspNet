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
using System.IO;
using AniconAppAspNET.ViewModels.Produto;
using Image = System.Drawing.Image;
using AniconAppAspNET.Utils;
using AniconAppAspNET.ViewModels.Categoria;

namespace AniconAppAspNET.Controllers
{
    public class ProdutoController : Controller
    {
        // GET: Produto
        public ActionResult IndexProd()
        {

            var tempProdList = new Produto().ListAllProds();
            var tempProdViewList = new List<ListAllProdViewModel>();

            foreach (var tempProd in tempProdList)
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

        [HttpGet]
        public ActionResult CadProdAnicon()
        {
            passDropDownListValues();
            return View();
        }

        [HttpPost]
        public ActionResult CadProdAnicon(CadProdViewModel prod, HttpPostedFileBase Prod_Img)
        {

            if (Prod_Img != null && Prod_Img.ContentLength > 0)
            {
                if (ModelState.IsValid)
                {
                    if (Prod_Img != null && Prod_Img.ContentLength > 0)
                    {
                        string extension = Path.GetExtension(Prod_Img.FileName).ToLower();

                        if (extension.Equals(".jpg") || extension.Equals(".png") || extension.Equals(".jpeg"))
                        {
                            string fileName = Hash.GenerateMD5(
                                    string.Format("{0:HH:mm:ss tt}", DateTime.Now) + Prod_Img.FileName
                                ) + extension;

                            string imgPath = Path.Combine(Server.MapPath("/Content/Images/"), fileName);

                            var width = Image.FromStream(Prod_Img.InputStream).Width;
                            var height = Image.FromStream(Prod_Img.InputStream).Height;
                            bool imgSaved = new ImageCrop().SaveCroppedImage(Image.FromStream(Prod_Img.InputStream), width, height, imgPath);

                            if (imgSaved)
                            {
                                prod.Prod_Img = "/Content/Images/" + fileName;
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("Prod_Img", "A imagem deve ser do tipo .jpg/.png/.jpeg");
                            return View(prod);
                        }


                        Produto tempProd = new Produto();
                        tempProd.Prod_Nome = prod.Prod_Nome;
                        tempProd.nome_Categ = new Categoria { Categ_Nome = prod.nome_categ.Categ_Nome };
                        tempProd.Prod_Garant = prod.Prod_Garant;
                        tempProd.Prod_Val = prod.Prod_Val;
                        tempProd.Prod_QuantEstoq = prod.Prod_QuantEstoq;
                        tempProd.Prod_Descri = prod.Prod_Descri;
                        tempProd.Prod_Img = prod.Prod_Img;


                        new Produto().InsertProduto(tempProd);

                        return RedirectToAction("Index", "Home");
                    }
                }

                ModelState.AddModelError("Prod_Img", "Selecione a imagem novamente");
            }
            else
            {
                prod.Prod_Img = "/Content/Images/proddefault.jpg";
            }
            passDropDownListValues();
            return View(prod);
        }

        private void passDropDownListValues()
        {
            // DropDown das Categorias
            var tempCategList = new Categoria().ListAllCateg();
            var tempCategDropList = new List<DropViewCateg>();

            for (var i = 0; i < tempCategList.Count; i++)
            {
                var tempCategDrop = new DropViewCateg();
                tempCategDrop.Categ_Id = tempCategList[i].Categ_Id;
                tempCategDrop.Categ_Nome = tempCategList[i].Categ_Nome;

                tempCategDropList.Add(tempCategDrop);
            }

            ViewBag.Categoria = tempCategDropList;

        }
    }
}