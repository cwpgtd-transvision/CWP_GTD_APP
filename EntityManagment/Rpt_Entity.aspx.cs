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

public partial class Rpt_Entity : System.Web.UI.Page
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
    public static Object GetDataReport(String cid, String zid, String crid, String did, String sid, String vid, string gname,
        string gtype, string gsid, string gid, string tid, string genaratorid ,string auxbank)
    {
        HttpContext.Current.Session["ses1"] = null;

        //JSON.stringify({ did: did, cid: cid, zid: zid, ifid: ifid, consumer: consumer, dcutype: dcutype, slot: slot, month: month, mmch: mmch, fdate: fdate, todate: todate, datetype: datetype }),

        // List<getdata5> dcdata = new List<getdata5>();
        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        DateTime intialdt = DateTime.Now;
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        string FLAG = "";
        if (cid == "0")
        {
            FLAG = "6";
        }
        else if (cid != "0" && zid == "0")
        {
            FLAG = "1";
        }
        else if (cid != "0" && zid != "0" && crid == "0")
        {
            FLAG = "3";

        }
        else if (cid != "0" && zid != "0" && crid != "0" && did == "0")
        {
            FLAG = "4";

        }
        else if (cid != "0" && zid != "0" && crid != "0" && did != "0")
        {
            FLAG = "5";

        }
        else
        {
            FLAG = "6";

        }

        if (cid == "0")
        {

            string zone7 = zid;
            string circl4 = crid;
            string division2 = did;
            string typecon = cid;
            string consumer1 = cid;
            string consumer = cid;
            string genid = gid;
            string Voltid = vid;
            Param[0] = zone7;
            Param[1] = circl4;
            Param[2] = division2;

            Param[3] = "";
            Param[4] = FLAG;
            Param[5] = consumer;
            Param[6] = typecon;

            PName[0] = "@ZoneID";
            PName[1] = "@CIRID";
            PName[2] = "@DivID";

            PName[3] = "@STAID";
            PName[4] = "@FLAG";
            PName[5] = "@COMP";
            PName[6] = "@CONSUMER";
            //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q09", Param, PName, Count = 6);
            dt = SqlCmds.SelectDataEntity("SP_RPT_ENTITY_Q1", Param, PName, Count = 6);
        }
        else if (cid == "1")
        {

            string zone7 = zid;
            string circl4 = crid;
            string division2 = did;
            string typecon = cid;
            string consumer1 = cid;
            string consumer = cid;
            string genid = gid;
            string Voltid = vid;
            Param[0] = zone7;
            Param[1] = circl4;
            Param[2] = division2;
            Param[3] = "";
            Param[4] = FLAG;
            Param[5] = consumer;
            //Param[6] = typecon;
            Param[6] = tid;
            Param[7] = genaratorid;

            PName[0] = "@ZoneID";
            PName[1] = "@CIRID";
            PName[2] = "@DivID";
            PName[3] = "@STAID";
            PName[4] = "@FLAG";
            PName[5] = "@COMP";
            //PName[6] = "@CONSUMER";
            PName[6] = "@PPAWBOA";
            PName[7] = "@IFID";
            //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q09", Param, PName, Count = 6);
            dt = SqlCmds.SelectDataEntity("SP_RPT_ENTITY_Q2", Param, PName, Count = 8);
            if (dt.Rows.Count > 0)
            {
                if (dt.Columns.Contains("REFMTRREMARKS"))
                {
                    dt.Columns.Remove("REFMTRREMARKS");
                }
                if (dt.Columns.Contains("REFMTRFLAG"))
                {
                    dt.Columns.Remove("REFMTRFLAG");
                }
                if (dt.Columns.Contains("STATION_NAME"))
                {
                    dt.Columns["STATION_NAME"].ColumnName = "STATION";
                }
                if (dt.Columns.Contains("IFPOINT NAME"))
                {
                    dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                }
                if (dt.Columns.Contains("METER NO"))
                {
                    dt.Columns["METER NO"].ColumnName = "METER SL NO";
                }
                if (dt.Columns.Contains("VOLTAGE (kV)"))
                {
                    dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                }
                //grdEntityDtls.DataSource = dt;
                //grdEntityDtls.DataBind();
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
            }
            else
            {
                //grdEntityDtls.DataSource = null;
                //grdEntityDtls.DataBind();

                //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                ////msg.ShowAlertMessage("No Data Found");
                //return;
            }
        }
        else if (cid == "2")
        {

            string zone7 = zid;
            string circl4 = crid;
            string division2 = did;
            string typecon = cid;
            string consumer1 = cid;
            string consumer = cid;
            string genid = gid;
            string Voltid = vid;
            Param[0] = zone7;
            Param[1] = circl4;
            Param[2] = division2;
            Param[3] = "";
            Param[4] = FLAG;
            Param[5] = consumer;
            Param[6] = tid;
            Param[7] = genaratorid;


            PName[0] = "@ZoneID";
            PName[1] = "@CIRID";
            PName[2] = "@DivID";
            PName[3] = "@STAID";
            PName[4] = "@FLAG";
            PName[5] = "@COMP";
            PName[6] = "@PPAWBOA";
            PName[7] = "@IFID";
            //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q09", Param, PName, Count = 6);
            dt = SqlCmds.SelectDataEntity("SP_RPT_ENTITY_Q3", Param, PName, Count = 8);
            if (dt.Rows.Count > 0)
            {
                if (dt.Columns.Contains("REFMTRREMARKS"))
                {
                    dt.Columns.Remove("REFMTRREMARKS");
                }
                if (dt.Columns.Contains("REFMTRFLAG"))
                {
                    dt.Columns.Remove("REFMTRFLAG");
                }
                if (dt.Columns.Contains("STATION_NAME"))
                {
                    dt.Columns["STATION_NAME"].ColumnName = "STATION";
                }
                if (dt.Columns.Contains("IFPOINT NAME"))
                {
                    dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                }
                if (dt.Columns.Contains("METER NO"))
                {
                    dt.Columns["METER NO"].ColumnName = "METER SL NO";
                }
                if (dt.Columns.Contains("VOLTAGE (kV)"))
                {
                    dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                }
                //grdEntityDtls.DataSource = dt;
                //grdEntityDtls.DataBind();
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
            }
            else
            {
                //grdEntityDtls.DataSource = null;
                //grdEntityDtls.DataBind();

                //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                ////msg.ShowAlertMessage("No Data Found");
                //return;
            }
        }
        else
        {

            string zone7 = zid;
            string circl4 = crid;
            string division2 = did;
            string typecon = cid;
            string consumer1 = cid;
            string consumer = cid;
            string genid = gid;
            string Voltid = vid;
            Param[0] = zone7;
            Param[1] = circl4;
            Param[2] = division2;
            Param[3] = "";
            Param[4] = FLAG;
            Param[5] = consumer;
            Param[6] = typecon;
            Param[7] = auxbank;

            PName[0] = "@ZoneID";
            PName[1] = "@CIRID";
            PName[2] = "@DivID";
            PName[3] = "@STAID";
            PName[4] = "@FLAG";
            PName[5] = "@COMP";
            PName[6] = "@CONSUMER";
            PName[7] = "@AUXBANK";

            //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q09", Param, PName, Count = 6);
            dt = SqlCmds.SelectDataEntity("SP_RPT_ENTITY_Q4", Param, PName, Count = 8);
            if (dt.Rows.Count > 0)
            {
                if (dt.Columns.Contains("REFMTRREMARKS"))
                {
                    dt.Columns.Remove("REFMTRREMARKS");
                }
                if (dt.Columns.Contains("REFMTRFLAG"))
                {
                    dt.Columns.Remove("REFMTRFLAG");
                }
                if (dt.Columns.Contains("STATION_NAME"))
                {
                    dt.Columns["STATION_NAME"].ColumnName = "STATION";
                }
                if (dt.Columns.Contains("IFPOINT NAME"))
                {
                    dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                }
                if (dt.Columns.Contains("METER NO"))
                {
                    dt.Columns["METER NO"].ColumnName = "METER SL NO";
                }
                if (dt.Columns.Contains("VOLTAGE (kV)"))
                {
                    dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                }
                //grdEntityDtls.DataSource = dt;
                //grdEntityDtls.DataBind();
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
            }
            else
            {
                //grdEntityDtls.DataSource = null;
                //grdEntityDtls.DataBind();

                //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                ////msg.ShowAlertMessage("No Data Found");
                //return;
            }
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
        }




        if (dt.Columns.Contains("ifpointname"))
        {
            dt.Columns.Remove("ifpointname");
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

        //JSON.stringify({ did: did, cid: cid, zid: zid, ifid: ifid, consumer: consumer, dcutype: dcutype, slot: slot, month: month, mmch: mmch, fdate: fdate, todate: todate, datetype: datetype }),

        // List<getdata5> dcdata = new List<getdata5>();
        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        DateTime intialdt = DateTime.Now;
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        if (cid == "-1" || cid == "0")
        {
            //if (zid == "0")
            {
                try
                {

                    //string voltid = vid;
                    //Param[0] = voltid;
                    //PName[0] = "@Voltid";

                    ////dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q50", Param, PName, Count = 1);
                    //// dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q77", Param, PName, Count = 1);
                    //dt = SqlCmds.SelectDataEntity("SP_MTR_KPCL_Q4", Param, PName, Count = 0);


                    string GENNAME = gname;
                    string GENTYPE = gtype;
                    string STATION = gsid;
                    Param[0] = GENNAME;
                    Param[1] = GENTYPE;
                    Param[2] = STATION;
                    PName[0] = "@MGEID";
                    PName[1] = "@GEID";
                    PName[2] = "@GSTN_ID";
                    dt = SqlCmds.SelectDataEntity("SP_MTR_KPCL_Q5", Param, PName, Count = 3);



                    if (dt.Columns.Contains("SLNO"))
                    {
                        dt.Columns.Remove("SLNO");
                    }
                    if (dt.Columns.Contains("REFMTRFLAG"))
                    {
                        dt.Columns.Remove("REFMTRFLAG");
                    }
                    if (dt.Columns.Contains("STATION_NAME"))
                    {
                        dt.Columns["STATION_NAME"].ColumnName = "STATION";
                    }
                    if (dt.Columns.Contains("IFPOINT NAME"))
                    {
                        dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                    }
                    if (dt.Columns.Contains("METER NO"))
                    {
                        dt.Columns["METER NO"].ColumnName = "METER SL NO";
                    }
                    if (dt.Columns.Contains("VOLTAGE (kV)"))
                    {
                        dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                    }

                }
                catch (Exception ex)
                {

                    //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
                    ////  msg.ShowAlertMessage(ex.Message);
                    //return;
                }
            }

        }
        else if (cid == "7")
        {


            string GENNAME = gname;
            string GENTYPE = gtype;
            string STATION = gsid;
            Param[0] = GENNAME;
            Param[1] = GENTYPE;
            Param[2] = STATION;
            PName[0] = "@MGEID";
            PName[1] = "@GEID";
            PName[2] = "@GSTN_ID";
            dt = SqlCmds.SelectDataEntity("SP_MTR_KPCL_Q5", Param, PName, Count = 3);
            if (dt.Rows.Count > 0)
            {
                if (dt.Columns.Contains("SLNO"))
                {
                    dt.Columns.Remove("SLNO");
                }
                if (dt.Columns.Contains("REFMTRFLAG"))
                {
                    dt.Columns.Remove("REFMTRFLAG");
                }
                if (dt.Columns.Contains("STATION_NAME"))
                {
                    dt.Columns["STATION_NAME"].ColumnName = "STATION";
                }
                if (dt.Columns.Contains("IFPOINT NAME"))
                {
                    dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                }
                if (dt.Columns.Contains("METER NO"))
                {
                    dt.Columns["METER NO"].ColumnName = "METER SL NO";
                }
                if (dt.Columns.Contains("VOLTAGE (kV)"))
                {
                    dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                }
                //grdEntityDtls.DataSource = dt5;
                //grdEntityDtls.DataBind();
                //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
            }
            else
            {
                //grdEntityDtls.Visible = false;

                //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                ////msg.ShowAlertMessage("No Data Found");
                //return;
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
    public static Object Bindgenerators(string zoneid, string circleid, string Divisionid, string cid ,string TypeOfGen ,string typeofMode ,
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



    [WebMethod]
    public static Object BindBankAux(string zoneid, string circleid, string Divisionid, string cid, string AUX)
    {
        object result = null;

        Param[0] = zoneid;
        PName[0] = "@ZoneID";
        Param[1] = circleid;
        PName[1] = "@CIRID";
        Param[2] = Divisionid;
        PName[2] = "@DivID";
        Param[3] = cid;
        PName[3] = "@CONSUMERID";
        Param[4] = AUX;
        PName[4] = "@AuxBank";

        DataTable dt = SqlCmds.SelectDataEntity("SP_AUX_BANK_Q1", Param, PName, Count = 5);

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