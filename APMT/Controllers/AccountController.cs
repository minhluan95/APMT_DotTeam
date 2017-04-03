using System.Web.Mvc;
using Models;

namespace APMT.Controllers
{

    public class AccountController : Controller
    {
        private CP_SPMEntities1 db = new CP_SPMEntities1();
        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(APMT_User u)
        {
            if (ModelState.IsValid)
            {
                db.APMT_User.Add(u);
                db.SaveChanges();
            }
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(APMT_Company c)
        {
            if (ModelState.IsValid)
            {
                db.APMT_Company.Add(c);
                db.SaveChanges();
            }
            return View();
        }
    }
}