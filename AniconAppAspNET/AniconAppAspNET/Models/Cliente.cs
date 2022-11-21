using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using MySql.Data.MySqlClient;
using System.Configuration;
using MySql.Data.Types;

namespace AniconAppAspNET.Models
{
    public class Cliente
    {
        public int Cli_ID { get; set; }

        public string fkCep { get; set; }

        public int fkTel_Id { get; set; }

        
        public string Cli_Nome { get; set; }

        public string Cli_NomeSoc { get; set; }
        
        public string Cli_Email { get; set; }

        public string Cli_Senha { get; set; }

        public DateTime Cli_DataNasc {  get; set; }

        public string Cli_Cpf { get; set; }

        public string Cli_Sexo { get; set; }

        MySqlConnection conexao = new MySqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
        MySqlCommand command = new MySqlCommand();

        public void IsnertCliente(Cliente cliente, Endereco endereco, Telefone telefone, Cidade cidade, 
            Bairro bairro, Estado estado)
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
            command.Parameters.Add("@Cli_DataNasc", MySqlDbType.Date).Value = cliente.Cli_DataNasc;
            command.Parameters.Add("@Cli_Sexo", MySqlDbType.VarChar).Value = cliente.Cli_Sexo;
            command.Parameters.Add("@Tel_Num", MySqlDbType.VarChar).Value = telefone.Tel_Num;
            command.Parameters.Add("@Cep", MySqlDbType.VarChar).Value = endereco.Cep;
            command.Parameters.Add("@Estado_Nome", MySqlDbType.VarChar).Value = estado.Estado_Nome;
            command.Parameters.Add("@Cidade_Nome", MySqlDbType.VarChar).Value = cidade.Cidade_Nome;
            command.Parameters.Add("@Bairro_Nome", MySqlDbType.VarChar).Value = bairro.Bairro_Nome;
            command.Parameters.Add("@Logradouro", MySqlDbType.VarChar).Value = endereco.Logradouro;
            command.Parameters.Add("@Num_Res", MySqlDbType.Int16).Value = endereco.Num_Res;
            command.Parameters.Add("@Complemento", MySqlDbType.VarChar).Value = endereco.Complemento;
            command.Connection = conexao;
            command.ExecuteNonQuery();
            conexao.Close();

        }
    }
}