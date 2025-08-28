using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Roles : System.Web.UI.Page
{
    static SqlCmd SqlCmds = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static string msg = "";
    static string login_user = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] == null)
        {
            Response.Redirect("/templates/login/LoginMain.aspx");
        }
        else
        {
            login_user = HttpContext.Current.Session["USERNAME"].ToString();
        }
    }

    [WebMethod]
    public static string SaveRole(string RoleName,string Type_Role, string Mster_User,string Status ,string Type_Role_Name, string Mster_User_Name)
    {
        try
        {
            login_user = HttpContext.Current.Session["USERNAME"].ToString();

            Param[0] = RoleName.Trim(); PName[0] = "@NAME";
            Param[1] = ""; PName[1] = "@ROLEID";
            Param[2] = Type_Role; PName[2] = "@Type_Role";
            Param[3] = Mster_User; PName[3] = "@Type_User";

            DataTable chkuname = SqlCmds.SelectData("SP_ROLES_Q3", Param, PName, Count = 4);
            if (chkuname.Rows.Count > 0)
            {
                return "RNAME";
            }

            Param[0] = RoleName.Trim(); PName[0] = "@NAME";
            Param[1] = login_user; PName[1] = "@ADDBY";
            Param[2] = Type_Role; PName[2] = "@Type_Role";
            Param[3] = Mster_User; PName[3] = "@Type_User";
            Param[4] = Status; PName[4] = "@Status";
            Param[5] = Type_Role_Name; PName[5] = "@Type_RoleName";
            Param[6] = Mster_User_Name; PName[6] = "@Type_UserName";
            int i = SqlCmds.ExecNonQuery("SP_ROLES_Q1", Param, PName, Count = 7);

            if (i > 0)
            {
                return "Save";
            }
            else
            {
                return "Error";
            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }


    [WebMethod]
    public static Object BindRoleData()
    {
        object result = null;
        try
        {

            DataTable dt = SqlCmds.SelectQuery("SP_ROLES_Q2");

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
        catch (Exception ex)
        {

        }
        return null;
    }

    [WebMethod]
    public static string updatedetils(string RoleName, string RoleId, string Type_Role, string Master_User, string Status, string Type_Role_Name, string Master_User_Name)
    {
        try
        {
            login_user = HttpContext.Current.Session["USERNAME"].ToString();

            Param[0] = RoleName.Trim(); PName[0] = "@NAME";
            Param[1] = RoleId; PName[1] = "@ROLEID";
            Param[2] = Type_Role; PName[2] = "@Type_Role";
            Param[3] = Master_User; PName[3] = "@Type_User";

            DataTable chkuname = SqlCmds.SelectData("SP_ROLES_Q3", Param, PName, Count = 4);
            if (chkuname.Rows.Count > 0)
            {
                return "RNAME";
            }
            Param[0] = RoleName.Trim(); PName[0] = "@NAME";
            Param[1] = RoleId; PName[1] = "@ROLEID";
            Param[2] = login_user; PName[2] = "@ADDBY";
            Param[3] = Type_Role; PName[3] = "@TypeRole";
            Param[4] = Master_User; PName[4] = "@TypeUser";
            Param[5] = Type_Role_Name; PName[5] = "@Type_Rolename";
            Param[6] = Master_User_Name; PName[6] = "@Master_User_Name";
            Param[7] = Status; PName[7] = "@Status";

            int i = SqlCmds.ExecNonQuery("SP_ROLES_Q4", Param, PName, Count = 8);
            if (i > 0)
            {
                return "Updated";
            }
            else
            {
                return "Error";
            }



        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    [WebMethod]
    public static Object BindData_log()
    {
        object result = null;
        try
        {
            DataTable dt = SqlCmds.SelectQuery("SP_ROLES_Q5");
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
        catch (Exception ex)
        {

        }
        return null;
    }

    [WebMethod]
    public static Object GetTypeRoleList()
    {
        object result = null;
        
        DataTable dt = SqlCmds.SelectQuery("SP_Add_RolesType_Q1");

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
    public static Object GetTypeUserIdList(string type)
    {
        object result = null;
        Param[0] = type; PName[0] = "@type";
        DataTable dt = SqlCmds. SelectData("SP_Add_RolesTypeUser_Q1",Param,PName,Count=1);

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