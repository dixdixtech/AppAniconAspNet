using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Produto
    {
        public int Prod_Cod { get; set; }

        public int Categ_Nome { get; set; }

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
    }
}