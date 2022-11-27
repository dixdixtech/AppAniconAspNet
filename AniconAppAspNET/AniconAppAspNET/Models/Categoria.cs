using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using MySql.Data.MySqlClient;
using System.Configuration;
using MySql.Data.Types;
using AniconAppAspNET.ViewModels;

namespace AniconAppAspNET.Models
{
    public class Categoria
    {
        public int Categ_Id { get; set; }

        [Display(Name= "Categoria")]
        [Required(ErrorMessage = "A Categoria é obrigatória")]
        public string Categ_Nome { get; set; }



        MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public List<Categoria> ListAllCateg()
        {
            conexao.Open();
            command.CommandText = "select * from Categoria;"; 
            command.Connection = conexao;

            var readCateg = command.ExecuteReader();
            List<Categoria> tempCategList = new List<Categoria>();

            while (readCateg.Read())
            {
                var tempCateg = new Categoria();

                tempCateg.Categ_Id = int.Parse(readCateg["Categ_Id"].ToString());
                tempCateg.Categ_Nome = readCateg["Categ_Nome"].ToString();
                

                tempCategList.Add(tempCateg);
            }

            readCateg.Close();
            conexao.Close();

            return tempCategList;
        }
    }
}