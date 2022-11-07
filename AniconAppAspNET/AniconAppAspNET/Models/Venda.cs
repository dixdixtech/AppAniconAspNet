using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Venda
    {
        public int Venda_Cod { get; set; }

        public int fkPed_Cod { get; set; }

        public int fkFunc_Id { get; set; }

        public int fkPagto_Cod { get; set; }

    }
}