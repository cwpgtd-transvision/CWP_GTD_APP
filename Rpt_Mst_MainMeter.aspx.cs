using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class templates_Masterdata_Rpt_Mst_MainMeter : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    alertmsg msg = new alertmsg();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] == null)
        {
            Response.Redirect("/templates/login/singlelogin.aspx");
        }
        else
        {

        }
        if (!IsPostBack)
        {
            TYPECONSUMERGRID();
            zoneBind();
            BindGenName();
            EHTBIND();
            generationbind();
            bindvoltage();
        }
    }

    //[WebMethod]
    //public static Object GetDataReport(String cid, String zid, String crid, String did, String sid, String vid, string gname, string gtype, string gsid, string gid)
    //{
    //    object result = null;
    //    object[][] obj = new object[100][];
    //    DataTable finaldt = new DataTable();
    //    DateTime intialdt = DateTime.Now;
    //    DataTable dt = new DataTable();
    //    DataTable dt1 = new DataTable();
    //    if (cid == "-1")
    //    {
    //        if (zid == "0")
    //        {
    //            try
    //            {

    //                string voltid = vid;
    //                Param[0] = voltid;
    //                PName[0] = "@Voltid";

    //                dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q77_1", Param, PName, Count = 1);
    //                dt1 = SqlCmd.SelectDataEntity("SP_MTR_KPCL_Q4_1", Param, PName, Count = 0);
    //                if (dt.Rows.Count > 0)
    //                {

    //                    if (dt.Columns.Contains("REFMTRREMARKS"))
    //                    {
    //                        dt.Columns.Remove("REFMTRREMARKS");
    //                    }
    //                    if (dt.Columns.Contains("REFMTRFLAG"))
    //                    {
    //                        dt.Columns.Remove("REFMTRFLAG");
    //                    }
    //                    if (dt.Columns.Contains("STATION_NAME"))
    //                    {
    //                        dt.Columns["STATION_NAME"].ColumnName = "STATION";
    //                    }
    //                    if (dt.Columns.Contains("IFPOINT NAME"))
    //                    {
    //                        dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
    //                    }
    //                    if (dt.Columns.Contains("METER NO"))
    //                    {
    //                        dt.Columns["METER NO"].ColumnName = "METER SL NO";
    //                    }
    //                    if (dt.Columns.Contains("VOLTAGE (kV)"))
    //                    {
    //                        dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
    //                    }

    //                }
    //                else
    //                {
                       
    //                }
    //            }
    //            catch (Exception ex)
    //            {

    //            }
    //        }
    //        else if (crid == "0")
    //        {

    //            string TypeCons = cid;
    //            string typecon = cid;
    //            string zone7 = zid;
    //            string ddlzone = zid;
    //            Param[0] = zone7;
    //            PName[0] = "@Zone";

    //            //dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q01", Param, PName, Count = 1);
    //            dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q78_1", Param, PName, Count = 1);
    //        }
    //        else if (did == "0")
    //        {

    //            string zone9 = zid;
    //            string frs = zid;
    //            string Zone10 = zid;
    //            string circl5 = crid;
    //            string frs1 = crid;
    //            string circle6 = crid;
    //            Param[0] = zone9;
    //            Param[1] = circl5;
    //            PName[0] = "@Zone";
    //            PName[1] = "@CIRCLE";
    //            // dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q52", Param, PName, Count = 2);
    //            dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q79_1", Param, PName, Count = 2);

    //        }
    //        else if (sid == "0")
    //        {

    //            string zone7 = zid;
    //            string ddl = zid;
    //            string Zone8 = zid;
    //            string circl4 = crid;
    //            string ddl1 = crid;
    //            string circle5 = crid;
    //            string division2 = did;
    //            string ddl2 = did;
    //            string division3 = did;
    //            Param[0] = zone7;
    //            Param[1] = circl4;
    //            Param[2] = division2;
    //            PName[0] = "@Zone";
    //            PName[1] = "@CIRCLE";
    //            PName[2] = "@Division";

    //            dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q80_1", Param, PName, Count = 3);
    //        }
    //        else if (sid != "0")
    //        {

    //            string zone7 = zid;
    //            string ddzone = zid;
    //            string Zone8 = zid;
    //            string circl4 = crid;
    //            string ddcircle = crid;
    //            string circle5 = crid;
    //            string division2 = did;
    //            string dddiv = did;
    //            string division3 = did;
    //            string SUBSTAION = sid;
    //            string sub = sid;
    //            string consumer1 = cid;
    //            string consumer = cid;
    //            Param[0] = zone7;
    //            Param[1] = circl4;
    //            Param[2] = division2;
    //            Param[3] = SUBSTAION;
    //            PName[0] = "@Zone";
    //            PName[1] = "@CIRCLE";
    //            PName[2] = "@Division";
    //            PName[3] = "@SUBSTATION";

    //            dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q81_1", Param, PName, Count = 4);
    //        }
    //        if (dt.Rows.Count > 0)
    //        {
    //            if (dt.Columns.Contains("REFMTRREMARKS"))
    //            {
    //                dt.Columns.Remove("REFMTRREMARKS");
    //            }
    //            if (dt.Columns.Contains("REFMTRFLAG"))
    //            {
    //                dt.Columns.Remove("REFMTRFLAG");
    //            }
    //        }
    //        else
    //        {
             
    //        }
    //    }
    //    else if (cid == "3")
    //    {

    //        string zone8 = zid;
    //        string circl5 = crid;
    //        string division4 = did;
    //        string SUBSTAION1 = sid;
    //        string typecon = cid;
    //        string consumer2 = cid;
    //        string consumer3 = cid;
    //        string voltid = vid;
    //        string Voltid1 = "";

    //        if (voltid == "6")
    //        {
    //            voltid = "14";
    //            Voltid1 = "16";
    //        }
    //        if (voltid == "7")
    //        {
    //            voltid = "15";
    //            Voltid1 = "17";
    //        }

    //        Param[0] = zone8;
    //        Param[1] = circl5;
    //        Param[2] = division4;
    //        Param[3] = typecon;
    //        Param[4] = SUBSTAION1;
    //        Param[5] = voltid;
    //        Param[6] = Voltid1;
    //        PName[0] = "@Zone";
    //        PName[1] = "@CIRCLE";
    //        PName[2] = "@Division";
    //        PName[3] = "@entityid";
    //        PName[4] = "@SUBSTAION";
    //        PName[5] = "@Voltid";
    //        PName[6] = "@Voltid1";

    //        dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q06_1", Param, PName, Count = 7);
    //        if (dt.Rows.Count > 0)
    //        {
    //            if (dt.Columns.Contains("REFMTRREMARKS"))
    //            {
    //                dt.Columns.Remove("REFMTRREMARKS");
    //            }
    //            if (dt.Columns.Contains("REFMTRFLAG"))
    //            {
    //                dt.Columns.Remove("REFMTRFLAG");
    //            }
    //            if (dt.Columns.Contains("STATION_NAME"))
    //            {
    //                dt.Columns["STATION_NAME"].ColumnName = "STATION";
    //            }
    //            if (dt.Columns.Contains("IFPOINT NAME"))
    //            {
    //                dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
    //            }
    //            if (dt.Columns.Contains("METER NO"))
    //            {
    //                dt.Columns["METER NO"].ColumnName = "METER SL NO";
    //            }
    //            if (dt.Columns.Contains("VOLTAGE (kV)"))
    //            {
    //                dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
    //            }
    //        }
    //        else
    //        {
              
    //        }
    //    }
    //    else if (cid == "7")
    //    {
    //    }
    //    else
    //    {

    //        string zone7 = zid;
    //        string circl4 = crid;
    //        string division2 = did;
    //        string typecon = cid;
    //        string consumer1 = cid;
    //        string consumer = cid;
    //        string genid = gid;
    //        string Voltid = vid;
    //        Param[0] = zone7;
    //        Param[1] = circl4;
    //        Param[2] = division2;
    //        Param[3] = typecon;
    //        Param[4] = genid;
    //        Param[5] = Voltid;

    //        PName[0] = "@Zone";
    //        PName[1] = "@CIRCLE";
    //        PName[2] = "@Division";
    //        PName[3] = "@entityid";
    //        PName[4] = "@genid";
    //        PName[5] = "@Voltid";
    //        if (cid == "1")
    //        {
    //            dt = SqlCmd.SelectDataEntity("SP_MSTMTR_gen_Q09_1", Param, PName, Count = 6);

    //        }
    //        else
    //        {
    //            dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q09_1", Param, PName, Count = 6);
    //        }
    //        if (dt.Rows.Count > 0)
    //        {
    //            if (dt.Columns.Contains("REFMTRREMARKS"))
    //            {
    //                dt.Columns.Remove("REFMTRREMARKS");
    //            }
    //            if (dt.Columns.Contains("REFMTRFLAG"))
    //            {
    //                dt.Columns.Remove("REFMTRFLAG");
    //            }
    //        }
    //        else
    //        {
               
    //        }
    //    }

    //    if (dt.Columns.Contains("SLNO"))
    //    {
    //        dt.Columns.Remove("SLNO");
    //    }

    //    result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);


    //    return result;
    //}
    [WebMethod]
    public static Object GetDataReportkpcl(String cid, String zid, String crid, String did, String sid, String vid, string gname, string gtype, string gsid, string gid)
    {
        object result = null;
        DataTable dt = new DataTable();
        try
        {


            if (cid == "-1")
            {
                if (zid == "0")
                {
                    try
                    {

                        string voltid = vid;
                        Param[0] = voltid;
                        PName[0] = "@Voltid";

                        dt = SqlCmd.SelectDataEntity("SP_MTR_KPCL_Q4", Param, PName, Count = 0);

                    }
                    catch (Exception ex)
                    {

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
                dt = SqlCmd.SelectDataEntity("SP_MTR_KPCL_Q1", Param, PName, Count = 3);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Columns.Contains("REMARKS"))
                    {
                        dt.Columns.Remove("REMARKS");
                    }
                    if (dt.Columns.Contains("ABT/Non-ABT/DLMS"))
                    {
                        dt.Columns.Remove("ABT/Non-ABT/DLMS");
                    }
                    if (dt.Columns.Contains("SLNO"))
                    {
                        dt.Columns.Remove("SLNO");
                    }
                  
                    //grdEntityDtls.DataSource = dt5;
                    //grdEntityDtls.DataBind();
                    //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "showgrid();", true);
                }
                else
                {
                    
                }
            }
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);


            return result;

        }
        catch (Exception ex)
        {

        }
        return null;
    }
    public void zoneBind()
    {
        try
        {
            ddlDivision.ClearSelection();
            txtSubStnName.ClearSelection();
            DataTable dt = new DataTable();
            dt = SqlCmd.SelectDataEntity("SP_MSTIF_013", Param, PName, Count = 0);
            ddlZone.DataSource = dt;
            ddlZone.DataValueField = "ZONEID";
            ddlZone.DataTextField = "ZNAME";
            ddlZone.DataBind();
            ddlZone.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL ZONE--", "0"));
        }
        catch (Exception Ex)
        {

            ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + Ex.Message + "', '', 'error');", true);
            return;
        }
    }
    private void TYPECONSUMERGRID()
    {
        try
        {
            DataTable dt = SqlCmd.SelectDataEntity("SP_MSTIF_08", Param, PName, Count = 0);
            ddlTypeCons.DataSource = dt;
            ddlTypeCons.DataValueField = "CONSUMERID";
            ddlTypeCons.DataTextField = "CONSUMERNAME";
            ddlTypeCons.DataBind();
           // ddlTypeCons.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- ALL --", "-1"));
            ddlTypeCons.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Type of Consumer--", "0"));
        }
        catch (Exception ex)
        {

            ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
        }
    }
    private void BindGenName()
    {
        try
        {
            Count = 0;
            DataTable dt = SqlCmd.SelectDataEntity("SP_KPCLGEN_22", Param, PName, Count);
            if (dt.Rows.Count > 0)
            {
                ddlGenName.DataSource = dt;
                ddlGenName.DataTextField = "MGNAME";
                ddlGenName.DataValueField = "MGID";
                ddlGenName.DataBind();
                ddlGenName.Items.Insert(0, new ListItem("--SELECT GENERATION--", "0"));
            }
        }
        catch (Exception ex)
        {

        }
    }
    private void EHTBIND()
    {
        try
        {
            DataTable dt = SqlCmd.SelectDataEntity("SP_MSTIF_015", Param, PName, Count = 0);
            ddltypeht.DataSource = dt;
            ddltypeht.DataValueField = "slno";
            ddltypeht.DataTextField = "Type";
            ddltypeht.DataBind();
            ddltypeht.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL--", "0"));
        }
        catch
        {

        }
    }
    private void generationbind()
    {
        try
        {
            DataTable dt = SqlCmd.SelectDataEntity("SP_MSTIF_016", Param, PName, Count = 0);
            ddltypegen.DataSource = dt;
            ddltypegen.DataValueField = "GID";
            ddltypegen.DataTextField = "GNAME";
            ddltypegen.DataBind();
            ddltypegen.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL--", "0"));
        }
        catch (Exception ex)
        {

            ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
            // msg.ShowAlertMessage(ex.Message);
        }
    }
    private void bindvoltage()
    {
        DataTable dt = new DataTable();
        if (ddlTypeCons.SelectedValue == "3")
        {
            dt = SqlCmd.SelectDataEntity("SP_IFVOLTAGE", Param, PName, Count = 0);
        }
        else if (ddlTypeCons.SelectedValue == "16")
        {
            dt = SqlCmd.SelectDataEntity("SP_TRANSVOLTAGE", Param, PName, Count = 0);
        }
        else
        {
            dt = SqlCmd.SelectDataEntity("SP_MSTIF_011", Param, PName, Count = 0);
        }
        try
        {

            ddlvoltageclas.DataSource = dt;
            ddlvoltageclas.DataValueField = "ID";
            ddlvoltageclas.DataTextField = "Voltname";
            ddlvoltageclas.DataBind();
            ddlvoltageclas.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL--", "0"));
        }
        catch (Exception ex)
        {

            ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + ex.Message + "', '', 'error');", true);
            //  msg.ShowAlertMessage(ex.Message);
        }
    }
    public void clear()
    {
        ddlZone.ClearSelection();
        ddlCir.ClearSelection();
        ddlDivision.ClearSelection();
        txtSubStnName.ClearSelection();
    }
    protected void ddlTypeCons_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            clear();
            bindvoltage();
            divvolt.Visible = true;
            //CHECK CONSMER TYPE & VISIBLE FALSE OR TRUE
            if (ddlTypeCons.SelectedValue == "3")
            {
                ddlsubstation.Visible = true;
                divsubgen.Visible = false;
                divZone.Visible = true;
                divCir.Visible = true;
                divDivision.Visible = true;
            }
            else if (ddlTypeCons.SelectedValue == "-1")
            {
                ddlsubstation.Visible = true;
                divsubgen.Visible = false;
                divZone.Visible = true;
                divCir.Visible = true;
                divDivision.Visible = true;
            }
            else if (ddlTypeCons.SelectedValue == "7")
            {
                divZone.Visible = false;
                divCir.Visible = false;
                divDivision.Visible = false;
                ddlsubstation.Visible = false;
                divsubgen.Visible = true;
                divvolt.Visible = false;
            }
            else
            {
                ddlsubstation.Visible = false;
                divZone.Visible = true;
                divCir.Visible = true;
                divDivision.Visible = true;
                divsubgen.Visible = false;
            }

            if (ddlTypeCons.SelectedValue == "1")
            {
                DIVTypGen.Visible = true;
                DIVEHT.Visible = false;
            }
            else if (ddlTypeCons.SelectedValue == "2")
            {
                DIVTypGen.Visible = false;
                DIVEHT.Visible = true;
            }
            else
            {
                DIVTypGen.Visible = false;
                DIVEHT.Visible = false;
            }

        }
        catch (Exception Ex)
        {

            ClientScript.RegisterStartupScript(GetType(), "hwa", " swal('" + Ex.Message + "', '', 'error');", true);
            // msg.ShowAlertMessage(Ex.Message);
        }
    }

    protected void ddlZone_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlDivision.Items.Clear();
            bindcir();
        }
        catch
        {
        }
    }
    private void bindcir()
    {
        Param[0] = ddlZone.SelectedValue;
        PName[0] = "@Zoneid";
        Count = 1;
        DataTable dt = SqlCmd.SelectDataEntity("SP_MSTSTATION_09", Param, PName, Count);
        ddlCir.DataSource = dt;
        ddlCir.DataValueField = "CIRCLEID";
        ddlCir.DataTextField = "CNAME";
        ddlCir.DataBind();
        ddlCir.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL CIRCLE--", "0"));
    }
    protected void ddlCir_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            binddiv();
        }
        catch
        {

        }
    }
    private void binddiv()
    {
        ddlDivision.ClearSelection();
        Param[0] = ddlCir.SelectedValue;
        PName[0] = "@CIRCLEID";
        Param[1] = ddlZone.SelectedValue;
        PName[1] = "@ZONEID";
        Count = 2;
        DataTable dt = SqlCmd.SelectDataEntity("SP_MSTSTATION_03", Param, PName, Count);
        ddlDivision.DataSource = dt;
        ddlDivision.DataValueField = "DIVID";
        ddlDivision.DataTextField = "DNAME";
        ddlDivision.DataBind();
        ddlDivision.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL DIVISION--", "0"));
    }

    protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bindsta();
        }
        catch
        {
        }
    }
    private void bindsta()
    {
        Param[0] = ddlCir.SelectedValue;
        PName[0] = "@CIRCLEID";
        Param[1] = ddlZone.SelectedValue;
        PName[1] = "@ZONEID";
        Param[2] = ddlDivision.SelectedValue;
        PName[2] = "@Divisionid";
        Count = 3;
        DataTable dt = SqlCmd.SelectDataEntity("SP_MSTIF_01", Param, PName, Count);
        txtSubStnName.DataSource = dt;
        txtSubStnName.DataValueField = "SUBID";
        txtSubStnName.DataTextField = "SNAME";
        txtSubStnName.DataBind();
        txtSubStnName.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--ALL SUB-STATION--", "0"));
    }
    protected void ddlGenName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
           
            Param[0] = ddlGenName.SelectedValue;
            PName[0] = "@MGID";
            DataTable dt = SqlCmd.SelectDataEntity("SP_KPCL_Q2", Param, PName, Count = 1);
            if (dt.Rows.Count > 0)
            {
                ddlGenType.DataSource = dt;
                ddlGenType.DataTextField = "GNAME";
                ddlGenType.DataValueField = "GID";
                ddlGenType.DataBind();
                ddlGenType.Items.Insert(0, new ListItem("--SELECT GENERATION TYPE--", "0"));
            }
        }
        catch
        {

        }
    }

    protected void ddlGenType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Param[0] = ddlGenName.SelectedValue; Param[1] = ddlGenType.SelectedValue;
            PName[0] = "@MGID"; PName[1] = "@GID";
            DataTable dt = SqlCmd.SelectDataEntity("SP_KPCL_Q3", Param, PName, Count = 2);
            if (dt.Rows.Count > 0)
            {
                ddlSubstation1.DataSource = dt;
                ddlSubstation1.DataTextField = "GENSTN";
                ddlSubstation1.DataValueField = "GSTN_ID";
                ddlSubstation1.DataBind();
                ddlSubstation1.Items.Insert(0, new ListItem("--SELECT SUB-STATION--", "0"));
            }
            else
            {
                ddlSubstation1.DataSource = dt;
                ddlSubstation1.DataBind();
                ddlSubstation1.Items.Insert(0, new ListItem("--SELECT SUB-STATION--", "0"));
            }
        }
        catch (Exception ex)
        {

        }
    }



    [WebMethod]
    public static object GetDataReport(string cid, string zid, string crid, string did, string sid, string vid, string gname, string gtype, string gsid, string gid)
    {
        object result = null;
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();

        try
        {
            if (cid == "-1")
            {
                if (zid == "0")
                {
                    string voltid = vid;
                    Param[0] = voltid;
                    PName[0] = "@Voltid";

                    dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q77_1", Param, PName, Count = 1);
                    dt1 = SqlCmd.SelectDataEntity("SP_MTR_KPCL_Q4_1", Param, PName, Count = 0);

                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Columns.Contains("REFMTRREMARKS")) dt.Columns.Remove("REFMTRREMARKS");
                        if (dt.Columns.Contains("REFMTRFLAG")) dt.Columns.Remove("REFMTRFLAG");
                        if (dt.Columns.Contains("STATION_NAME")) dt.Columns["STATION_NAME"].ColumnName = "STATION";
                        if (dt.Columns.Contains("IFPOINT NAME")) dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                        if (dt.Columns.Contains("METER NO")) dt.Columns["METER NO"].ColumnName = "METER SL NO";
                        if (dt.Columns.Contains("VOLTAGE (kV)")) dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                    }
                }
                else if (crid == "0")
                {
                    Param[0] = zid;
                    PName[0] = "@Zone";
                    dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q78_1", Param, PName, Count = 1);
                }
                else if (did == "0")
                {
                    Param[0] = zid;
                    Param[1] = crid;
                    PName[0] = "@Zone";
                    PName[1] = "@CIRCLE";
                    dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q79_1", Param, PName, Count = 2);
                }
                else if (sid == "0")
                {
                    Param[0] = zid;
                    Param[1] = crid;
                    Param[2] = did;
                    PName[0] = "@Zone";
                    PName[1] = "@CIRCLE";
                    PName[2] = "@Division";
                    dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q80_1", Param, PName, Count = 3);
                }
                else if (sid != "0")
                {
                    Param[0] = zid;
                    Param[1] = crid;
                    Param[2] = did;
                    Param[3] = sid;
                    PName[0] = "@Zone";
                    PName[1] = "@CIRCLE";
                    PName[2] = "@Division";
                    PName[3] = "@SUBSTATION";
                    dt = SqlCmd.SelectDataEntity("SP_MSTMAINMTR_Q81_1", Param, PName, Count = 4);
                }

                if (dt.Rows.Count > 0)
                {
                    if (dt.Columns.Contains("REFMTRREMARKS")) dt.Columns.Remove("REFMTRREMARKS");
                    if (dt.Columns.Contains("REFMTRFLAG")) dt.Columns.Remove("REFMTRFLAG");
                }
            }
            else if (cid == "3")
            {
                string Voltid1 = "";
                string voltid = vid;

                if (voltid == "6") { voltid = "14"; Voltid1 = "16"; }
                if (voltid == "7") { voltid = "15"; Voltid1 = "17"; }

                Param[0] = zid;
                Param[1] = crid;
                Param[2] = did;
                Param[3] = cid;
                Param[4] = sid;
                Param[5] = voltid;
                Param[6] = Voltid1;

                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                PName[3] = "@entityid";
                PName[4] = "@SUBSTAION";
                PName[5] = "@Voltid";
                PName[6] = "@Voltid1";

                dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q06_1", Param, PName, Count = 7);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Columns.Contains("REFMTRREMARKS")) dt.Columns.Remove("REFMTRREMARKS");
                    if (dt.Columns.Contains("REFMTRFLAG")) dt.Columns.Remove("REFMTRFLAG");
                    if (dt.Columns.Contains("STATION_NAME")) dt.Columns["STATION_NAME"].ColumnName = "STATION";
                    if (dt.Columns.Contains("IFPOINT NAME")) dt.Columns["IFPOINT NAME"].ColumnName = "Entity/IF Point ";
                    if (dt.Columns.Contains("METER NO")) dt.Columns["METER NO"].ColumnName = "METER SL NO";
                    if (dt.Columns.Contains("VOLTAGE (kV)")) dt.Columns["VOLTAGE (kV)"].ColumnName = "VOLTAGE CLASS (kV)";
                }
            }
            else if (cid == "7")
            {
                // (no logic given in your code)
            }
            else
            {
                Param[0] = zid;
                Param[1] = crid;
                Param[2] = did;
                Param[3] = cid;
                Param[4] = gid;
                Param[5] = vid;

                PName[0] = "@Zone";
                PName[1] = "@CIRCLE";
                PName[2] = "@Division";
                PName[3] = "@entityid";
                PName[4] = "@genid";
                PName[5] = "@Voltid";

                if (cid == "1")
                {
                    dt = SqlCmd.SelectDataEntity("SP_MSTMTR_gen_Q09_1", Param, PName, Count = 6);
                }
                else
                {
                    dt = SqlCmd.SelectDataEntity("SP_MSTMTR_Q09_1", Param, PName, Count = 6);
                }

                if (dt.Rows.Count > 0)
                {
                    if (dt.Columns.Contains("REFMTRREMARKS")) dt.Columns.Remove("REFMTRREMARKS");
                    if (dt.Columns.Contains("REFMTRFLAG")) dt.Columns.Remove("REFMTRFLAG");
                }
            }

            if (dt.Columns.Contains("SLNO"))
            {
                dt.Columns.Remove("SLNO");
            }

            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt, Formatting.None);
        }
        catch (Exception ex)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(
                new { error = true, message = ex.Message }, Formatting.None
            );
        }

        return result;
    }

}




