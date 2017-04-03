using Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using System.Runtime.Serialization.Json;
using System.IO;

namespace APMT.Areas.Company.Controllers
{
    public class DefineProcessController : BaseController
    {
        CP_SPMEntities1 db = new CP_SPMEntities1();
        public ActionResult Process()
        {

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Process(APMT_Process p)
        {

            if (ModelState.IsValid)
            {
                p.JsonContent = "{\"nodeDataArray\": [],\"linkDataArray\": []}";
                p.Allowed = true;
                p.Creator_Id = int.Parse(Session["usercompanyid"].ToString());
                db.APMT_Process.Add(p);
                db.SaveChanges();

                return RedirectToAction("Index", new { id = p.ID });
            }
            else
            {
                return View(p);
            }
        }
        [HttpGet]
        public ActionResult Index(int id)
        {
            var process = db.APMT_Process.FirstOrDefault(x => x.ID == id);
            return View(process);
        }

        public string updateProcess(int id, string jsoncontent)
        {
            string mgs = "";
            var process = db.APMT_Process.FirstOrDefault(x => x.ID == id);
            process.JsonContent = jsoncontent;
            process.ID = id;
            process.Name = process.Name;
            process.Description = process.Description;
            process.Creator_Id = process.Creator_Id;
            process.Allowed = process.Allowed;
            db.Entry(process).State = EntityState.Modified;
            db.SaveChanges();
            mgs = "Saved";
            return mgs;
        }
        public ActionResult View_List()
        {
            var p = db.APMT_Process.ToList().OrderByDescending(y => y.ID);
            return View(p);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var process = db.APMT_Process.FirstOrDefault(x => x.ID == id);
            return View(process);
        }
        [HttpPost]
        public ActionResult Edit([Bind(Include = "ID,Name,JsonContent,Description,Creator_id,Allowed")] APMT_Process p)
        {

            if (ModelState.IsValid)
            {
                db.Entry(p).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("View_List");
            }
            return View(p);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var p = db.APMT_Process.FirstOrDefault(x => x.ID == id);
            return View(p);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirm(int id)
        {
            var p = db.APMT_Process.FirstOrDefault(x => x.ID == id);
            db.APMT_Process.Remove(p);
            db.SaveChanges();
            return RedirectToAction("View_List");
        }
        public ActionResult Define()
        {
            return View();
        }

        public ActionResult SetupTask()
        {
            return View();
        }
        public int[] GetKey(int id)
        {
            var key = db.APMT_Activity.Where(x => x.Process_Id == id).Select(x=>x.activity_key);
            int[] a = key.ToArray();
            return a;
        }
        public ActionResult SaveActivity(int id)
        {
            var process = db.APMT_Process.FirstOrDefault(x => x.ID == id);
            DataSet dataSet = JsonConvert.DeserializeObject<DataSet>("{" + process.JsonContent.Substring(process.JsonContent.IndexOf("\"nodeDataArray\""), process.JsonContent.IndexOf("\"linkDataArray\"") - process.JsonContent.IndexOf("\"nodeDataArray\"")) + "}");
            var demo = "{" + process.JsonContent.Substring(process.JsonContent.IndexOf("\"linkDataArray\""));

            
            DataTable dataTable = dataSet.Tables["nodeDataArray"];
            
            db.sp_deletetask(id);
            int[] k = new int[dataTable.Rows.Count];int i = 0;
            foreach (DataRow row in dataTable.Rows)
            {
                k[i] = int.Parse(row["key"].ToString());
                i++;
            }
            foreach(var item in GetKey(id))
            {
                if (Array.Exists(k,e=>e==item)==false)
                {
                    db.APMT_Activity.Remove(db.APMT_Activity.FirstOrDefault(x=>x.Process_Id==id&&x.activity_key==item));
                    db.SaveChanges();
                }
            }
            foreach (DataRow row in dataTable.Rows)
            {
                if (Array.Exists(GetKey(id),x=>x== int.Parse(row["key"].ToString()))==false)
                {
                    APMT_Activity a = new APMT_Activity();
                    a.Name = row["text"].ToString();
                    a.Category = row["Category"].ToString();
                    a.activity_key = int.Parse(row["key"].ToString());
                    a.Description = "";
                    a.Process_Id = process.ID;
                    a.Weigth = 0;
                    a.Type_id = 1;
                    db.APMT_Activity.Add(a);
                    db.SaveChanges();
                }
                
            }
           
            return RedirectToAction("SetupActivity", new { id = id });
        }
        public ActionResult SetupActivity(int id)
        {
            ViewBag.processid = id;
            var activity = db.APMT_Activity.Where(x => x.Process_Id == id && x.Category.Equals("Activity")).ToList();
            ViewBag.ProcessName = db.APMT_Process.FirstOrDefault(x => x.ID == id).Name;
            return View(activity);
        }

        public ActionResult ManageRole()
        {
            return View();
        }

        public ActionResult ManageDocument()
        {
            return View();
        }
        public void SetViewBag(int? selectedId = null)
        {
            ViewBag.Type_id = new SelectList(db.APMT_Activity_Type.ToList(), "ID", "Name", selectedId);
        }
        public ActionResult ActivityDetail(int id)
        {
            var act = db.APMT_Activity.FirstOrDefault(x => x.ID == id);
            ViewBag.Task = db.APMT_Task.Where(x => x.Activity_Id == id).OrderBy(x => x.Predecessor).ToList();
            ViewBag.Type = db.APMT_Activity_Type.ToList();
            SetViewBag(act.Type_id);
            return PartialView(act);
        }
        [HttpPost]
        public ActionResult UpdateActivity([Bind(Include = "ID,Name,Description,Weigth,Process_id,Type_id,activity_key,Category")]APMT_Activity a)
        {
            if (ModelState.IsValid)
            {
                db.Entry(a).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("SetupActivity",new {id=a.Process_Id });
            }
            return View(a);
        }
        [HttpGet]
        public ActionResult DeleteTask(int id)
        {
            var p = db.APMT_Task.FirstOrDefault(x => x.ID == id);
            return View(p);
        }
        [HttpPost, ActionName("DeleteTask")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmTask(int id)
        {
            var p = db.APMT_Task.FirstOrDefault(x => x.ID == id);
            db.APMT_Task.Remove(p);
            db.SaveChanges();
            return RedirectToAction("View_List");
        }
    }
}