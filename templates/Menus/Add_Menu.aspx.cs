using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class templates_Menus_Add_Menu : System.Web.UI.Page
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
            //hdnActiveTab.Value = "#js-tab1";
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
}