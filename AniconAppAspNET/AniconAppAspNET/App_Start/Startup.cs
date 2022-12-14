using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;
using Microsoft.Owin.Security.Cookies;
using System.Web.Helpers;

[assembly: OwinStartup(typeof(AniconAppAspNET.App_Start.Startup))]

namespace AniconAppAspNET.App_Start
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //INICIALIZANDO O COOKIE
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = "AppAplicationCookie",
                LoginPath = new PathString("/Autenticacao/Login")
            });

            //IDENTIFICANDO O CAMPO DO LOGIN
            AntiForgeryConfig.UniqueClaimTypeIdentifier = "Cli_Email";
 

        }
    }
}
