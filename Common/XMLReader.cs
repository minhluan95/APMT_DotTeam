using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using System.Web;
using System.Data;

namespace Common
{
   public class XMLReader
    {
        public List<APMT_Activity_to_Activity> RetrunListOfProducts(string xml)
        {

            string xmlData = xml;
            DataSet ds = new DataSet();//Using dataset to read xml file  
            ds.ReadXml(xmlData);
            var products = new List<APMT_Activity_to_Activity>();
            foreach(var item in ds.Tables[0].AsEnumerable())
            {
                
            }
            products = (from rows in ds.Tables[0].AsEnumerable()
                        select new APMT_Activity_to_Activity
                        {
                            FromAc = Convert.ToInt32(rows[0].ToString()), //Convert row to int  
                            ToAC = Convert.ToInt32(rows[1].ToString())
                        }).ToList();
            return products;
        }
    }
}
