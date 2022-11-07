using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Devolucao
    {
        public int Devol_Cod { get; set; }

        public int fkPed_Cod { get; set; }

        public int fkDeliv_Cod { get; set; }

        public double Devol_ValReem { get; set; }
       
    }
}