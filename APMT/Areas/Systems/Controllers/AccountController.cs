using System;
using System.Linq;
using System.Web.Mvc;
using Models;
using Common;
using System.Data.Entity;

namespace APMT.Areas.Systems.Controllers
{
    public class AccountController : BaseController
    {
        private CP_SPMEntities1 db = new CP_SPMEntities1();
        [Route("/systems/log-in")]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]

        public ActionResult Login(string email, string password)
        {
            var user = db.APMT_User.FirstOrDefault(x => x.Email == email && x.Password == password);
            if (user != null && user.Allowed == 1)
            {

                Session["userid"] = user.ID;
                Session["email"] = user.Email;
                Session["fullname"] = user.Fullname;
                Session["avatar"] = user.Avatar;
                Session["createat"] = user.Create_at;
                Session["usercompanyid"] = db.APMT_Company_User.FirstOrDefault(x => x.User_id == user.ID).ID;

                return RedirectToAction("Index", "Dashboard");

            }
            else if (user.Allowed == 0)
            {
                ViewBag.error = "Your account has been blocked!";
            }
            else
            {
                ViewBag.error = "Login fail! Your email or password invalid";
            }
            
            return View();
        }
        public ActionResult Logout()
        {
            Session["userid"] = null;
            Session["email"] = null;
            Session["fullname"] = null;
            Session["avatar"] = null;
            Session["userpermission"] = null;
            return RedirectToAction("Login");
        }
        [Route("page-not-found")]
        public ActionResult PageNotFound()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgotPassword(string email)
        {
            var user = db.APMT_User.FirstOrDefault(x => x.Email.Equals(email));
            if (user == null)
            {
                ViewBag.mgse = "Email not found!";
            }
            string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/mailtemplate/forgotpassword.html"));
            content = content.Replace("{{id}}", user.ID.ToString());

            new MailHelper().SendMail(email, "Forgot password", content);
            ViewBag.mgsc = "Please check email to reset password";
            return View();
        }
        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ResetPassword(int id)
        {
            var user = db.APMT_User.FirstOrDefault(x => x.ID == id);
            return View(user);
        }
        [HttpPost]
        public ActionResult ResetPassword([Bind(Include = "ID,Email,Password,FullName,Avatar,Create_at,Update_at,Allowed,IsProAdmin")] APMT_User u)
        {
            u.Update_at = DateTime.Now;
            if (ModelState.IsValid)
            {

                db.Entry(u).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.mgs = "Update password successful!";
            }
            return View("Login");
        }

    }
}