using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.IdentityModel.Protocols.WSTrust;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Services;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddMenuAndSubMenu : System.Web.UI.Page
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
        }
        else
        {
            USERID = HttpContext.Current.Session["USERID"].ToString();
            LoginUser = HttpContext.Current.Session["USERNAME"].ToString();
        }
        if (!IsPostBack)
        {
            hdnActiveTab.Value = "#js-tab1";
        }
    }

    [System.Web.Services.WebMethod]
    public static string SaveMenuDetails(string MenuName, string MenuType, string Url, string Classes, string Style, string Status, string MenuOrder, string Remrks)
    {
        string result = "Not Save";

        Param[0] = MenuName.Trim(); PName[0] = "@MenuName";
        Param[1] = "SAVE"; PName[1] = "@TYPE";
        int Count = 2;
        DataTable dt = sqlcmd.SelectData("Add_Menu_Q4", Param, PName, Count);

        if (dt.Rows.Count > 0)
        {
            return "Already Exits";
        }

        string menuvalue = System.Text.RegularExpressions.Regex.Replace(MenuName, "[^a-zA-Z0-9]", "_");

        Param[0] = MenuName.Trim(); PName[0] = "@MenuName";
        Param[1] = menuvalue.Trim(); PName[1] = "@MenuValue";
        Param[2] = MenuType.Trim(); PName[2] = "@MenuType";
        Param[3] = Url.Trim(); PName[3] = "@Url";
        Param[4] = Classes.Trim(); PName[4] = "@Classes";
        Param[5] = Style.Trim(); PName[5] = "@Style";
        Param[6] = Status.Trim(); PName[6] = "@Status";
        Param[7] = MenuOrder.Trim(); PName[7] = "@ModuleOrder";
        Param[8] = Remrks.Trim(); PName[8] = "@Remarks";
        Param[9] = LoginUser.Trim(); PName[9] = "@Addby";
        Count = 10;
        int i = sqlcmd.ExecNonQuery("SP_AddMenu_Save_Q2", Param, PName, Count);

        if (i > 0)
        {
            result = "Save";
        }
        return result;
    }

    [WebMethod]
    public static object GetMenuOrdertype()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddMenuAndSubMenu_GetMenuOrder_Q1");

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt.Rows[0][0]);
        }
        else
        {
            result = "0";
        }

        return result;
    }

    [WebMethod]
    public static string ViewTable()
    {
        string result = null;
        DataTable dt = sqlcmd.SelectQuery("SP_AddMenu_view_Q2");

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
    public static string UpdateMenu(string MenuName, string MenuType, string Url, string Classes, string Style, string Status, string MenuOrder, string Remrks, string ID)
    {
        string result = "Not Update";
        try
        {
            Param[0] = MenuName.Trim(); PName[0] = "@MenuName";
            Param[1] = "UPDATE"; PName[1] = "@TYPE";
            Param[2] = ID; PName[2] = "@Menu_ID";
            int Count = 3;
            DataTable dt = sqlcmd.SelectData("Add_Menu_Q4", Param, PName, Count);

            if (dt.Rows.Count > 0)
            {
                return "Already Exits";
            }

            Param[0] = MenuName.Trim(); PName[0] = "@MenuName";
            Param[1] = MenuType.Trim(); PName[1] = "@MenuType";
            Param[2] = Url.Trim(); PName[2] = "@Url";
            Param[3] = Classes.Trim(); PName[3] = "@Classes";
            Param[4] = Style.Trim(); PName[4] = "@Style";
            Param[5] = Status.Trim(); PName[5] = "@Status";
            Param[6] = MenuOrder.Trim(); PName[6] = "@MenuOrder";
            Param[7] = Remrks.Trim(); PName[7] = "@Remrks";
            Param[8] = ID; PName[8] = "@ID";
            string menuvalue = System.Text.RegularExpressions.Regex.Replace(MenuName, "[^a-zA-Z0-9]", "_");
            Param[9] = menuvalue.Trim(); PName[9] = "@MenuValue";
            Param[10] = LoginUser.Trim(); PName[10] = "@Addby";
            Count = 11;
            int i = sqlcmd.ExecNonQuery("SP_AddMenu_Save_Q3", Param, PName, Count);
            if (i > 0)
            {
                result = "Update";

            }
        }
        catch (Exception ex)
        {

        }
        return result;
    }

    [WebMethod]
    public static Object ViewDataLog()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddMenu_view_Q4");

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

    //submenu
    [System.Web.Services.WebMethod]
    public static List<MenuItem> GetMainMenuList()
    {
        List<MenuItem> list = new List<MenuItem>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAIN_MENU");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new MenuItem
            {
                ID = Convert.ToInt32(row["MENUID"]),
                Name = row["MENU_NAME"].ToString()
            });
        }

        return list;
    }
    public class MenuItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }

    [WebMethod]
    public static object GetSubMenuOrdertype()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddMenuAndSubMenu_GetSubMenuOrder_Q1");

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt.Rows[0][0]);
        }
        else
        {
            result = "0";
        }

        return result;
    }

    [WebMethod]
    public static string ViewTable1()
    {
        string result = null;
        DataTable dt = sqlcmd.SelectQuery("SP_AddSubMenu_view_Q2");

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


    [System.Web.Services.WebMethod]
    public static string SaveSubMenuDetails(string MainMenu, string SubMenuName, string SubMenuType, string SubUrl,
    string SubClasses, string SubStyle, string SubStatus, string SubMenuOrder, string SubRemrks)
    {
        string result = "Not Save";

        Param[0] = SubMenuName.Trim(); PName[0] = "@SubMenuName";
        Param[1] = "SAVE"; PName[1] = "@TYPE";
        int Count = 2;

        DataTable dt = sqlcmd.SelectData("Add_SubMenu_Q4", Param, PName, Count);
        if (dt.Rows.Count > 0)
        {
            return "Already Exists";
        }

        string Submenuvalue = System.Text.RegularExpressions.Regex.Replace(SubMenuName, "[^a-zA-Z0-9]", "_");

        Param[0] = SubMenuName.Trim(); PName[0] = "@SubMenuName";
        Param[1] = Submenuvalue.Trim(); PName[1] = "@SubMenuValue";
        Param[2] = SubMenuType.Trim(); PName[2] = "@SubMenuType";
        Param[3] = SubUrl.Trim(); PName[3] = "@SubUrl";
        Param[4] = SubClasses.Trim(); PName[4] = "@SubClasses";
        Param[5] = SubStyle.Trim(); PName[5] = "@SubStyle";
        Param[6] = SubStatus.Trim(); PName[6] = "@SubStatus";
        Param[7] = SubMenuOrder.Trim(); PName[7] = "@SubModuleOrder";
        Param[8] = SubRemrks.Trim(); PName[8] = "@SubRemarks";
        Param[9] = LoginUser.Trim(); PName[9] = "@Addby";
        Param[10] = MainMenu.Trim(); PName[10] = "@MainMenu";

        Count = 11;

        int i = sqlcmd.ExecNonQuery("SP_AddSubMenu_Save_Q2", Param, PName, Count);

        if (i > 0)
        {
            try
            {
                string[] p = new string[2];
                string[] pn = new string[2];
                p[0] = SubMenuName.Trim(); pn[0] = "@SubMenuName";
                p[1] = "GETID"; pn[1] = "@TYPE";

                DataTable dtSub = sqlcmd.SelectData("Add_SubMenu_Q4", p, pn, 2);
                if (dtSub != null && dtSub.Rows.Count > 0)
                {
                    string newSubmenuId = dtSub.Rows[0]["SUBMENUID"].ToString();

                    string[] mp = new string[1];
                    string[] mpn = new string[1];
                    mp[0] = MainMenu; mpn[0] = "@ID";

                    DataTable dtMain = sqlcmd.SelectData("SP_Get_Menu_By_Id", mp, mpn, 1);
                    string currentValue = "0";

                    if (dtMain != null && dtMain.Rows.Count > 0)
                    {
                        currentValue = dtMain.Rows[0]["SUB_MENUID"].ToString();
                    }

                    List<string> ids = currentValue.Split(',')
                                                   .Where(x => !string.IsNullOrWhiteSpace(x))
                                                   .Distinct()
                                                   .ToList();

                    if (!ids.Contains(newSubmenuId))
                        ids.Add(newSubmenuId);

                    string updatedSubmenuIds = string.Join(",", ids);

                    string[] up = new string[2];
                    string[] upn = new string[2];
                    up[0] = MainMenu; upn[0] = "@ID";
                    up[1] = updatedSubmenuIds; upn[1] = "@SubmenuId";

                    sqlcmd.ExecNonQuery("SP_Update_Menu_SubmenuId_Q1", up, upn, 2);
                }

                result = "Save";
            }
            catch (Exception ex)
            {
                return "Save but submenuId update failed: " + ex.Message;
            }
        }

        return result;
    }


    [WebMethod]
    public static string UpdateSubMenu(string MainMenuId, string SubMenuName, string SubMenuType, string SubUrl, string SubClasses, string SubStyle, string SubStatus, string SubMenuOrder, string SubRemrks, string ID)
    {
        string result = "Not Update";
        try
        {
            Param[0] = SubMenuName.Trim(); PName[0] = "@SubMenuName";
            Param[1] = "UPDATE"; PName[1] = "@TYPE";
            Param[2] = ID; PName[2] = "@SubMenu_ID";
            int Count = 3;
            DataTable dt = sqlcmd.SelectData("Add_SubMenu_Q4", Param, PName, Count);

            if (dt.Rows.Count > 0)
            {
                return "Already Exits";
            }

            string Submenuvalue = System.Text.RegularExpressions.Regex.Replace(SubMenuName, "[^a-zA-Z0-9]", "_");

            Param[0] = SubMenuName.Trim(); PName[0] = "@SubMenuName";
            Param[1] = Submenuvalue.Trim(); PName[1] = "@SubMenuValue";
            Param[2] = SubMenuType.Trim(); PName[2] = "@SubMenuType";
            Param[3] = SubUrl.Trim(); PName[3] = "@SubUrl";
            Param[4] = SubClasses.Trim(); PName[4] = "@SubClasses";
            Param[5] = SubStyle.Trim(); PName[5] = "@SubStyle";
            Param[6] = SubStatus.Trim(); PName[6] = "@SubStatus";
            Param[7] = SubMenuOrder.Trim(); PName[7] = "@SubModuleOrder";
            Param[8] = SubRemrks.Trim(); PName[8] = "@SubRemarks";
            Param[9] = LoginUser.Trim(); PName[9] = "@Addby";
            Param[10] = MainMenuId.Trim(); PName[10] = "@MainMenu";
            Param[11] = ID.Trim(); PName[11] = "@ID";
            Count = 12;
            int i = sqlcmd.ExecNonQuery("SP_AddSubMenu_Save_Q3", Param, PName, Count);
            if (i > 0)
            {
                result = "Update";

            }
        }
        catch (Exception ex)
        {

        }
        return result;
    }

    [WebMethod]
    public static Object ViewDataLogSub()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddSubMenu_view_Q4");

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


    //Nested sub menu 
    public class SubMenuItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }
    [System.Web.Services.WebMethod]
    public static List<SubMenuItem> GetMainSubMenuList()
    {
        List<SubMenuItem> list = new List<SubMenuItem>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAIN_SUBMENU");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new SubMenuItem
            {
                ID = Convert.ToInt32(row["SUBMENUID"]),
                Name = row["SUBMENU_NAME"].ToString()
            });
        }

        return list;
    }

    [WebMethod]
    public static object GetNestedSubMenuOrdertype()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddMenuAndSubMenu_GetNESTEDSubMenuOrder_Q1");

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt.Rows[0][0]);
        }
        else
        {
            result = "0";
        }

        return result;
    }


    [System.Web.Services.WebMethod]
    public static string SaveNestedSubMenuDetails(string MainSubMenu, string NestedMenuName, string NestedUrl, string NestedClasses,
        string NestedStyle, string NestedStatus, string NestedMenuOrder, string NestedRemrks, string NestedSubMenuType)
    {
        string loginuser = HttpContext.Current.Session["USERNAME"].ToString();
        string result = "Not Save";

        Param[0] = NestedMenuName.Trim(); PName[0] = "@NestedMenuName";
        Param[1] = "SAVE"; PName[1] = "@TYPE";
        int Count = 2;

        DataTable dt = sqlcmd.SelectData("Add_NESTEDMenu_Q4", Param, PName, Count);
        if (dt.Rows.Count > 0)
        {
            return "Already Exists";
        }

        string NestedMenuvalue = System.Text.RegularExpressions.Regex.Replace(NestedMenuName, "[^a-zA-Z0-9]", "_");

        Param[0] = NestedMenuName.Trim(); PName[0] = "@NestedMenuName";
        Param[1] = NestedMenuvalue.Trim(); PName[1] = "@NestedMenuValue";
        Param[2] = MainSubMenu.Trim(); PName[2] = "@MainSubMenu";
        Param[3] = NestedUrl.Trim(); PName[3] = "@NestedUrl";
        Param[4] = NestedClasses.Trim(); PName[4] = "@NestedClasses";
        Param[5] = NestedStyle.Trim(); PName[5] = "@NestedStyle";
        Param[6] = NestedStatus.Trim(); PName[6] = "@NestedStatus";
        Param[7] = NestedMenuOrder.Trim(); PName[7] = "@NestedmenuOrder";
        Param[8] = NestedRemrks.Trim(); PName[8] = "@NestedRemarks";
        Param[9] = loginuser.Trim(); PName[9] = "@Addby";
        Param[10] = NestedSubMenuType.Trim(); PName[10] = "@NestedSubMenuType";

        Count = 11;

        int i = sqlcmd.ExecNonQuery("SP_AdDNESTEDSUBMenu_Save_Q2", Param, PName, Count);

        if (i > 0)
        {
            try
            {
                string[] p = new string[2];
                string[] pn = new string[2];
                p[0] = NestedMenuName.Trim(); pn[0] = "@NestedMenuName";
                p[1] = "GETID"; pn[1] = "@TYPE";

                DataTable dtSub = sqlcmd.SelectData("Add_NESTEDMenu_Q4", p, pn, 2);
                if (dtSub != null && dtSub.Rows.Count > 0)
                {
                    string newnestedSubmenuId = dtSub.Rows[0]["NESTSUBMENUID"].ToString();

                    string[] mp = new string[1];
                    string[] mpn = new string[1];
                    mp[0] = MainSubMenu; mpn[0] = "@ID";

                    DataTable dtMain = sqlcmd.SelectData("SP_Get_SUBMenu_By_Id", mp, mpn, 1);
                    string currentValue = "0";

                    if (dtMain != null && dtMain.Rows.Count > 0)
                    {
                        currentValue = dtMain.Rows[0]["NESTEDSUBMENU_ID"].ToString();
                    }

                    List<string> ids = currentValue.Split(',')
                                                   .Where(x => !string.IsNullOrWhiteSpace(x))
                                                   .Distinct()
                                                   .ToList();

                    if (!ids.Contains(newnestedSubmenuId))
                        ids.Add(newnestedSubmenuId);

                    string updatedNestedSubmenuIds = string.Join(",", ids);

                    string[] up = new string[2];
                    string[] upn = new string[2];
                    up[0] = MainSubMenu; upn[0] = "@ID";
                    up[1] = updatedNestedSubmenuIds; upn[1] = "@NestedMenu_ID";

                    sqlcmd.ExecNonQuery("SP_Update_NestedMenu_Q1", up, upn, 2);
                }

                result = "Save";
            }
            catch (Exception ex)
            {
                return "Save but nested submenuId update failed: " + ex.Message;
            }
        }

        return result;
    }

    [WebMethod]
    public static string ViewTable2()
    {
        string result = null;
        DataTable dt = sqlcmd.SelectQuery("SP_AddNestedSubMenu_view_Q2");

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
    public static string UpdateNestedSubMenu(string MainSubMenuId, string NestSubMenuName, string NestedUrl, string NestedClasses,
        string NestedStyle, string NestedStatus, string NestedMenuOrder, string NestedRemrks, string NestedSubMenuType, string ID)
    {
        string result = "Not Update";
        try
        {
            Param[0] = NestSubMenuName.Trim(); PName[0] = "@NestedMenuName";
            Param[1] = "UPDATE"; PName[1] = "@TYPE";
            Param[2] = ID; PName[2] = "@NestedMenu_ID";
            int Count = 3;
            DataTable dt = sqlcmd.SelectData("Add_NESTEDMenu_Q4", Param, PName, Count);

            if (dt.Rows.Count > 0)
            {
                return "Already Exits";
            }

            string Nestedsubmenuvalue = System.Text.RegularExpressions.Regex.Replace(NestSubMenuName, "[^a-zA-Z0-9]", "_");
            string username = HttpContext.Current.Session["USERNAME"].ToString();
            Param[0] = NestSubMenuName.Trim(); PName[0] = "@NestedSubMenuName";
            Param[1] = Nestedsubmenuvalue.Trim(); PName[1] = "@NestedSubMenuValue";
            Param[2] = NestedUrl.Trim(); PName[2] = "@NestedSubUrl";
            Param[3] = NestedClasses.Trim(); PName[3] = "@NestedSubClasses";
            Param[4] = NestedStyle.Trim(); PName[4] = "@NestedSubStyle";
            Param[5] = NestedStatus.Trim(); PName[5] = "@NestedSubStatus";
            Param[6] = NestedMenuOrder.Trim(); PName[6] = "@NestedSubModuleOrder";
            Param[7] = NestedRemrks.Trim(); PName[7] = "@NestedSubRemarks";
            Param[8] = username.Trim(); PName[8] = "@Addby";
            Param[9] = MainSubMenuId.Trim(); PName[9] = "@MainSubMenu";
            Param[10] = NestedSubMenuType.Trim(); PName[10] = "@NestedSubMenuType";
            Param[11] = ID.Trim(); PName[11] = "@ID";
            Count = 12;
            int i = sqlcmd.ExecNonQuery("SP_AddSubMenu_UPDATENESTED_Q3", Param, PName, Count);
            if (i > 0)
            {
                result = "Update";

            }
        }
        catch (Exception ex)
        {

        }
        return result;
    }

    [WebMethod]
    public static Object ViewDataLogNestedSub()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddSubMenu_NESTEDview_Q4");

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


    //DeepSubMenu
    public class NestedSubMenuItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }
    [System.Web.Services.WebMethod]
    public static List<NestedSubMenuItem> GetNestedSubMenuList()
    {
        List<NestedSubMenuItem> list = new List<NestedSubMenuItem>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAIN_NESTEDSUBMENU");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new NestedSubMenuItem
            {
                ID = Convert.ToInt32(row["NESTSUBMENUID"]),
                Name = row["NESTSUBMENU_NAME"].ToString()
            });
        }

        return list;
    }

    [WebMethod]
    public static object GetDeepNestedSubMenuOrdertype()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddMenuAndSubMenu_GetDeepNESTEDSubMenuOrder_Q1");

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt.Rows[0][0]);
        }
        else
        {
            result = "0";
        }

        return result;
    }

    [System.Web.Services.WebMethod]
    public static string SaveDeepNestedSubMenuDetails(string NestedSubMenu, string DeepNestedMenuName, string DeepNestedUrl, string DeepNestedClasses,
        string DeepNestedStyle, string DeepNestedStatus, string DeepNestedMenuOrder, string DeepNestedRemrks)
    {
        string loginuser = HttpContext.Current.Session["USERNAME"].ToString();
        string result = "Not Save";

        Param[0] = DeepNestedMenuName.Trim(); PName[0] = "@DeepNestedMenuName";
        Param[1] = "SAVE"; PName[1] = "@TYPE";
        int Count = 2;

        DataTable dt = sqlcmd.SelectData("Add_DEEPNESTEDMenu_Q4", Param, PName, Count);
        if (dt.Rows.Count > 0)
        {
            return "Already Exists";
        }

        string DeepNestedMenuvalue = System.Text.RegularExpressions.Regex.Replace(DeepNestedMenuName, "[^a-zA-Z0-9]", "_");

        Param[0] = DeepNestedMenuName.Trim(); PName[0] = "@DeepNestedMenuName";
        Param[1] = DeepNestedMenuvalue.Trim(); PName[1] = "@DeepNestedMenuValue";
        Param[2] = NestedSubMenu.Trim(); PName[2] = "@NestedSubMenu";
        Param[3] = DeepNestedUrl.Trim(); PName[3] = "@DeepNestedUrl";
        Param[4] = DeepNestedClasses.Trim(); PName[4] = "@DeepNestedClasses";
        Param[5] = DeepNestedStyle.Trim(); PName[5] = "@DeepNestedStyle";
        Param[6] = DeepNestedStatus.Trim(); PName[6] = "@DeepNestedStatus";
        Param[7] = DeepNestedMenuOrder.Trim(); PName[7] = "@DeepNestedmenuOrder";
        Param[8] = DeepNestedRemrks.Trim(); PName[8] = "@DeepNestedRemarks";
        Param[9] = loginuser.Trim(); PName[9] = "@Addby";

        Count = 10;

        int i = sqlcmd.ExecNonQuery("SP_AdDDEEPNESTEDSUBMenu_Save_Q2", Param, PName, Count);

        if (i > 0)
        {
            try
            {
                string[] p = new string[2];
                string[] pn = new string[2];
                p[0] = DeepNestedMenuName.Trim(); pn[0] = "@DeepNestedMenuName";
                p[1] = "GETID"; pn[1] = "@TYPE";

                DataTable dtSub = sqlcmd.SelectData("Add_DEEPNESTEDMenu_Q4", p, pn, 2);
                if (dtSub != null && dtSub.Rows.Count > 0)
                {
                    string newDeepnestedSubmenuId = dtSub.Rows[0]["DEEPID"].ToString();

                    string[] mp = new string[1];
                    string[] mpn = new string[1];
                    mp[0] = NestedSubMenu; mpn[0] = "@ID";

                    DataTable dtMain = sqlcmd.SelectData("SP_Get_NESTEDSUBMenu_By_Id", mp, mpn, 1);
                    string currentValue = "0";

                    if (dtMain != null && dtMain.Rows.Count > 0)
                    {
                        currentValue = dtMain.Rows[0]["DEEPID"].ToString();
                    }

                    List<string> ids = currentValue.Split(',')
                                                   .Where(x => !string.IsNullOrWhiteSpace(x))
                                                   .Distinct()
                                                   .ToList();

                    if (!ids.Contains(newDeepnestedSubmenuId))
                        ids.Add(newDeepnestedSubmenuId);

                    string updatedDeepNestedSubmenuIds = string.Join(",", ids);

                    string[] up = new string[2];
                    string[] upn = new string[2];
                    up[0] = NestedSubMenu; upn[0] = "@ID";
                    up[1] = updatedDeepNestedSubmenuIds; upn[1] = "@DeepNestedMenu_ID";

                    sqlcmd.ExecNonQuery("SP_Update_DeepNestedMenu_Q1", up, upn, 2);
                }

                result = "Save";
            }
            catch (Exception ex)
            {
                return "Save but nested submenuId update failed: " + ex.Message;
            }
        }

        return result;
    }
    [WebMethod]
    public static string UpdateDeepNestedSubMenu(string NestedSubMenuId, string DeepNestSubMenuName, string DeepNestedUrl, string DeepNestedClasses,
        string DeepNestedStyle, string DeepNestedStatus, string DeepNestedMenuOrder, string DeepNestedRemrks, string ID)
    {
        string result = "Not Update";
        try
        {
            Param[0] = DeepNestSubMenuName.Trim(); PName[0] = "@DeepNestedMenuName";
            Param[1] = "UPDATE"; PName[1] = "@TYPE";
            Param[2] = ID; PName[2] = "@DeepNestedMenu_ID";
            int Count = 3;
            DataTable dt = sqlcmd.SelectData("Add_DEEPNESTEDMenu_Q4", Param, PName, Count);

            if (dt.Rows.Count > 0)
            {
                return "Already Exits";
            }

            string DeepNestedsubmenuvalue = System.Text.RegularExpressions.Regex.Replace(DeepNestSubMenuName, "[^a-zA-Z0-9]", "_");
            string username = HttpContext.Current.Session["USERNAME"].ToString();
            Param[0] = DeepNestSubMenuName.Trim(); PName[0] = "@DeepNestedSubMenuName";
            Param[1] = DeepNestedsubmenuvalue.Trim(); PName[1] = "@DeepNestedSubMenuValue";
            Param[2] = DeepNestedUrl.Trim(); PName[2] = "@DeepNestedSubUrl";
            Param[3] = DeepNestedClasses.Trim(); PName[3] = "@DeepNestedSubClasses";
            Param[4] = DeepNestedStyle.Trim(); PName[4] = "@DeepNestedSubStyle";
            Param[5] = DeepNestedStatus.Trim(); PName[5] = "@DeepNestedSubStatus";
            Param[6] = DeepNestedMenuOrder.Trim(); PName[6] = "@DeepNestedSubModuleOrder";
            Param[7] = DeepNestedRemrks.Trim(); PName[7] = "@DeepNestedSubRemarks";
            Param[8] = username.Trim(); PName[8] = "@Addby";
            Param[9] = NestedSubMenuId.Trim(); PName[9] = "@NestedSubMenu";
            Param[10] = ID.Trim(); PName[10] = "@ID";
            Count = 11;
            int i = sqlcmd.ExecNonQuery("SP_AddSubMenu_UPDATENESTEDDEEP_Q3", Param, PName, Count);
            if (i > 0)
            {
                result = "Update";

            }
        }
        catch (Exception ex)
        {

        }
        return result;
    }

    [WebMethod]
    public static string ViewTable3()
    {
        string result = null;
        DataTable dt = sqlcmd.SelectQuery("SP_AddDEEPNestedSubMenu_view_Q2");

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
    public static Object ViewDataLogDeepNestedSub()
    {
        object result = null;

        DataTable dt = sqlcmd.SelectQuery("SP_AddSubMenu_DEEPNESTEDview_Q4");

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


    public class MenuItem1
    {
        public int MENUID { get; set; }
        public string MENU_NAME { get; set; }
    }
    [System.Web.Services.WebMethod]
    public static List<MenuItem1> GetAllMenus()
    {
        List<MenuItem1> list = new List<MenuItem1>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAINList_Q1");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new MenuItem1
            {
                MENUID = Convert.ToInt32(row["MENUID"]),
                MENU_NAME = row["MENU_NAME"].ToString()
            });
        }

        return list;
    }

    [System.Web.Services.WebMethod]
    public static string SaveMenuOrder(List<int> orderedMenuIds)
    {
        try
        {

            for (int i = 0; i < orderedMenuIds.Count; i++)
            {
                int menuId = orderedMenuIds[i];
                int order = i + 1;

                Param[0] = order.ToString();
                PName[0] = "@Order";

                Param[1] = menuId.ToString();
                PName[1] = "@ID";

                Param[2] = "Menu";
                PName[2] = "@Type";
                
                Count = 3;

                int result = sqlcmd.ExecNonQuery("SP_UPDATE_MENU_ORDER_Q1", Param, PName, Count);
                
            }

            return "Success";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }

    [System.Web.Services.WebMethod]
    public static List<SubMenuItem> GetAllSubMenus()
    {
        List<SubMenuItem> list = new List<SubMenuItem>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAINList_Q2");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new SubMenuItem
            {
                ID = Convert.ToInt32(row["SUBMENUID"]),
                Name = row["SUBMENU_NAME"].ToString()
            });
        }

        return list;
    }

    [System.Web.Services.WebMethod]
    public static string SaveSubMenuOrder(List<int> orderedSubMenuIds)
    {
        try
        {

            for (int i = 0; i < orderedSubMenuIds.Count; i++)
            {
                int Id = orderedSubMenuIds[i];
                int order = i + 1;

                Param[0] = order.ToString();
                PName[0] = "@Order";

                Param[1] = Id.ToString();
                PName[1] = "@ID";

                Param[2] = "SubMenu";
                PName[2] = "@Type";

                Count = 3;

                int result = sqlcmd.ExecNonQuery("SP_UPDATE_MENU_ORDER_Q1", Param, PName, Count);

            }

            return "Success";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }
    public class NestedSubMenuItem1
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }

    [System.Web.Services.WebMethod]
    public static List<NestedSubMenuItem1> GetAllNested()
    {
        List<NestedSubMenuItem1> list = new List<NestedSubMenuItem1>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAINList_Q3");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new NestedSubMenuItem1
            {
                ID = Convert.ToInt32(row["NESTSUBMENUID"]),
                Name = row["NESTSUBMENU_NAME"].ToString()
            });
        }

        return list;
    }

    [System.Web.Services.WebMethod]
    public static string SaveNestedOrder(List<int> orderedNestedIds)
    {
        try
        {

            for (int i = 0; i < orderedNestedIds.Count; i++)
            {
                int Id = orderedNestedIds[i];
                int order = i + 1;

                Param[0] = order.ToString();
                PName[0] = "@Order";

                Param[1] = Id.ToString();
                PName[1] = "@ID";

                Param[2] = "Nested";
                PName[2] = "@Type";

                Count = 3;

                int result = sqlcmd.ExecNonQuery("SP_UPDATE_MENU_ORDER_Q1", Param, PName, Count);

            }

            return "Success";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }


    public class DeepSubMenuItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }

    [System.Web.Services.WebMethod]
    public static List<DeepSubMenuItem> GetAllDeepMenus()
    {
        List<DeepSubMenuItem> list = new List<DeepSubMenuItem>();

        DataTable dt = sqlcmd.SelectQuery("SP_GET_MAINList_Q4");

        foreach (DataRow row in dt.Rows)
        {
            list.Add(new DeepSubMenuItem
            {
                ID = Convert.ToInt32(row["DEEPID"]),
                Name = row["DEEPSUBMENU_NAME"].ToString()
            });
        }

        return list;
    }

    [System.Web.Services.WebMethod]
    public static string SaveDeepMenuOrder(List<int> orderedDeepMenuIds)
    {
        try
        {

            for (int i = 0; i < orderedDeepMenuIds.Count; i++)
            {
                int Id = orderedDeepMenuIds[i];
                int order = i + 1;

                Param[0] = order.ToString();
                PName[0] = "@Order";

                Param[1] = Id.ToString();
                PName[1] = "@ID";

                Param[2] = "DeepMenu";
                PName[2] = "@Type";

                Count = 3;

                int result = sqlcmd.ExecNonQuery("SP_UPDATE_MENU_ORDER_Q1", Param, PName, Count);

            }

            return "Success";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }
}