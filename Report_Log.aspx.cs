using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report_Log : System.Web.UI.Page
{
    static SqlCmd sqlcmd = new SqlCmd();
    static string[] Param = new string[60];
    static string[] PName = new string[60];
    static string RoleId = "", UserId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ROLE_ID"] != null && Session["UserId"] != null)
        {
            RoleId = HttpContext.Current.Session["ROLE_ID"].ToString();
            UserId = HttpContext.Current.Session["UserId"].ToString();
            hdnRoleId.Value = Session["ROLE_ID"].ToString();
        }
        else
        {
            Response.Redirect("~/templates/login/LoginMain.aspx");
        }
    }
    [WebMethod]
    public static object GetRoleList()
    {
        DataTable dt = sqlcmd.SelectQuery("SP_Add_Roles_Q1_1");

        if (dt != null && dt.Rows.Count > 0)
        {
            return JsonConvert.SerializeObject(dt);
        }
        else
        {
            return JsonConvert.SerializeObject(new List<object>());
        }
    }

    [WebMethod]
    public static object GetUserList(string roleId)
    {
        Param[0] = roleId; PName[0] = "@RoleId";
        DataTable dt = sqlcmd.SelectData("SP_Add_User_Q1", Param, PName, 1);

        if (dt != null && dt.Rows.Count > 0)
        {
            return JsonConvert.SerializeObject(dt);
        }
        else
        {
            return JsonConvert.SerializeObject(new List<object>());
        }
    }


    [WebMethod]
    public static string ViewTable(string fromDate, string toDate, string monthYear, string userId, string roleId, string calendarType)
    {
        try
        {
            string actualRoleId = HttpContext.Current.Session["ROLE_ID"].ToString();
            if(actualRoleId == null)
            {
                return "";
            }
            string actualUserId = HttpContext.Current.Session["UserId"].ToString();
            if (actualRoleId != "1")
            {
                roleId = actualRoleId;
                userId = actualUserId;
            }
            DateTime fromdate, todate;
            if (calendarType == "0")
            {
                fromdate = DateTime.ParseExact("01-" + monthYear, "dd-MMM-yyyy", null);
                todate = new DateTime(fromdate.Year, fromdate.Month, DateTime.DaysInMonth(fromdate.Year, fromdate.Month));
            }
            else
            {
                fromdate = DateTime.ParseExact(fromDate, "dd-MM-yyyy", null);
                todate = DateTime.ParseExact(toDate, "dd-MM-yyyy", null);
            }
            string FromDate = fromdate.ToString("yyyy-MM-dd");
            string ToDate = todate.ToString("yyyy-MM-dd");
            //List<string> conditions = new List<string>();
            //conditions.Add("S.LoginTime BETWEEN '" + fromdate.ToString("yyyy-MM-dd") + "' AND '" + todate.ToString("yyyy-MM-dd") + "'");
            //conditions.Add("S.UserID = '" + userId + "'");
            //conditions.Add("U.ROLE_ID = '" + roleId + "'");

            //string whereClause = string.Join(" AND ", conditions);

            string[] Param = new string[6];
            string[] PName = new string[6];
            //Param[0] = whereClause;
            //PName[0] = "@where";
            Param[0] = FromDate; PName[0] = "@FromDate";
            Param[1] = ToDate; PName[1] = "@ToDate";
            Param[2] = roleId; PName[2] = "@RoleId";
            Param[3] = userId; PName[3] = "@UserId";
            DataTable dt = sqlcmd.SelectData("SP_ReportLog_Q1", Param, PName, 4);
            if (dt == null || dt.Rows.Count == 0)
            {
                return "NoData";
            }

            DataColumn slNoColumn = new DataColumn("SLNO", typeof(int));
            dt.Columns.Add(slNoColumn);
            slNoColumn.SetOrdinal(0);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["SLNO"] = i + 1;
            }

            return JsonConvert.SerializeObject(dt);
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }

}