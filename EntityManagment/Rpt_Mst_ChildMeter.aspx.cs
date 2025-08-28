using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rpt_Mst_ChildMeter : System.Web.UI.Page
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
    public static Object GetDataReport(String cid, String zid, String crid, String did, String sid, String vid, string gname, string gtype, string gsid, string gid)
    {
        HttpContext.Current.Session["ses1"] = null;

        //JSON.stringify({ did: did, cid: cid, zid: zid, ifid: ifid, consumer: consumer, dcutype: dcutype, slot: slot, month: month, mmch: mmch, fdate: fdate, todate: todate, datetype: datetype }),

        // List<getdata5> dcdata = new List<getdata5>();
        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        DateTime intialdt = DateTime.Now;
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        //if (cid == "-1")
        if (cid == "0")
        {
            if (zid == "0")
            {
                try
                {

                    string voltid = vid;
                    Param[0] = voltid;
                    PName[0] = "@Voltid";
                    //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q50", Param, PName, Count = 1);
                    //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILD_Q1", Param, PName, Count = 0); 
                    dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILD_Q1_1", Param, PName, Count = 0);

                    if (dt.Rows.Count > 0)
                    {
                        // dt.Merge(dt1);

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


                        //  ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
                    }
                    else
                    {
                        //  grdEntityDtls.DataSource = null;
                        //  grdEntityDtls.DataBind();

                        ////  ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                        //  //  msg.ShowAlertMessage("No Data Found");
                        //  return;
                    }
                }
                catch (Exception ex)
                {

                    //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
                    ////  msg.ShowAlertMessage(ex.Message);
                    //return;
                }
            }
            else if (crid == "0")
            {

                string TypeCons = cid;
                string typecon = cid;
                string zone7 = zid;
                string ddlzone = zid;
                Param[0] = zone7;
                PName[0] = "@Zone";


                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDZONE_Q1", Param, PName, Count = 1);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDZONE_Q1_1", Param, PName, Count = 1);

            }
            else if (did == "0")
            {

                string zone9 = zid;
                string frs = zid;
                string Zone10 = zid;
                string circl5 = crid;
                string frs1 = crid;
                string circle6 = crid;
                Param[0] = zone9;
                Param[1] = circl5;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q52", Param, PName, Count = 2);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDCIR_Q1", Param, PName, Count = 2);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDCIR_Q1_1", Param, PName, Count = 2);

            }
            else if (sid == "--ALL SUB-STATION--")
            {

                string zone7 = zid;
                string ddl = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddl1 = crid;
                string circle5 = crid;
                string division2 = did;
                string ddl2 = did;
                string division3 = did;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";

                //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q53", Param, PName, Count = 3);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDIV_Q1", Param, PName, Count = 3);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDIV_Q1_1", Param, PName, Count = 3);
            }
            else if (sid != "0")
            {

                string zone7 = zid;
                string ddzone = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddcircle = crid;
                string circle5 = crid;
                string division2 = did;
                string dddiv = did;
                string division3 = did;
                string SUBSTAION = sid;
                string sub = sid;
                //string substaionname = sub.Remove(0, 8);
                string consumer1 = cid;
                string consumer = cid;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                Param[3] = SUBSTAION;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                PName[3] = "@SUBSTATION";

                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q54", Param, PName, Count = 4);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILSTA_Q1", Param, PName, Count = 4);

                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILSTA_Q1_1", Param, PName, Count = 4);
            }
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
                //// msg.ShowAlertMessage("No Data Found");
                //return;
            }
        }
        if (cid == "1")
        {
            if (zid == "0")
            {
                try
                {

                    string voltid = vid;
                    Param[0] = cid;
                    PName[0] = "@CID";

                    //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q50", Param, PName, Count = 1);                   
                    // dt1 = SqlCmd.SelectDataMDAS("SP_MTR_KPCL_Q4", Param, PName, Count = 0);
                    //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILD_Q2", Param, PName, Count = 1);
                    dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILD_Q2_1", Param, PName, Count = 1);
                    if (dt.Rows.Count > 0)
                    {
                        // dt.Merge(dt1);

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


                        //  ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
                    }
                    else
                    {
                        //  grdEntityDtls.DataSource = null;
                        //  grdEntityDtls.DataBind();

                        ////  ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                        //  //  msg.ShowAlertMessage("No Data Found");
                        //  return;
                    }
                }
                catch (Exception ex)
                {

                    //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
                    ////  msg.ShowAlertMessage(ex.Message);
                    //return;
                }
            }
            else if (crid == "0")
            {

                string TypeCons = cid;
                string typecon = cid;
                string zone7 = zid;
                string ddlzone = zid;
                Param[0] = zone7;
                PName[0] = "@Zone";
                Param[1] = cid;
                PName[1] = "@CID";
                //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q01", Param, PName, Count = 1);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDZONE_Q2", Param, PName, Count = 2); 
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDZONE_Q2_1", Param, PName, Count = 2);
            }
            else if (did == "0")
            {

                string zone9 = zid;
                string frs = zid;
                string Zone10 = zid;
                string circl5 = crid;
                string frs1 = crid;
                string circle6 = crid;
                Param[0] = zone9;
                Param[1] = circl5;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                Param[2] = cid;
                PName[2] = "@CID";
                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q52", Param, PName, Count = 2);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDCIR_Q2", Param, PName, Count = 3);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDCIR_Q2_1", Param, PName, Count = 3);

            }
            else if (gid == "0")
            {

                string zone7 = zid;
                string ddl = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddl1 = crid;
                string circle5 = crid;
                string division2 = did;
                string ddl2 = did;
                string division3 = did;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                Param[3] = cid;
                PName[3] = "@CID";
                //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q53", Param, PName, Count = 3);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDIV_Q2", Param, PName, Count = 4);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDIV_Q2_1", Param, PName, Count = 4);
            }
            else if (gid != "0")
            {

                string zone7 = zid;
                string ddzone = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddcircle = crid;
                string circle5 = crid;
                string division2 = did;
                string dddiv = did;
                string division3 = did;
                string SUBSTAION = gid;
                string sub = sid;
                //string substaionname = sub.Remove(0, 8);
                string consumer1 = cid;
                string consumer = cid;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                Param[3] = SUBSTAION;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                PName[3] = "@GENID";
                Param[4] = cid;
                PName[4] = "@CID";
                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q54", Param, PName, Count = 4);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILGEN_Q2", Param, PName, Count = 5);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILGEN_Q2_1", Param, PName, Count = 5);
            }
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
                //// msg.ShowAlertMessage("No Data Found");
                //return;
            }
        }
        if (cid == "3")
        {
            if (zid == "0")
            {
                try
                {

                    string voltid = vid;
                    Param[0] = cid;
                    PName[0] = "@CID";

                    //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q50", Param, PName, Count = 1);                    
                    // dt1 = SqlCmd.SelectDataMDAS("SP_MTR_KPCL_Q4", Param, PName, Count = 0);
                    //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILD_Q2", Param, PName, Count = 1);
                    dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILD_Q2_1", Param, PName, Count = 1);

                    if (dt.Rows.Count > 0)
                    {
                        // dt.Merge(dt1);

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


                        //  ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
                    }
                    else
                    {
                        //  grdEntityDtls.DataSource = null;
                        //  grdEntityDtls.DataBind();

                        ////  ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                        //  //  msg.ShowAlertMessage("No Data Found");
                        //  return;
                    }
                }
                catch (Exception ex)
                {

                    //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
                    ////  msg.ShowAlertMessage(ex.Message);
                    //return;
                }
            }
            else if (crid == "0")
            {

                string TypeCons = cid;
                string typecon = cid;
                string zone7 = zid;
                string ddlzone = zid;
                Param[0] = zone7;
                PName[0] = "@Zone";
                Param[1] = cid;
                PName[1] = "@CID";
                //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q01", Param, PName, Count = 1);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDZONE_Q2", Param, PName, Count = 2);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDZONE_Q2_1", Param, PName, Count = 2);
            }
            else if (did == "0")
            {

                string zone9 = zid;
                string frs = zid;
                string Zone10 = zid;
                string circl5 = crid;
                string frs1 = crid;
                string circle6 = crid;
                Param[0] = zone9;
                Param[1] = circl5;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                Param[2] = cid;
                PName[2] = "@CID";
                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q52", Param, PName, Count = 2);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDCIR_Q2", Param, PName, Count = 3);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDCIR_Q2_1", Param, PName, Count = 3);

            }
            else if (sid == "--ALL SUB-STATION--")
            {

                string zone7 = zid;
                string ddl = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddl1 = crid;
                string circle5 = crid;
                string division2 = did;
                string ddl2 = did;
                string division3 = did;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                Param[3] = cid;
                PName[3] = "@CID";
                //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q53", Param, PName, Count = 3);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDIV_Q2", Param, PName, Count = 4);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDIV_Q2_1", Param, PName, Count = 4);
            }
            else if (sid != "0")
            {

                string zone7 = zid;
                string ddzone = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddcircle = crid;
                string circle5 = crid;
                string division2 = did;
                string dddiv = did;
                string division3 = did;
                string SUBSTAION = sid;
                string sub = sid;
                //string substaionname = sub.Remove(0, 8);
                string consumer1 = cid;
                string consumer = cid;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                Param[3] = SUBSTAION;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                PName[3] = "@SUBSTATION";
                Param[4] = cid;
                PName[4] = "@CID";
                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q54", Param, PName, Count = 4);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILSTA_Q2", Param, PName, Count = 5);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILSTA_Q2_1", Param, PName, Count = 5);


            }
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
                //// msg.ShowAlertMessage("No Data Found");
                //return;
            }
        }
        if (cid == "12" || cid == "16" || cid == "2")
        {
            if (zid == "0")
            {
                try
                {

                    string voltid = vid;
                    Param[0] = cid;
                    PName[0] = "@CID";

                    //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q50", Param, PName, Count = 1);
                    //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILD_Q2", Param, PName, Count = 1);
                    // dt1 = SqlCmd.SelectDataMDAS("SP_MTR_KPCL_Q4", Param, PName, Count = 0);
                    dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILD_Q2_1", Param, PName, Count = 1);

                    if (dt.Rows.Count > 0)
                    {
                        // dt.Merge(dt1);

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


                        //  ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
                    }
                    else
                    {
                        //  grdEntityDtls.DataSource = null;
                        //  grdEntityDtls.DataBind();

                        ////  ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('No Data Found!', '', 'error');", true);
                        //  //  msg.ShowAlertMessage("No Data Found");
                        //  return;
                    }
                }
                catch (Exception ex)
                {

                    //ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
                    ////  msg.ShowAlertMessage(ex.Message);
                    //return;
                }
            }
            else if (crid == "0")
            {

                string TypeCons = cid;
                string typecon = cid;
                string zone7 = zid;
                string ddlzone = zid;
                Param[0] = zone7;
                PName[0] = "@Zone";
                Param[1] = cid;
                PName[1] = "@CID";
                //dt = SqlCmd.SelectDataMDAS("SP_MSTMTR_Q01", Param, PName, Count = 1);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDZONE_Q2", Param, PName, Count = 2);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDZONE_Q2_1", Param, PName, Count = 2);
            }
            else if (did == "0")
            {

                string zone9 = zid;
                string frs = zid;
                string Zone10 = zid;
                string circl5 = crid;
                string frs1 = crid;
                string circle6 = crid;
                Param[0] = zone9;
                Param[1] = circl5;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                Param[2] = cid;
                PName[2] = "@CID";
                // dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q52", Param, PName, Count = 2);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDCIR_Q2", Param, PName, Count = 3);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDCIR_Q2_1", Param, PName, Count = 3);

            }
            else if (did != "0")
            {

                string zone7 = zid;
                string ddl = zid;
                string Zone8 = zid;
                string circl4 = crid;
                string ddl1 = crid;
                string circle5 = crid;
                string division2 = did;
                string ddl2 = did;
                string division3 = did;
                Param[0] = zone7;
                Param[1] = circl4;
                Param[2] = division2;
                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                Param[3] = cid;
                PName[3] = "@CID";
                //dt = SqlCmd.SelectDataMDAS("SP_MSTMAINMTR_Q53", Param, PName, Count = 3);
                //dt = SqlCmd.SelectDataMDAS("SP_MSTCHILDIV_Q2", Param, PName, Count = 4);
                dt = SqlCmds.SelectDataEntity("SP_RPT_MSTCHILDIV_Q2_1", Param, PName, Count = 4);
            }

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
        object[][] obj = new object[100][];
        DataTable finaldt = new DataTable();
        DateTime intialdt = DateTime.Now;
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();

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
}