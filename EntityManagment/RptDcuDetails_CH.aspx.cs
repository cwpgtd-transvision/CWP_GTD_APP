using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class RptDcuDetails_CH : System.Web.UI.Page
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

    [System.Web.Services.WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Object BindSubStations(string Gen_Type, string GenName)
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

    [System.Web.Services.WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Object GetDataReport(String con, String zid, String cid, String did, String sis, string gid, string gtid, string gsid)
    {

        HttpContext.Current.Session["ses1"] = null;

        //JSON.stringify({ did: did, cid: cid, zid: zid, ifid: ifid, consumer: consumer, dcutype: dcutype, slot: slot, month: month, mmch: mmch, fdate: fdate, todate: todate, datetype: datetype }),

        // List<getdata5> dcdata = new List<getdata5>();
        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        Param[0] = "ALL";
        PName[0] = "@DCUTYPE";

        DataTable dt = new DataTable();
        String FLAG = "";


        if (con != "7")
        {
            try
            {
                int ESCOM = 1;

            if (ESCOM == 0)
            {
                //ALL
                FLAG = "6";
            }
            else if (ESCOM != 0 && zid == "0")
            {
                if (con == "-1")
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
            Param[5] = con;
            PName[5] = "@conid";
            // dt = SqlCmd.SelectDataMDAS("SP_RPTDCUTYPE_Q3", Param, PName, Count = 6);

           
                dt = SqlCmds.SelectDataEntity("SP_RPTDCUTYPE_CH_Q1", Param, PName, Count = 6);
            }
            catch (Exception ex)
            {

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
        rowCount = 50;
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

}