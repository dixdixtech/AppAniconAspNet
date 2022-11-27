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
        // ACTION RESULT DOS PRODUTOS
        public ActionResult IndexProd()
        {

            var tempProdList = new Produto().ListAllProds();//CHAMANDO O MÉTODO DE LISTAR TODOS OS PRODUTOS
            var tempProdViewList = new List<ListAllProdViewModel>(); 

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
        public ActionResult CadProdAnicon() //CADASTRO DE PRODUTOS
        {
            passDropDownListValues();//CHAMANDO O DROPDOWN DA CATEGORIA
            return View();
        }

        [HttpPost]
        //CADASTRO DE PRODUTOS [POST]
        public ActionResult CadProdAnicon(CadProdViewModel prod, HttpPostedFileBase Prod_Img)
        {

            if (Prod_Img != null && Prod_Img.ContentLength > 0)//VERIFICANDO SE A IMAGEM NÃO É NULA
            {
                if (ModelState.IsValid) //VERIFICANDO O MODEL STATE
                {
                    if (Prod_Img != null && Prod_Img.ContentLength > 0)//VERIFICANDO SE A IMAGEM NÃO É NULA
                    {
                        string extension = Path.GetExtension(Prod_Img.FileName).ToLower(); //COMEÇANDO O CAMINHO

                        //VERIFICANDO SE A EXTENSÃO É VÁLIDA
                        if (extension.Equals(".jpg") || extension.Equals(".png") || extension.Equals(".jpeg"))
                        {

                            string fileName = Hash.GenerateMD5(
                                    string.Format("{0:HH:mm:ss tt}", DateTime.Now) + Prod_Img.FileName
                                ) + extension;

                            //DEFININDO O CAMINHO DA IMAGEM
                            string imgPath = Path.Combine(Server.MapPath("/Content/Images/"), fileName);

                            //MUDANDO A ALTURA E LARGURA
                            var width = Image.FromStream(Prod_Img.InputStream).Width;
                            var height = Image.FromStream(Prod_Img.InputStream).Height;
                            bool imgSaved = new ImageCrop().SaveCroppedImage(Image.FromStream(Prod_Img.InputStream), width, height, imgPath);

                            //VERIFICANDO SE SALVOU A IMAGEM
                            if (imgSaved)
                            {
                                //SE SALVOU, DEFINE O CAMINHO INTEIRO DA IMAGEM, JUNTO COM O SEU NOME E EXTENSÃO
                                prod.Prod_Img = "/Content/Images/" + fileName;
                            }
                        }
                        else
                        {
                            // SE A EXTENSÃO DA IMAGEM FOR INVÁLIDA, DA ERRO
                            ModelState.AddModelError("Prod_Img", "A imagem deve ser do tipo .jpg/.png/.jpeg");
                            return View(prod);
                        }

                        //COLOCANDO OS CAMPOS
                        Produto tempProd = new Produto();
                        tempProd.Prod_Nome = prod.Prod_Nome;
                        tempProd.nome_Categ = new Categoria { Categ_Nome = prod.nome_categ.Categ_Nome };
                        tempProd.Prod_Garant = prod.Prod_Garant;
                        tempProd.Prod_Val = prod.Prod_Val;
                        tempProd.Prod_QuantEstoq = prod.Prod_QuantEstoq;
                        tempProd.Prod_Descri = prod.Prod_Descri;
                        tempProd.Prod_Img = prod.Prod_Img;

                        //INSERINDO O PRODUTO NO MÉTODO
                        new Produto().InsertProduto(tempProd);

                        return RedirectToAction("Index", "Home");// REDIRECIONANDO PARA A INDEX DA HOME
                    }
                }

                //SE ACONTECER ALGUM ERRO, IRÁ SER COBRADO A SELEÇÃO DA IMAGEM NOVAMENTE
                ModelState.AddModelError("Prod_Img", "Selecione a imagem novamente");
            }
            else
            {
                //SE A IMAGEM NÃO FOR LIDA, SERÁ DEFINIDA UMA IMAGEM DEFAULT
                prod.Prod_Img = "/Content/Images/proddefault.jpg";
            }
            passDropDownListValues();// CHAMANDO O DROPDOWN DA CATEGORIA
            return View(prod);
        }

        private void passDropDownListValues() //MÉTODO DE DROPDOWN DA CATEGORIA
        {
            // CHAMANDO O MÉTODO DE LISTAR TODAS AS CATEGORIAS
            var tempCategList = new Categoria().ListAllCateg();
            var tempCategDropList = new List<DropViewCateg>();

            for (var i = 0; i < tempCategList.Count; i++)
            {
                //DEFININDO OS CAMPOS A SEREM DROPADOS
                var tempCategDrop = new DropViewCateg();
                tempCategDrop.Categ_Id = tempCategList[i].Categ_Id;
                tempCategDrop.Categ_Nome = tempCategList[i].Categ_Nome;

                tempCategDropList.Add(tempCategDrop);
            }

            //DEFININDO UMA VIEWBAG
            ViewBag.Categoria = tempCategDropList;

        }

        [HttpGet]
        public ActionResult DetalhesProduto(string Prod_Cod)//DETALHES DO PRODUTO
        {   
            if (Prod_Cod == null || Prod_Cod == "")
            {
                //SE O CÓDIGO DO PRODUTO FOR NULO, REDIRECIONA PARA A INDEX DOS PRODUTOS
                return RedirectToAction("IndexProd", "Produto");
            }

            //LISTANDO O PRODUTO PELO CÓDIGO DELE
            var tempProd = new Produto().ListProdByCod(Prod_Cod);

            return View(tempProd);
        }
    }
}