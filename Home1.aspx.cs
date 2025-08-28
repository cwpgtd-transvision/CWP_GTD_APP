using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Drawing2D;
using System.Text;

public partial class Home1 : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   
    [WebMethod]
    public static string bindSidemenu()
    {
        StringBuilder result = new StringBuilder();
        try
        {
            result.Append(" <ul class='nav nav-sidebar' data-nav-type='accordion'>");


            if (HttpContext.Current.Session["UserId"] == null)
            {
                string sessionToken = null;

                // Check if the cookie exists before accessing its Value
                var cookie = HttpContext.Current.Request.Cookies["SessionId"];
                if (cookie != null)
                {
                    sessionToken = cookie.Value;
                }

                if (!string.IsNullOrEmpty(sessionToken))
                {
                    SessionManager.Expire_At(sessionToken);
                }

                // Instead of Response.Redirect (won't work in WebMethod)
                // Return a special code so the client JS can handle redirection
                return "SESSION_EXPIRED";
            }

            Param[0] = HttpContext.Current.Session["ROLE_ID"].ToString();

            if (Param[0] == null)
            {
                return "";
            }


            PName[0] = "@ROLEID";
            Count = 1;

            DataTable dt = SqlCmd.SelectData("SP_ROLE_PERMISSION_Q6", Param, PName, Count);
            string Mainmenuid = dt.Rows[0]["MENUID"].ToString();
            string Childmenuid = dt.Rows[0]["SUB_MENUID"].ToString();
            string Nestedmenuid = dt.Rows[0]["CHILD_SUB_MENUID"].ToString();
            string DeepNestedmenuid = dt.Rows[0]["DEEP_MENUID"].ToString();

            DataTable dt_main_menu;
            if (Mainmenuid == "FULLACCESS")
            {
                dt_main_menu = SqlCmd.SelectData("SP_MenuBind_Q1", Param, PName, Count = 0);
            }
            else
            {
                Param[0] = Mainmenuid;
                PName[0] = "@MENUID";
                dt_main_menu = SqlCmd.SelectData("SP_MenuBind_Q1", Param, PName, Count = 1);
            }

            foreach (DataRow main in dt_main_menu.Rows)
            {
                string menuId = main["MENUID"].ToString();
                string menuName = main["MENU_NAME"].ToString();
                string menuUrl = main["MENU_URL"].ToString();
                string menuClass = main["CLASSES"].ToString();
                string menuType = main["MENU_TYPE"].ToString();

                if (menuType == "Direct Link")
                {
                    result.Append("<li class='nav-item'>");
                    result.Append("<a href='" + menuUrl + "' class='nav-link'>");
                    result.Append("<i class='" + menuClass + "'></i>");
                    result.Append("<span>" + menuName + "</span>");
                    result.Append("</a></li>");
                }
                else
                {
                    result.Append("<li class='nav-item nav-item-submenu'>");
                    result.Append("<a href='#' class='nav-link'>");
                    result.Append("<i class='" + menuClass + "'></i>");
                    result.Append("<span>" + menuName + "</span>");
                    result.Append("</a>");
                    result.Append("<ul class='nav-group-sub collapse'>");

                    // Load child menu
                    DataTable dt_child_menu;
                    if (Childmenuid == "FULLACCESS")
                    {
                        Param[0] = menuId;
                        PName[0] = "@MAIN_MENU";
                        dt_child_menu = SqlCmd.SelectData("SP_MenuBind_Q2", Param, PName, Count = 1);
                    }
                    else
                    {
                        Param[0] = menuId;
                        PName[0] = "@MAIN_MENU";
                        Param[1] = Childmenuid;
                        PName[1] = "@SUBMENUID";
                        dt_child_menu = SqlCmd.SelectData("SP_MenuBind_Q2", Param, PName, Count = 2);
                    }

                    foreach (DataRow sub in dt_child_menu.Rows)
                    {
                        string subId = sub["SUBMENUID"].ToString();
                        string subName = sub["SUBMENU_NAME"].ToString();
                        string subUrl = sub["SUBMENU_URL"].ToString();
                        string subclasses = sub["SUBCLASSES"].ToString();
                        string subType = sub["SUBMENU_TYPE"].ToString();

                        if (subType == "Direct Link")
                        {
                            result.Append("<li class='nav-item'>");
                            result.Append("<a href='" + subUrl + "' class='nav-link'>");
                            result.Append("<i class='" + subclasses + " font14-lh18'></i> " + subName);
                            result.Append("</a></li>");
                        }
                        else
                        {
                            result.Append("<li class='nav-item nav-item-submenu'>");
                            result.Append("<a href='#' class='nav-link'>");
                            result.Append("<i class='" + subclasses + " font14-lh18'></i> " + subName);
                            result.Append("</a>");
                            result.Append("<ul class='nav-group-sub collapse'>");

                            // Load nested menu
                            DataTable dt_nested_menu;
                            if (Nestedmenuid == "FULLACCESS")
                            {
                                Param[0] = subId;
                                PName[0] = "@MAIN_SUBMENU";
                                dt_nested_menu = SqlCmd.SelectData("SP_MenuBind_Q3", Param, PName, Count = 1);
                            }
                            else
                            {
                                Param[0] = subId;
                                PName[0] = "@MAIN_SUBMENU";
                                Param[1] = Nestedmenuid;
                                PName[1] = "@NESTSUBMENUID";
                                dt_nested_menu = SqlCmd.SelectData("SP_MenuBind_Q3", Param, PName, Count = 2);
                            }

                            foreach (DataRow child in dt_nested_menu.Rows)
                            {
                                string childId = child["NESTSUBMENUID"].ToString();
                                string childName = child["NESTSUBMENU_NAME"].ToString();
                                string childUrl = child["NESTSUBMENU_URL"].ToString();
                                string childclass = child["NESTSUBCLASSES"].ToString();
                                string childType = child["NESTEDSUBMENU_TYPE"].ToString();

                                if (childType == "Direct Link")
                                {
                                    result.Append("<li class='nav-item'>");
                                    result.Append("<a href='" + childUrl + "' class='nav-link'>");
                                    result.Append("<i class='" + childclass + " font14-lh18'></i> " + childName);
                                    result.Append("</a></li>");
                                }
                                else
                                {
                                    result.Append("<li class='nav-item nav-item-submenu'>");
                                    result.Append("<a href='#' class='nav-link'>");
                                    result.Append("<i class='" + childclass + " font14-lh18'></i> " + childName);
                                    result.Append("</a>");
                                    result.Append("<ul class='nav-group-sub collapse'>");

                                    // Load deep nested menu
                                    DataTable dt_deep_menu;
                                    if (DeepNestedmenuid == "FULLACCESS")
                                    {
                                        Param[0] = childId;
                                        PName[0] = "@NESTEDSUBMENU";
                                        dt_deep_menu = SqlCmd.SelectData("SP_MenuBind_Q4", Param, PName, Count = 1);
                                    }
                                    else
                                    {
                                        Param[0] = childId;
                                        PName[0] = "@NESTEDSUBMENU";
                                        Param[1] = DeepNestedmenuid;
                                        PName[1] = "@DEEPID";
                                        dt_deep_menu = SqlCmd.SelectData("SP_MenuBind_Q4", Param, PName, Count = 2);
                                    }

                                    foreach (DataRow deep in dt_deep_menu.Rows)
                                    {
                                        string deepName = deep["DEEPSUBMENU_NAME"].ToString();
                                        string deepUrl = deep["DEEP_URL"].ToString();
                                        string deepClass = deep["DEEPCLASSES"].ToString();

                                        result.Append("<li class='nav-item'>");
                                        result.Append("<a href='" + deepUrl + "' class='nav-link'>");
                                        result.Append("<i class='" + deepClass + " font14-lh18'></i> " + deepName);
                                        result.Append("</a></li>");
                                    }

                                    result.Append("</ul></li>"); // Close deep nested
                                }
                            }


                            result.Append("</ul></li>"); // Close nested submenu
                        }
                    }

                    result.Append("</ul></li>"); // Close submenu
                }
            }
            result.Append("</ul>");

        }
        catch (Exception ex)
        {
            result.Append("");
        }
        string hh = result.ToString();
        return result.ToString();
    }




  

   
}