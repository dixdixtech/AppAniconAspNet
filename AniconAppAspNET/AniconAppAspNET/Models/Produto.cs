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

        public int fkCateg_Id { get; set; }

        public string Prod_Nome { get; set; }

        public DateTime Prod_Garant { get; set; }

        public double Prod_Val { get; set; }

        public int Prod_QuantEstoq { get; set; }

        public string Prod_Img { get; set; }


        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();
    }
}