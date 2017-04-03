using System.Linq;
using System.Web.Mvc;
using Models;
using System.Data.Entity;

namespace APMT.Areas.Systems.Controllers
{
    public class UserController : Controller
    {
        private CP_SPMEntities1 db = new CP_SPMEntities1();

        // GET: System/ManageUser
        public ActionResult Index()
        {
            var user = db.APMT_User.OrderByDescending(x => x.ID).ToList();
            return View(user);

        }

        public JsonResult setProAdministrator(int? id)
        {
            var user = db.APMT_User.FirstOrDefault(x => x.ID == id);
            user.IsProAdmin = !user.IsProAdmin;
            db.SaveChanges();
            return Json(new
            {
                user.IsProAdmin
            }, JsonRequestBehavior.AllowGet);

        }

        public ActionResult setUser(int? id)
        {
            var user = db.APMT_User.FirstOrDefault(x => x.ID == id);
            user.IsProAdmin = false;
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("View_List");
        }

        public JsonResult setStatus(int? id)
        {
            bool status = true;
            var user = db.APMT_User.FirstOrDefault(x => x.ID == id);
            if (user.Allowed == 1)
            {
                user.Allowed = 0;
                status = false;
            }
            else
            {
                user.Allowed = 1;
                status = true;
            }
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new
            {
                status
            }, JsonRequestBehavior.AllowGet);

        }



        public ActionResult viewInfor_User(int? id)
        {

            APMT_User user = db.APMT_User.Find(id);

            ViewBag.User = user;

            return View(user);
        }

       
        public ActionResult Update_Profile()
        {
            return View();
        }


    }
}