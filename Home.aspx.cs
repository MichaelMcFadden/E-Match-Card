using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RefereeMatchCard
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        /*****************************************************************************************************************
                CREATE NEW MATCH BUTTON
         ****************************************************************************************************************/
        protected void createNewMatchButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("CreateNewMatch.aspx", true);
        }


        /*****************************************************************************************************************
                CREATE CURRENT MATCH BUTTON
         ****************************************************************************************************************/
        protected void currentMatchButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("CurrentMatch.aspx", true);
        }

        /*****************************************************************************************************************
                CREATE ARCHIVE  BUTTON
         ****************************************************************************************************************/
        protected void oldMatchesButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("OldMatch.aspx", true);
        }

        /*****************************************************************************************************************
                CREATE SETTINGS BUTTON
         ****************************************************************************************************************/
        protected void settingsButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Settings.aspx", true);
        }

        /*****************************************************************************************************************
                CREATE LOG OUT BUTTON AND CLEAR SESSIONS AND COOKIES
         ****************************************************************************************************************/
        protected void LogOutButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            // clear session cookie 
            SessionStateSection sessionStateSection = (SessionStateSection)WebConfigurationManager.GetSection("system.web/sessionState");
            HttpCookie cookie2 = new HttpCookie(sessionStateSection.CookieName, "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);
            FormsAuthentication.RedirectToLoginPage();
            Response.Redirect("~/Login.aspx");
        }
    }
}