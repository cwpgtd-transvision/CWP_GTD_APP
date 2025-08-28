using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel.Activities;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Role_Permission : System.Web.UI.Page
{
    static SqlCmd sqlcmd = new SqlCmd();
    static string[] Param = new string[70];
    static string[] PName = new string[70];
    static int Count = 0;
    static string USERID = "", LoginUser = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Session["USERNAME"] as string))
        {
            // Response.Redirect("Login.aspx");
        }
        else
        {
            USERID = HttpContext.Current.Session["USERID"].ToString();
            LoginUser = HttpContext.Current.Session["USERNAME"].ToString();
        }
    }

    //[WebMethod]
    //public static Object GetRoles()
    //{
    //    object result = null;

    //    DataTable dt = sqlcmd.SelectQuery("SP_ROLE_PERMISSION_Q1");

    //    if (dt != null && dt.Rows.Count > 0)
    //    {
    //        result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
    //    }
    //    else
    //    {
    //        result = "No data found";
    //    }
    //    return result;
    //}

    [WebMethod]
    public static string binddata(string roleid)
    {
        string result = null;

        Param[0] = roleid;
        PName[0] = "@ROLEID";
        Count = 1;
        DataTable dt = sqlcmd.SelectData("SP_ROLE_PERMISSION_Q6", Param, PName, Count);

        if (dt != null && dt.Rows.Count > 0)
        {
            string menuid = dt.Rows[0]["MENUID"].ToString();
            string Submenuid = dt.Rows[0]["SUB_MENUID"].ToString();
            string Nestedmenuid = dt.Rows[0]["CHILD_SUB_MENUID"].ToString();
            string DeepNestedmenuid = dt.Rows[0]["DEEP_MENUID"].ToString();

            if (menuid == "FULLACCESS")
            {
                return menuid;
            }

            string[] menuidss = menuid.Split(',');
            string[] Submenuidss = Submenuid.Split(',');
            string[] Nestedmenuidss = Nestedmenuid.Split(',');
            string[] DeepNestedmenuidss = DeepNestedmenuid.Split(',');

            for (int i = 0; i < menuidss.Length; i++)
            {
                menuidss[i] = "menu" + menuidss[i];
            }
            for (int i = 0; i < Submenuidss.Length; i++)
            {
                Submenuidss[i] = "submenu" + Submenuidss[i];
            }
            for (int i = 0; i < Nestedmenuidss.Length; i++)
            {
                Nestedmenuidss[i] = "nested" + Nestedmenuidss[i];
            }
            for (int i = 0; i < DeepNestedmenuidss.Length; i++)
            {
                DeepNestedmenuidss[i] = "deepnested" + DeepNestedmenuidss[i];
            }

            string menu1 = string.Join(",", menuidss);
            string submenu1 = string.Join(",", Submenuidss);
            string nestedmenu1 = string.Join(",", Nestedmenuidss);
            string Deepnestedmenu1 = string.Join(",", DeepNestedmenuidss);

            result = menu1 + "," + submenu1 + "," + nestedmenu1 + "," + Deepnestedmenu1;
        }

        return result;
    }


    [WebMethod]
    public static string Bind_main_sub_nested_menus()
    {
        StringBuilder html = new StringBuilder();

        html.Append("<div class='full-access-box mb-4'>");
        html.Append("<div class='form-check'>");
        html.Append("<input class='form-check-input' type='checkbox' id='fullAccess' value='fullAccess'>");
        html.Append("<label class='form-check-label' for='fullAccess'><strong>🔒 Full Access</strong></label>");
        html.Append("</div></div>");

        DataTable dt_main_menu = sqlcmd.SelectQuery("SP_ROLE_PERMISSION_Q2");

        for (int i = 0; i < dt_main_menu.Rows.Count; i++)
        {
            string Main_Menu_Name = dt_main_menu.Rows[i]["MENU_NAME"].ToString();
            string Main_Menu_Id = dt_main_menu.Rows[i]["MENUID"].ToString();

            html.Append("<div class='card mb-4'>");
            html.Append("<div class='card-header'>");
            html.Append("<div class='form-check'><input class='form-check-input menu-checkbox' type='checkbox' id='menu" + Main_Menu_Id + "' value='menu" + Main_Menu_Id + "' >");
            html.Append("<label class='form-check-label' for='menu" + Main_Menu_Id + "'> " + Main_Menu_Name + "</label></div>");
            html.Append("</div><div class='card-body'>");

            string[] Param = new string[1];
            string[] PName = new string[1];
            int Count;

            Param[0] = Main_Menu_Id;
            PName[0] = "@MAIN_MENU";
            Count = 1;

            DataTable dt_sub_menu = sqlcmd.SelectData("SP_ROLE_PERMISSION_Q3", Param, PName, Count);

            if (dt_sub_menu.Rows.Count > 0)
            {
                html.Append("<div class='row row-cols-1 row-cols-md-2 g-3'>");

                for (int j = 0; j < dt_sub_menu.Rows.Count; j++)
                {
                    string Sub_Menu_Name = dt_sub_menu.Rows[j]["SUBMENU_NAME"].ToString();
                    string Sub_Menu_Id = dt_sub_menu.Rows[j]["SUBMENUID"].ToString();

                    html.Append("<div class='col'>");
                    html.Append("<div class='form-check submenu-section'>");
                    html.Append("<input class='form-check-input submenu-checkbox' type='checkbox' id='submenu" + Sub_Menu_Id + "' value='submenu" + Sub_Menu_Id + "' >");
                    html.Append("<label class='form-check-label' for='submenu" + Sub_Menu_Id + "'> " + Sub_Menu_Name + "</label>");

                    // Nested menu
                    Param[0] = Sub_Menu_Id;
                    PName[0] = "@MAIN_SUBMENU";
                    Count = 1;
                    DataTable dt_nested_menu = sqlcmd.SelectData("SP_ROLE_PERMISSION_Q4", Param, PName, Count);

                    if (dt_nested_menu.Rows.Count > 0)
                    {
                        html.Append("<div class='nested-menu mt-2'>");

                        foreach (DataRow row in dt_nested_menu.Rows)
                        {
                            string Nested_Menu_Name = row["NESTSUBMENU_NAME"].ToString();
                            string Nested_Menu_Id = row["NESTSUBMENUID"].ToString();

                            html.Append("<div class='form-check mb-1'>");
                            html.Append("<input class='form-check-input nested-checkbox' type='checkbox' id='nested" + Nested_Menu_Id + "' value='nested" + Nested_Menu_Id + "' >");
                            html.Append("<label class='form-check-label' for='nested" + Nested_Menu_Id + "'> " + Nested_Menu_Name + "</label>");
                            html.Append("</div>");

                            // Deep nested menu
                            Param[0] = Nested_Menu_Id;
                            PName[0] = "@NESTEDSUBMENU";
                            DataTable dt_deep_nested_menu = sqlcmd.SelectData("SP_ROLE_PERMISSION_Q7", Param, PName, 1);

                            if (dt_deep_nested_menu.Rows.Count > 0)
                            {
                                html.Append("<div class='deep-nested-menu ms-4 mt-2'>");

                                foreach (DataRow deepRow in dt_deep_nested_menu.Rows)
                                {
                                    string Deep_Menu_Name = deepRow["DEEPSUBMENU_NAME"].ToString();
                                    string Deep_Menu_Id = deepRow["DEEPID"].ToString();

                                    html.Append("<div class='form-check mb-1'>");
                                    html.Append("<input class='form-check-input deep-nested-checkbox' type='checkbox' id='deepnested" + Deep_Menu_Id + "' value='deepnested" + Deep_Menu_Id + "' >");
                                    html.Append("<label class='form-check-label' for='deepnested" + Deep_Menu_Id + "'> " + Deep_Menu_Name + "</label>");
                                    html.Append("</div>");
                                }

                                html.Append("</div>"); // End deep nested
                            }
                        }

                        html.Append("</div>"); // End nested menu
                    }

                    html.Append("</div>"); // End submenu-section
                    html.Append("</div>"); // End col
                }

                html.Append("</div>"); // End submenus row
            }

            html.Append("</div></div>"); // End card-body and card
        }
        string ss = html.ToString();
        return html.ToString();
    }

    [WebMethod]
    public static string SaveMenuIDS(string SelectedChecked, string Rollid)
    {
        string result = "Not Save";

        string menuids = "";
        string Submenuids = "";
        string Nestedmenuids = "";
        string DeepNestedmenuids = "";
        string fullData = "";

        if (!string.IsNullOrEmpty(SelectedChecked))
        {
            string[] selectedArray = SelectedChecked.Split(',');
            List<string> menuList = new List<string>();
            List<string> submenuList = new List<string>();
            List<string> nestedList = new List<string>();
            List<string> DeepnestedList = new List<string>();

            foreach (string item in selectedArray)
            {
                if (item.StartsWith("fullAccess"))
                {
                    fullData = item;
                    break;
                }
                if (item.StartsWith("menu"))
                {
                    // Only "menu" (not "submenu" or "nested")
                    if (!item.StartsWith("submenu") && !item.StartsWith("nested"))
                        menuList.Add(item.Replace("menu", ""));
                }
                else if (item.StartsWith("submenu"))
                {
                    submenuList.Add(item.Replace("submenu", ""));
                }
                else if (item.StartsWith("nested"))
                {
                    nestedList.Add(item.Replace("nested", ""));
                }
                else if (item.StartsWith("deepnested"))
                {
                    DeepnestedList.Add(item.Replace("deepnested", ""));
                }
            }

            menuids = string.Join(",", menuList);
            Submenuids = string.Join(",", submenuList);
            Nestedmenuids = string.Join(",", nestedList);
            DeepNestedmenuids = string.Join(",", DeepnestedList);
        }
        if (fullData == "fullAccess")
        {
            menuids = "FULLACCESS";
            Submenuids = "FULLACCESS";
            Nestedmenuids = "FULLACCESS";
            DeepNestedmenuids = "FULLACCESS";
        }
        Param[0] = menuids; PName[0] = "@MENUID";
        Param[1] = Submenuids; PName[1] = "@SUB_MENUID";
        Param[2] = Nestedmenuids; PName[2] = "@CHILD_SUB_MENUID";
        Param[3] = Rollid; PName[3] = "@ROLEID";
        Param[4] = DeepNestedmenuids; PName[4] = "@DEEP_MENUID";

        int i = sqlcmd.ExecNonQuery("SP_ROLE_PERMISSION_Q5", Param, PName, Count = 5);
        if (i > 0)
        {
            result = "Save";
        }
        return result;
    }

    [WebMethod]
    public static Object GetUSERList()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_Add_RolesType_Q1");

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else
        {
            result = "No data found";
        }
        return result;
    }



    [WebMethod]
    public static Object GetmasteruserList(string typeid)
    {
        object result = null;
        Param[0] = typeid;
        PName[0] = "@type";
        DataTable dt = sqlcmd.SelectData("SP_Add_RolesTypeUser_Q1", Param, PName, Count = 1);

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else
        {
            result = "No data found";
        }
        return result;
    }

    [WebMethod]
    public static Object GetRoleList(string user_table_id, string master_table_id)
    {
        object result = null;
        Param[0] = user_table_id;
        PName[0] = "@Type_table_Id";
        Param[1] = master_table_id;
        PName[1] = "@Master_User_Id";
        DataTable dt = sqlcmd.SelectData("SP_Add_Roles_Q1", Param, PName, Count = 2);

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else
        {
            result = "No data found";
        }
        return result;
    }
}