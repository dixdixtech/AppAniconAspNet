using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Pedido
    {
        public int Ped_Cod { get; set; }

        public int Prod_Cod { get; set; }

        public int Cli_Id { get; set; }

        public double Ped_valor { get; set; }
 
    }
}