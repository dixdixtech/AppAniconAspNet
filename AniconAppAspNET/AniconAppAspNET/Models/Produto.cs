using AniconAppAspNET.ViewModels.Produto;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AniconAppAspNET.Models
{
    public class Produto
    {
        public int Prod_Cod { get; set; }

        [Display(Name = "Categoria")]
        public Categoria nome_Categ { get; set; }

        [Display(Name = "Nome")]
        public string Prod_Nome { get; set; }

        [Display(Name = "Garantia")]
        public DateTime Prod_Garant { get; set; }

        [Display(Name = "Preço")]
        public double Prod_Val { get; set; }

        [Display(Name = "Quantidade do Estoque")]
        public int Prod_QuantEstoq { get; set; }

        [Display(Name = "Descrição")]
        public string Prod_Descri { get; set; }

        [Display(Name = "Imagem")]
        public string Prod_Img { get; set; }


        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();


        public List<Produto> ListAllProds()
        {
            connection.Open();
            command.CommandText = "SELECT * FROM Produto;"; // Selecionando todos os campos da tabela Produto
            command.Connection = connection;

            var readProd = command.ExecuteReader();
            List<Produto> tempProdList = new List<Produto>();

            while (readProd.Read())
            {
                var tempProd = new Produto();
                tempProd.Prod_Cod = int.Parse(readProd["Prod_Cod"].ToString());
                tempProd.Prod_Nome = readProd["Prod_Nome"].ToString();
                tempProd.Prod_Val = double.Parse(readProd["Prod_Val"].ToString());
                tempProd.Prod_Descri = readProd["Prod_Descri"].ToString();
                tempProd.Prod_Img = readProd["Prod_Img"].ToString();
                tempProdList.Add(tempProd);
            }

            readProd.Close();
            connection.Close();

            return tempProdList;
        }

        public void InsertProduto(Produto prod)
        {
            connection.Open();
            command.CommandText = "call addProduto(@Prod_Nome, @Categ_Nome, @Prod_Garant, @Prod_Val, @Prod_QuantEstoq," +
                " @Prod_Descri, @Prod_Img);";
            command.Parameters.Add("@Prod_Nome", MySqlDbType.VarChar).Value = prod.Prod_Nome;
            command.Parameters.Add("@Categ_Nome", MySqlDbType.VarChar).Value = prod.nome_Categ.Categ_Nome;
            command.Parameters.Add("@Prod_Garant", MySqlDbType.DateTime).Value = prod.Prod_Garant;
            command.Parameters.Add("@Prod_Val", MySqlDbType.Double).Value = prod.Prod_Val;
            command.Parameters.Add("@Prod_QuantEstoq", MySqlDbType.Int64).Value = prod.Prod_QuantEstoq;
            command.Parameters.Add("@Prod_Descri", MySqlDbType.VarChar).Value = prod.Prod_Descri;
            command.Parameters.Add("@Prod_Img", MySqlDbType.VarChar).Value = prod.Prod_Img;
            command.Connection = connection;
            command.ExecuteNonQuery();
            connection.Close();

        }

        public Produto ListProdByCod(string Prod_Cod)
        {
            connection.Open();
            command.CommandText = "select Prod_Nome,categ.Categ_Nome, Prod_Garant, Prod_Val, " +
                "Prod_QuantEstoq, Prod_Descri, Prod_Img from Produto prod inner join Categoria " +
                "categ on prod.Categ_Id = categ.Categ_Id " +
                "WHERE Prod_Cod= @Prod_Cod;";
            command.Parameters.Add("@Prod_Cod", MySqlDbType.Int64).Value = Prod_Cod;
            command.Connection = connection;

            var readProd = command.ExecuteReader();
            var tempProd = new Produto();

            if (readProd.Read())
            {
                tempProd.Prod_Nome = readProd["Prod_Nome"].ToString();
                tempProd.nome_Categ = new Categoria { Categ_Nome = readProd["Categ_Nome"].ToString() } ;
                tempProd.Prod_Garant = DateTime.Parse(readProd["Prod_Garant"].ToString());
                tempProd.Prod_Val = double.Parse(readProd["Prod_Val"].ToString());
                tempProd.Prod_QuantEstoq = int.Parse(readProd["Prod_QuantEstoq"].ToString());
                tempProd.Prod_Descri = readProd["Prod_Descri"].ToString();
                tempProd.Prod_Img = readProd["Prod_Img"].ToString();
            }

            readProd.Close();
            connection.Close();

            return tempProd;
        }
    }
}