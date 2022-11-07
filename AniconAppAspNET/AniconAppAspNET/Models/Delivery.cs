using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AniconAppAspNET.Models
{
    public class Delivery
    {
        public int Deliv_Cod { get; set; }

        public int fkPed_ID { get; set; }

        public string fkCep { get; set; }

        public DateTime Deliv_Data { get; set; }

    
    }
}