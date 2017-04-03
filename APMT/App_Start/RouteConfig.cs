using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace APMT
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Register Company",
                url: "register-company",
                defaults: new { controller = "Account", action = "Register", id = UrlParameter.Optional },
                namespaces: new[] { "APMT.Controllers" }
            );
            routes.MapRoute(
                name: "Register user",
                url: "sign-up",
                defaults: new { controller = "Account", action = "Signup", id = UrlParameter.Optional },
                namespaces: new[] { "APMT.Controllers" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "APMT.Controllers" }
            );
        }
    }
}
