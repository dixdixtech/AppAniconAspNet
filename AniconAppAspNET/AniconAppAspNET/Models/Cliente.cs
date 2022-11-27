using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using MySql.Data.MySqlClient;
using System.Configuration;
using MySql.Data.Types;
using AniconAppAspNET.ViewModels;
using System.Drawing;
using System.Web.UI.WebControls;

namespace AniconAppAspNET.Models
{
    public class Cliente
    {

        public string Cli_Cpf { get; set; }


        public string Cli_Nome { get; set; }


        public string Cli_NomeSoc { get; set; }


        public string Cli_Email { get; set; }


        public string Cli_Senha { get; set; }


        public DateTime Cli_DataNasc { get; set; }


        public string Cli_Sexo { get; set; }


        public string Tel_Num { get; set; }


        public string Cep { get; set; }


        public string Estado_Nome { get; set; }



        public string Cidade_Nome { get; set; }


        public string Bairro_Nome { get; set; }


        public string Logradouro { get; set; }


        public int Num_Res { get; set; }


        public string Complemento { get; set; }

        MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();
        

        public void InsertCliente(Cliente cliente)
        {
            conexao.Open();
            command.CommandText = "call addCliente (@Cli_Cpf, @Cli_Nome, @Cli_NomeSoc, @Cli_Email, " +
                "@Cli_Senha, @Cli_DataNasc, @Cli_Sexo, @Tel_Num, @Cep, @Estado_Nome, @Cidade_Nome, @Bairro_Nome, @Logradouro," +
                " @Num_Res, @Complemento)";
            command.Parameters.Add("@Cli_Cpf", MySqlDbType.VarChar).Value = cliente.Cli_Cpf;
            command.Parameters.Add("@Cli_Nome", MySqlDbType.VarChar).Value = cliente.Cli_Nome;
            command.Parameters.Add("@Cli_NomeSoc", MySqlDbType.VarChar).Value = cliente.Cli_NomeSoc;
            command.Parameters.Add("@Cli_Email", MySqlDbType.VarChar).Value = cliente.Cli_Email;
            command.Parameters.Add("@Cli_Senha", MySqlDbType.VarChar).Value = cliente.Cli_Senha;
            command.Parameters.Add("@Cli_DataNasc", MySqlDbType.DateTime).Value = cliente.Cli_DataNasc;
            command.Parameters.Add("@Cli_Sexo", MySqlDbType.VarChar).Value = cliente.Cli_Sexo;
            command.Parameters.Add("@Tel_Num", MySqlDbType.VarChar).Value = cliente.Tel_Num;
            command.Parameters.Add("@Cep", MySqlDbType.VarChar).Value = cliente.Cep;
            command.Parameters.Add("@Estado_Nome", MySqlDbType.VarChar).Value = cliente.Estado_Nome;
            command.Parameters.Add("@Cidade_Nome", MySqlDbType.VarChar).Value = cliente.Cidade_Nome;
            command.Parameters.Add("@Bairro_Nome", MySqlDbType.VarChar).Value = cliente.Bairro_Nome;
            command.Parameters.Add("@Logradouro", MySqlDbType.VarChar).Value = cliente.Logradouro;
            command.Parameters.Add("@Num_Res", MySqlDbType.Int32).Value = cliente.Num_Res;
            command.Parameters.Add("@Complemento", MySqlDbType.VarChar).Value = cliente.Complemento;
            command.Connection = conexao;
            command.ExecuteNonQuery();
            conexao.Close();

        }

        public string SelectCliEmail(string vCli_Email)
        {
            conexao.Open();
            command.CommandText = "call spSelectEmail(@Cli_Email);";
            command.Parameters.Add("@Cli_Email", MySqlDbType.VarChar).Value = vCli_Email;
            command.Connection = conexao;
            string email = (string)command.ExecuteScalar();
            conexao.Close();
            if (email == null)
            {
                email = "";
                
            }
            return email;
        }

        public Cliente SelectCliente(string vEmail)
        {
            conexao.Open();
            command.CommandText = "call spSelectCliente(@Cli_Email);";
            command.Parameters.Add("@Cli_Email", MySqlDbType.VarChar).Value = vEmail;
            command.Connection = conexao;
            var lerCliente = command.ExecuteReader();
            var tempCliente = new Cliente();

            if (lerCliente.Read())
            {
                tempCliente.Cli_Cpf = lerCliente["Cli_Cpf"].ToString();
                tempCliente.Cli_Nome = lerCliente["Cli_Nome"].ToString();
                tempCliente.Cli_NomeSoc = lerCliente["Cli_NomeSoc"].ToString();
                tempCliente.Cli_Email = lerCliente["Cli_Email"].ToString();
                tempCliente.Cli_Senha = lerCliente["Cli_Senha"].ToString();
                tempCliente.Cli_DataNasc = DateTime.Parse(lerCliente["Cli_DataNasc"].ToString());
                tempCliente.Cli_Sexo = lerCliente["Cli_Sexo"].ToString();
                tempCliente.Tel_Num = lerCliente["Tel_Id"].ToString();
                tempCliente.Cep = lerCliente["Cep"].ToString();
            };
            lerCliente.Close();
            conexao.Close();
            return tempCliente;
    
        } 

        public void UpdateSenha(Cliente cliente)
        {
            conexao.Open();
            command.CommandText = "call spUpdateSenha(@Cli_Email, @Cli_Senha);";
            command.Parameters.Add("@Cli_Email", MySqlDbType.VarChar).Value = cliente.Cli_Email;
            command.Parameters.Add("@Cli_Senha", MySqlDbType.VarChar).Value = cliente.Cli_Senha;
            command.Connection = conexao;
            command.ExecuteNonQuery();
            conexao.Close();
        }


    }
}