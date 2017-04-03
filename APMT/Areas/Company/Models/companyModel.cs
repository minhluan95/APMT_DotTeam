using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APMT.Areas.Company.Models
{
    public class companyModel
    {
        public int ID { set; get; }
        public string Name { set; get; }
        public Nullable<bool> isallowed { set; get; }
    }
}