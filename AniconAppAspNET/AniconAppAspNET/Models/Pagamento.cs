using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Pagamento
    {
        public int Pagto_Cod { get; set; }

        public int fkCli_Id { get; set; }

        public string Pagto_Tipo { get; set; }
    }
}