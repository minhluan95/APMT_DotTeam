﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace APMT.Areas.Company.Controllers
{
    public class DashBoardController : BaseController
    {
        [Route("/company")]
        public ActionResult Index()
        {
            return View();
        }
    }
}