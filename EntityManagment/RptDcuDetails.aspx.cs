using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class RptDcuDetails : System.Web.UI.Page
{
    static SqlCmd SqlCmds = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static string msg = "";
    static string login_user = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static Object BindConsumer()
    {
        object result = null;

        DataTable dt = SqlCmds.SelectQueryEntity("SP_MSTIF_08");

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
    public static Object BindZone()
    {
        object result = null;

        DataTable dt = SqlCmds.SelectQueryEntity("SP_MSTIF_013");

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
    public static Object BindZone_1(string COMPID)
    {
        object result = null;

        Param[0] = COMPID;
        PName[0] = "@COMPID";
        DataTable dt = SqlCmds.SelectDataEntity("SP_MASTERzonebind", Param, PName, Count = 1);

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
    public static Object BindCircle(string zoneid)
    {
        object result = null;

        Param[0] = zoneid;
        PName[0] = "@Zoneid";

        DataTable dt = SqlCmds.SelectDataEntity("SP_MSTSTATION_09", Param, PName, Count = 1);

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
    public static Object BindDivision(string zoneid, string circleid)
    {
        object result = null;

        Param[0] = circleid;
        PName[0] = "@CIRCLEID";
        Param[1] = zoneid;
        PName[1] = "@ZONEID";

        DataTable dt = SqlCmds.SelectDataEntity("SP_MSTSTATION_03", Param, PName, Count = 2);

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
    public static Object BindSubStationName(string zoneid, string circleid, string Divisionid)
    {
        object result = null;

        Param[0] = circleid;
        PName[0] = "@CIRCLEID";
        Param[1] = zoneid;
        PName[1] = "@ZONEID";
        Param[2] = Divisionid;
        PName[2] = "@Divisionid";

        DataTable dt = SqlCmds.SelectDataEntity("SP_MSTIF_01", Param, PName, Count = 3);

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
    public static Object BindVoltage(string ddlTypeCons)
    {
        object result = null;

        DataTable dt = new DataTable();

        if (ddlTypeCons == "3")
        {
            dt = SqlCmds.SelectDataEntity("SP_IFVOLTAGE", Param, PName, Count = 0);
        }
        else if (ddlTypeCons == "16")
        {
            dt = SqlCmds.SelectDataEntity("SP_TRANSVOLTAGE", Param, PName, Count = 0);
        }
        else
        {
            dt = SqlCmds.SelectDataEntity("SP_MSTIF_011", Param, PName, Count = 0);
        }

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
    public static Object BindGeneration()
    {
        object result = null;

        DataTable dt = SqlCmds.SelectQueryEntity("SP_MSTIF_016");

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
    public static Object BindEHT()
    {
        object result = null;

        DataTable dt = SqlCmds.SelectQueryEntity("SP_MSTIF_015");

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
    public static Object BindGenName()
    {
        object result = null;

        DataTable dt = SqlCmds.SelectQueryEntity("SP_KPCLGEN_22");

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
    public static Object BindGENERATION_TYPE(string GenName)
    {
        object result = null;

        Param[0] = GenName;
        PName[0] = "@MGID";

        DataTable dt = SqlCmds.SelectDataEntity("SP_KPCL_Q2", Param, PName, Count = 1);

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
    public static Object BindSubStation(string GenName, string Gen_Type)
    {
        object result = null;

        Param[0] = GenName; Param[1] = Gen_Type;
        PName[0] = "@MGID"; PName[1] = "@GID";

        DataTable dt = SqlCmds.SelectDataEntity("SP_KPCL_Q3", Param, PName, Count = 2);

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
    public static Object GetDataReport(String cid, String zid, String crid, String did, String sid, String vid,
        string gname, string gtype, string gsid, string gid, string tid, string genaratorid, string auxbank)
    {
        HttpContext.Current.Session["ses1"] = null;

        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        Param[0] = "ALL";
        PName[0] = "@DCUTYPE";

        DataTable dt = new DataTable();
        String FLAG = "";


        if (cid != "7")
        {
            int ESCOM = 1;

            if (ESCOM == 0 || cid == "0")
            {
                //ALL
                FLAG = "6";
            }
            else if (ESCOM != 0 && zid == "0")
            {
                if (cid == "0")
                {
                    FLAG = "6";
                }
                else
                {
                    FLAG = "7";

                }
            }
            else if (ESCOM != 0 && zid != "0" && crid == "0")
            {
                //ZONE WISE
                FLAG = "3";

            }
            else if (ESCOM != 0 && zid != "0" && crid != "0" && did == "0")
            {
                //CIRCLE WISE
                FLAG = "4";

            }
            else if (ESCOM != 0 && zid != "0" && crid != "0" && did != "0")

            {
                //DIVISON WISE

                FLAG = "5";

            }
            else
            {
                //ALL
                FLAG = "6";

            }

            Param[0] = crid;
            PName[0] = "@CIRID";
            Param[1] = zid;
            PName[1] = "@ZONEID";
            Param[2] = "";
            PName[2] = "@COMP";
            Param[3] = did;
            PName[3] = "@DIVID";
            Param[4] = FLAG;
            PName[4] = "@FLAG";
            Param[5] = cid;
            PName[5] = "@conid";
            Param[6] = tid;
            PName[6] = "@PPAWBOA";
            Param[7] = genaratorid;
            PName[7] = "@IFID";
            Param[8] = auxbank;
            PName[8] = "@AUXBANK";


            //  dt = SqlCmd.SelectDataEntity("SP_RPTDCUTYPE_Q3", Param, PName, Count = 6);
            //  dt = SqlCmds.SelectDataEntity("SP_RPTDCUTYPE_Q27", Param, PName, Count = 6);

            dt = SqlCmds.SelectDataEntity("SP_RPTDCUTYPE_Q28", Param, PName, Count = 9);

        }
        else
        {
            int ESCOM = 1;

            if (ESCOM == 0 || cid == "0")
            {
                //ALL
                FLAG = "6";
            }
            else if (ESCOM != 0 && gid == "0")
            {
                FLAG = "6";
            }
            else if (ESCOM != 0 && gid != "0" && gtype == "0")
            {
                //ZONE WISE
                FLAG = "3";

            }
            else if (ESCOM != 0 && gid != "0" && gtype != "0" && gsid == "0")
            {
                //CIRCLE WISE
                FLAG = "4";

            }
            else if (ESCOM != 0 && gid != "0" && gtype != "0" && gsid != "0")

            {
                //DIVISON WISE
                FLAG = "5";

            }
            else
            {
                //ALL
                FLAG = "6";

            }

            Param[0] = gtype;
            PName[0] = "@CIRID";
            Param[1] = gid;
            PName[1] = "@ZONEID";

            Param[2] = "";
            PName[2] = "@COMP";
            Param[3] = gsid;
            PName[3] = "@DIVID";
            Param[4] = FLAG;
            PName[4] = "@FLAG";
            dt = SqlCmds.SelectDataEntity("SP_RPTDCUTYPE_Q4", Param, PName, Count = 5);

        }

        if (zid != "0")
        {
            if (dt.Columns.Contains("ZONE"))
            {
                dt.Columns.Remove("ZONE");
            }
        }
        if (crid != "0" && crid != "")
        {
            if (dt.Columns.Contains("CircleName"))
            {
                dt.Columns.Remove("CircleName");
            }

            if (dt.Columns.Contains("CIRCLE"))
            {
                dt.Columns.Remove("CIRCLE");
            }
        }
        if (did != "0" && did != "")
        {
            if (dt.Columns.Contains("DivisionName"))
            {
                dt.Columns.Remove("DivisionName");
            }
            if (dt.Columns.Contains("DIVISION"))
            {
                dt.Columns.Remove("DIVISION");
            }
        }
        if (sid != "0" && sid != "")
        {
            if (dt.Columns.Contains("STATION NAME"))
            {
                dt.Columns.Remove("STATION NAME");
            }
            if (dt.Columns.Contains("STATION"))
            {
                dt.Columns.Remove("STATION");
            }
        }


        if (dt.Rows.Count > 0)
        {
            DataColumn col = dt.Columns.Add("SLNO", System.Type.GetType("System.String"));
            col.SetOrdinal(0);
            int sl = 1;
            for (int k = 0; k <= dt.Rows.Count - 1; k++)
            {
                dt.Rows[k]["SLNO"] = sl++;
            }
        }



        int rowCount = 0, colCount = 0;
        rowCount = dt.Rows.Count;
        //rowCount = 40;
        colCount = dt.Columns.Count;




        obj = new object[rowCount][];
        for (int currentrow = 0; currentrow < rowCount; currentrow++)
        {
            obj[currentrow] = new object[colCount];
            for (int currentcolumn = 0; currentcolumn < colCount; currentcolumn++)
            {
                obj[currentrow][currentcolumn] = dt.Rows[currentrow][currentcolumn];
            }
        }
        HttpContext.Current.Session["ses1"] = "Completed";

        return obj;
    }



    [WebMethod]
    public static Object GetDataReportkpcl(String cid, String zid, String crid, String did, String sid, String vid, string gname, string gtype, string gsid, string gid)
    {
        HttpContext.Current.Session["ses1"] = null;

        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        Param[0] = "ALL";
        PName[0] = "@DCUTYPE";

        DataTable dt = new DataTable();
        String FLAG = "";


        if (cid != "7")
        {
            int ESCOM = 1;

            if (ESCOM == 0 || cid == "0")
            {
                //ALL
                FLAG = "6";
            }
            else if (ESCOM != 0 && zid == "0")
            {
                if (cid == "0")
                {
                    FLAG = "6";
                }
                else
                {
                    FLAG = "7";

                }
            }
            else if (ESCOM != 0 && zid != "0" && cid == "0")
            {
                //ZONE WISE
                FLAG = "3";

            }
            else if (ESCOM != 0 && zid != "0" && cid != "0" && did == "0")
            {
                //CIRCLE WISE
                FLAG = "4";

            }
            else if (ESCOM != 0 && zid != "0" && cid != "0" && did != "0")

            {
                //DIVISON WISE

                FLAG = "5";

            }
            else
            {
                //ALL
                FLAG = "6";

            }

            Param[0] = cid;
            PName[0] = "@CIRID";
            Param[1] = zid;
            PName[1] = "@ZONEID";

            Param[2] = "";
            PName[2] = "@COMP";
            Param[3] = did;
            PName[3] = "@DIVID";
            Param[4] = FLAG;
            PName[4] = "@FLAG";
            Param[5] = cid;
            PName[5] = "@conid";
            // dt = SqlCmd.SelectDataEntity("SP_RPTDCUTYPE_Q3", Param, PName, Count = 6);
            dt = SqlCmds.SelectDataEntity("SP_RPTDCUTYPE_Q17", Param, PName, Count = 6);

        }
        else
        {
            int ESCOM = 1;

            if (ESCOM == 0 || cid == "0")
            {
                //ALL
                FLAG = "6";
            }
            else if (ESCOM != 0 && gname == "0")
            {
                FLAG = "6";
            }
            else if (ESCOM != 0 && gname != "0" && gtype == "0")
            {
                //ZONE WISE
                FLAG = "3";

            }
            else if (ESCOM != 0 && gname != "0" && gtype != "0" && gsid == "0")
            {
                //CIRCLE WISE
                FLAG = "4";

            }
            else if (ESCOM != 0 && gname != "0" && gtype != "0" && gsid != "0")

            {
                //DIVISON WISE
                FLAG = "5";

            }
            else
            {
                //ALL
                FLAG = "6";

            }

            Param[0] = gtype;
            PName[0] = "@CIRID";
            Param[1] = gname;
            PName[1] = "@ZONEID";

            Param[2] = "";
            PName[2] = "@COMP";
            Param[3] = gsid;
            PName[3] = "@DIVID";
            Param[4] = FLAG;
            PName[4] = "@FLAG";
            dt = SqlCmds.SelectDataEntity("SP_RPTDCUTYPE_Q14", Param, PName, Count = 5);

        }




        if (dt.Rows.Count > 0)
        {
            DataColumn col = dt.Columns.Add("SLNO", System.Type.GetType("System.String"));
            col.SetOrdinal(0);
            int sl = 1;
            for (int k = 0; k <= dt.Rows.Count - 1; k++)
            {
                dt.Rows[k]["SLNO"] = sl++;
            }
        }



        int rowCount = 0, colCount = 0;
        rowCount = dt.Rows.Count;
        // rowCount = 50;
        colCount = dt.Columns.Count;




        obj = new object[rowCount][];
        for (int currentrow = 0; currentrow < rowCount; currentrow++)
        {
            obj[currentrow] = new object[colCount];
            for (int currentcolumn = 0; currentcolumn < colCount; currentcolumn++)
            {
                obj[currentrow][currentcolumn] = dt.Rows[currentrow][currentcolumn];
            }
        }
        HttpContext.Current.Session["ses1"] = "Completed";

        return obj;
    }





    [WebMethod]
    public static Dictionary<string, string> LoginwiseFreeze()
    {
        var sessionValues = new Dictionary<string, string>();


        //HttpContext.Current.Session["DEPTid"] = "4";
        //HttpContext.Current.Session["COMPID"] = "200001";
        //HttpContext.Current.Session["zoneid"] = "4";
        //HttpContext.Current.Session["cirid"] = "2";
        //HttpContext.Current.Session["divid"] = "02";


        HttpContext.Current.Session["DEPTid"] = null;
        HttpContext.Current.Session["COMPID"] = null;
        HttpContext.Current.Session["zoneid"] = null;
        HttpContext.Current.Session["cirid"] = null;
        HttpContext.Current.Session["divid"] = null;


        int ID = Convert.ToInt32(HttpContext.Current.Session["DEPTid"]);
        sessionValues["DEPTid"] = ID.ToString();

        if (HttpContext.Current.Session["COMPID"] != null)
            sessionValues["COMPID"] = HttpContext.Current.Session["COMPID"].ToString();

        if (HttpContext.Current.Session["zoneid"] != null)
            sessionValues["zoneid"] = HttpContext.Current.Session["zoneid"].ToString();

        if (HttpContext.Current.Session["cirid"] != null)
            sessionValues["cirid"] = HttpContext.Current.Session["cirid"].ToString();

        if (HttpContext.Current.Session["divid"] != null)
            sessionValues["divid"] = HttpContext.Current.Session["divid"].ToString();

        return sessionValues;
    }



    [WebMethod]
    public static Object Bindgenerators(string zoneid, string circleid, string Divisionid, string cid, string TypeOfGen, string typeofMode,
        string EHT_ID)
    {
        object result = null;

        if (cid == "1")
        {
            EHT_ID = "0";
        }
        if (cid == "2")
        {
            TypeOfGen = "0";
        }



        Param[0] = zoneid;
        PName[0] = "@ZoneID";
        Param[1] = circleid;
        PName[1] = "@CIRID";
        Param[2] = Divisionid;
        PName[2] = "@DivID";
        Param[3] = cid;
        PName[3] = "@CONSUMERID";
        Param[4] = typeofMode;
        PName[4] = "@PPAWBOA";
        Param[5] = TypeOfGen;
        PName[5] = "@GENID";
        Param[6] = EHT_ID;
        PName[6] = "@TYPE_EHT_ID";

        DataTable dt = SqlCmds.SelectDataEntity("SP_GENRATORS", Param, PName, Count = 7);

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