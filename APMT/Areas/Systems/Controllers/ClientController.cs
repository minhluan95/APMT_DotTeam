using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using System.Data.Entity;

namespace APMT.Areas.Systems.Controllers
{
    public class ClientController : BaseController
    {
        private CP_SPMEntities1 db = new CP_SPMEntities1();

        // GET: System/Client
        public ActionResult Index()
        {
            var client = db.APMT_Company.OrderByDescending(x => x.ID).ToList();

            return View(client);

        }

        public JsonResult setStatus(int? id)
        {
            bool status = true;
            var company = db.APMT_Company.FirstOrDefault(x => x.ID == id);
            if (company.Allowed == true)
            {
                company.Allowed = false;
                company.Update_at = DateTime.Now;
                status = false;
            }
            else
            {
                company.Allowed = true;

                company.Update_at = DateTime.Now;
                status = true;
            }
            db.Entry(company).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new
            {
                status
            }, JsonRequestBehavior.AllowGet);
        }
    }
}