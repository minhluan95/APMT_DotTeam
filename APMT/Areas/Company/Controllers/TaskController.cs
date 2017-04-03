using Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace APMT.Areas.Company.Controllers
{
    public class TaskController : BaseController
    {
        CP_SPMEntities1 db = new CP_SPMEntities1();
        public ActionResult Create(int id)
        {
            var act = db.APMT_Activity.FirstOrDefault(x => x.ID == id);
            ViewBag.ac = act;
            return PartialView();
        }
        [HttpPost]
        public ActionResult Create(APMT_Task t,int id)
        {
            
            t.Activity_Id = id;
            if (ModelState.IsValid)
            {
                db.APMT_Task.Add(t);
                db.SaveChanges();
            }
            return View("SetupActivity", "DefineProcess",new { id = t.APMT_Activity.Process_Id});
        }
        public ActionResult Edit(int id)
        {
            var task = db.APMT_Task.FirstOrDefault(x => x.ID == id);
            return PartialView(task);
        }
        [HttpPost]
        public ActionResult Edit([Bind(Include = "ID,Name,Description,Weight,Predecessor,Activity_Id")] APMT_Task t)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t).State = EntityState.Modified;
                db.SaveChanges();
                return View("SetupActivity", "DefineProcess", new { id = t.APMT_Activity.Process_Id });
            }
            return View(t);
            
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var p = db.APMT_Task.FirstOrDefault(x => x.ID == id);
            return PartialView(p);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirm(int id)
        {
            var p = db.APMT_Task.FirstOrDefault(x => x.ID == id);
            db.APMT_Task.Remove(p);
            db.SaveChanges();
            return View("SetupActivity", "DefineProcess", new { id = p.APMT_Activity.Process_Id });
        }
    }
}