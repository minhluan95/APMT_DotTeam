using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace APMT.Areas.Systems.Controllers
{
    public class DashBoardController : Controller
    {
        // GET: Systems/DashBoard
        public ActionResult Index()
        {
            return View();
        }
    }
}