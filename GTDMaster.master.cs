using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GTDMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // Check if session has expired
        if (HttpContext.Current.Session["UserId"] == null)
        {
            string sessionToken = null;

            // Check if the cookie exists before accessing its Value
            if (HttpContext.Current.Request.Cookies["SessionId"] != null)
            {
                sessionToken = HttpContext.Current.Request.Cookies["SessionId"].Value;
            }

            if (!string.IsNullOrEmpty(sessionToken))
            {
                SessionManager.Expire_At(sessionToken);
            }

            Response.Redirect("/templates/login/LoginMain.aspx");
            return; 
        }

        // Proceed if session is valid
        string newSession = HttpContext.Current.Session["SessionId"].ToString();
        int userId = Convert.ToInt32(HttpContext.Current.Session["UserId"]);

       
    }
}
