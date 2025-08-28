using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class RptLoadSMtrs_kpcl : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[60];
    static string[] PName = new string[60];
    static string RoleId = "", UserId = "";
    static int Count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private static DataTable GetData(string rdbslot, string rdbtype, string ddlType, string ddlmeter, string txtmonth)
    {
        //DateTime from = UtlyCls.ConvertDate(txtmonth.Trim(), "MM-yyyy");
        DateTime from = DateTime.ParseExact(txtmonth.Trim(), "MMM-yyyy", null);
        string fdate = from.ToString("yyyy-MM") + "-01";

        Param[0] = from.ToString("MMyyyy");
        PName[0] = "@DATE";
        string slot = SqlCmd.ExecScalerEntity("SP_GETBLOCK", Param, PName, Count = 1);
        Param[0] = fdate;
        PName[0] = "@DATE";
        int days = Convert.ToInt32(SqlCmd.ExecScalerEntity("sptotal_days", Param, PName, Count = 1));
        //DateTime to = UtlyCls.ConvertDate(fdate.Trim(), "yyyy-MM-dd");
        DateTime to = DateTime.ParseExact(fdate.Trim(), "yyyy-MM-dd", null);
        string Tdate1 = to.ToString("yyyy-MM-") + days;
        Param[0] = fdate;
        PName[0] = "@FROMDATE";
        Param[1] = Tdate1;
        PName[1] = "@TODATE";
        Param[2] = slot;
        PName[2] = "@COUNT";

        DataTable dt = new DataTable();
        if (rdbslot == "load")
        {
            //FOR SLOT
            if (rdbtype == "1")
            {
                //LOADSURVEY
                if (ddlType == "1")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q1", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q1", Param, PName, Count = 3);
                    }
                }
                else if (ddlType == "2")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q2", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q2", Param, PName, Count = 3);
                    }
                }
                else if (ddlType == "3")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q3", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q3", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "4")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q4", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q4", Param, PName, Count = 3);
                    }

                }
            }
            else if (rdbtype == "2")
            {
                //EMAIL
                if (ddlType == "1")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q5", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q5", Param, PName, Count = 3);
                    }
                }
                else if (ddlType == "2")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q6", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q6", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "3")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q7", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q7", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "4")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q8", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q8", Param, PName, Count = 3);
                    }

                }
            }
            else
            {
                //DCU
                if (ddlType == "1")
                {
                    dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q1", Param, PName, Count = 3);
                }
                else if (ddlType == "2")
                {
                    dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q2", Param, PName, Count = 3);


                }
                else if (ddlType == "3")
                {
                    dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q3", Param, PName, Count = 3);


                }
                else if (ddlType == "4")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATA_Q12", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATARPL_Q12", Param, PName, Count = 3);
                    }

                }
            }
        }
        else
        {
            Param[2] = "1";
            PName[2] = "@COUNT";
            //for MID NIGHT
            if (rdbtype == "1")
            {
                //LOADSURVEY
                if (ddlType == "1")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q1", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q1", Param, PName, Count = 3);
                    }
                }
                else if (ddlType == "2")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q2", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q2", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "3")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q3", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q3", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "4")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q4", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q4", Param, PName, Count = 3);
                    }

                }
            }
            else if (rdbtype == "2")
            {
                //EMAIL
                if (ddlType == "1")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q5", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q5", Param, PName, Count = 3);
                    }


                }
                else if (ddlType == "2")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q6", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q6", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "3")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q7", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q7", Param, PName, Count = 3);
                    }

                }
                else if (ddlType == "4")
                {
                    if (ddlmeter == "1")
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMID_Q8", Param, PName, Count = 3);
                    }
                    else
                    {
                        dt = SqlCmd.SelectDataEntity("SP_RAWDATAMIDRPL_Q8", Param, PName, Count = 3);
                    }

                }
            }
            else
            {
                //DCU
                if (ddlType == "1")
                {
                    dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q9", Param, PName, Count = 3);



                }
                else if (ddlType == "2")
                {
                    dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q16", Param, PName, Count = 3);


                }
                else if (ddlType == "3")
                {
                    dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q17", Param, PName, Count = 3);
                }

            }
        }

        return dt;
    }


    [WebMethod]
    public static Object ViewData(string rdbslot, string rdbtype, string ddlType, string ddlmeter, string txtmonth)
    {
        object result = null;
        try
        {
            DataTable dt = GetData(rdbslot, rdbtype, ddlType, ddlmeter, txtmonth);
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
    public static Object RecivedPop(string ddlType, string rdbslot, string txtmonth, string compid1,
        string zid1, string cir1, string did1)
    {

        string month = txtmonth;
        DateTime from = DateTime.ParseExact(txtmonth.Trim(), "MMM-yyyy", null);
        //DateTime from = UtlyCls.ConvertDate(txtmonth.Trim(), "MM-yyyy");
        Param[0] = from.ToString("MMyyyy");
        PName[0] = "@DATE";
        string slot = SqlCmd.ExecScalerEntity("SP_GETBLOCK", Param, PName, Count = 1);
        Param[0] = from.ToString("yyyy-MM") + "-01";
        PName[0] = "@DATE";

        int days = Convert.ToInt32(SqlCmd.ExecScalerEntity("sptotal_days", Param, PName, Count = 1));
        string fdate = from.ToString("yyyy-MM") + "-01";
        string tdate = from.ToString("yyyy-MM") + "-" + days;

        Param[0] = slot;
        Param[1] = ddlType;
        Param[2] = fdate;
        Param[3] = tdate;
        Param[4] = compid1;
        Param[5] = zid1;
        Param[6] = cir1;
        Param[7] = did1;

        PName[0] = "@COUNT";
        PName[1] = "@FLAG";
        PName[2] = "@FROMDATE";
        PName[3] = "@TODATE";
        PName[4] = "@compid";
        PName[5] = "@zoneid";
        PName[6] = "@cirid";
        PName[7] = "@divid";
        DataTable dt = new DataTable();
        if (rdbslot == "load")
        {
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q7", Param, PName, Count = 8);
        }
        else
        {
            Param[0] = "1";
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q12", Param, PName, Count = 8);
        }

        object result = null;
        try
        {
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

    public static Object partialPop(string ddlType, string rdbslot, string txtmonth, string compid1,
        string zid1, string cir1, string did1)
    {

        string month = txtmonth;
        DateTime from = DateTime.ParseExact(txtmonth.Trim(), "MMM-yyyy", null);

        Param[0] = from.ToString("MMyyyy");
        PName[0] = "@DATE";
        string slot = SqlCmd.ExecScalerEntity("SP_GETBLOCK", Param, PName, Count = 1);
        Param[0] = from.ToString("yyyy-MM") + "-01";
        PName[0] = "@DATE";

        int days = Convert.ToInt32(SqlCmd.ExecScalerEntity("sptotal_days", Param, PName, Count = 1));
        string fdate = from.ToString("yyyy-MM") + "-01";
        string tdate = from.ToString("yyyy-MM") + "-" + days;
        string MNO = "";

        Param[0] = slot;
        Param[1] = ddlType;
        Param[2] = fdate;
        Param[3] = tdate;
        Param[4] = compid1;
        Param[5] = zid1;
        Param[6] = cir1;
        Param[7] = did1;

        PName[0] = "@COUNT";
        PName[1] = "@FLAG";
        PName[2] = "@FROMDATE";
        PName[3] = "@TODATE";
        PName[4] = "@compid";
        PName[5] = "@zoneid";
        PName[6] = "@cirid";
        PName[7] = "@divid";
        DataTable dt = new DataTable();
        if (rdbslot == "load")
        {
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q5", Param, PName, Count = 8);
        }
        else
        {
            Param[0] = "1";
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q13", Param, PName, Count = 8);
        }

        object result = null;
        try
        {
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

    public static Object notreceivedPop(string ddlType, string rdbslot, string txtmonth, string compid1,
        string zid1, string cir1, string did1)
    {
        string month = txtmonth;
        DateTime from = DateTime.ParseExact(txtmonth.Trim(), "MMM-yyyy", null);

        Param[0] = from.ToString("MMyyyy");
        PName[0] = "@DATE";
        string slot = SqlCmd.ExecScalerEntity("SP_GETBLOCK", Param, PName, Count = 1);
        Param[0] = from.ToString("yyyy-MM") + "-01";
        PName[0] = "@DATE";

        int days = Convert.ToInt32(SqlCmd.ExecScalerEntity("sptotal_days", Param, PName, Count = 1));
        string fdate = from.ToString("yyyy-MM") + "-01";
        string tdate = from.ToString("yyyy-MM") + "-" + days;

        Param[0] = slot;
        Param[1] = ddlType;
        Param[2] = fdate;
        Param[3] = tdate;
        Param[4] = compid1;
        Param[5] = zid1;
        Param[6] = cir1;
        Param[7] = did1;

        PName[0] = "@COUNT";
        PName[1] = "@FLAG";
        PName[2] = "@FROMDATE";
        PName[3] = "@TODATE";
        PName[4] = "@compid";
        PName[5] = "@zoneid";
        PName[6] = "@cirid";
        PName[7] = "@divid";
        DataTable dt = new DataTable();
        if (rdbslot == "load")
        {
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q6", Param, PName, Count = 8);
        }
        else
        {
            Param[0] = "1";
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q14", Param, PName, Count = 8);
        }
        object result = null;
        try
        {
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

    public static Object meternum_POP( string rdbslot, string txtmonth ,string meter)
    {
    
        DateTime from = DateTime.Now;
        try
        {
            string month = txtmonth;
            //from = UtlyCls.ConvertDate(txtmonth.Text.Trim(), "MM-yyyy");
             from = DateTime.ParseExact(txtmonth.Trim(), "MMM-yyyy", null);

        }
        catch
        {
            string month = txtmonth;
            //from = UtlyCls.ConvertDate(txtmonth.Text.Trim(), "MM-yyyy");
            from = DateTime.ParseExact(txtmonth.Trim(), "MMM-yyyy", null);

        }
        Param[0] = from.ToString("MMyyyy");
        PName[0] = "@DATE";
        string slot = SqlCmd.ExecScalerEntity("SP_GETBLOCK", Param, PName, Count = 1);
        Param[0] = from.ToString("yyyy-MM") + "-01";
        PName[0] = "@DATE";
        int days = Convert.ToInt32(SqlCmd.ExecScalerEntity("sptotal_days", Param, PName, Count = 1));
        string fdate = from.ToString("yyyy-MM") + "-01";
        string tdate = from.ToString("yyyy-MM") + "-" + days;
        string MNO = "";

        Param[0] = meter;

        Param[1] = fdate;
        Param[2] = tdate;


        PName[0] = "@MTR_NO";
        PName[1] = "@FROMDATE";
        PName[2] = "@TODATE";

        DataTable dt = new DataTable();

        if (rdbslot == "load")
        {
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q8", Param, PName, Count = 3);
        }
        else
        {
            dt = SqlCmd.SelectDataEntity("SP_RAWDATA_KPCL_Q15", Param, PName, Count = 3);
        }


        object result = null;
        try
        {
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

}
