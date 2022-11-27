using AniconAppAspNET.ViewModels.Produto;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AniconAppAspNET.Models
{
    public class Produto
    {
        //public int Prod_Cod { get; set; }

        //public string Categ_Nome { get; set; }

        public Categoria nome_Categ { get; set;}

        public string Prod_Nome { get; set; }

        public DateTime Prod_Garant { get; set; }

        public double Prod_Val { get; set; }

        public int Prod_QuantEstoq { get; set; }

        public string Prod_Descri { get; set;}

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

    }
}