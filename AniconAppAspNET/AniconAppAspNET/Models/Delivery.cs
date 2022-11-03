using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Delivery
    {
        public int Deliv_Cod { get; set; }

        public int Ped_ID { get; set; }

        public string Cep { get; set; }

        public DateTime Deliv_Data { get; set; }

    
    }
}