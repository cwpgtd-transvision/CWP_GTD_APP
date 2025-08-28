using Microsoft.Office.Interop.Excel;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.ServiceModel.Activities;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTable = System.Data.DataTable;

public partial class EntitalmentReport : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[100];
    static string[] PName = new string[100];
    alertmsg msg = new alertmsg();
    static int Count = 0;
    //static string Baseurl = "http://localhost:5156/api/";
    static string Baseurl = "https://gtdapi6s5f30gvf53l.kasamast.in/api/Samast/";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Buyer> BindBuyer()
    {
        Param = new string[100];
        PName = new string[100];
        List<Buyer> Buyers = new List<Buyer>();
        try
        {
            //string apiUrl = Baseurl + "Declaration?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_DECLARATION_SELLERBIND_Q1&SP_Param=" + date + "&SP_PName=@SchDate&PCount=1&Password=Tvd1234!";
            string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=Sp_GetBuyer_Q1&parameters={}&apiKey=123";

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
            request.Method = "GET";
            request.ContentType = "application/json";

            string result = "";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    result = reader.ReadToEnd();
                }
            }

            if (!string.IsNullOrEmpty(result))
            {
                // Parse as array
                JArray jsonArray = JArray.Parse(result);

                Buyers = jsonArray
                    .Select(x => new Buyer
                    {
                        BuyerId = x["ESCOM_ID"].ToString(),
                        BuyerName = x["ESCOM_NAME"].ToString()
                    }).ToList();
            }
        }
        catch (WebException ex)
        {
        }
        return Buyers;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Seller> BindSeller(string date)
    {
        Param = new string[100];
        PName = new string[100];
        List<Seller> sellers = new List<Seller>();
        try
        {
            DateTime date1 = DateTime.Now;
            if (date == null || date == "")
            {
                date1 = DateTime.Now; ;
            }
            else
            {
                date1 = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            }
            date = date1.ToString("yyyy-MM-dd");

            //string apiUrl = Baseurl + "Declaration?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_DECLARATION_SELLERBIND_Q1&SP_Param=" + date + "&SP_PName=@SchDate&PCount=1&Password=Tvd1234!";
            string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=SP_Entitalment_SellerBind_Q1&parameters={SchDate:'" + date + "'}&apiKey=123";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
            request.Method = "GET";
            request.ContentType = "application/json";

            string result = "";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    result = reader.ReadToEnd();
                }
            }
            if (!string.IsNullOrEmpty(result))
            {
                // Parse as array
                JArray jsonArray = JArray.Parse(result);

                sellers = jsonArray
                    .Select(x => new Seller
                    {
                        GenId = x["GenId"].ToString(),
                        GenName = x["GenName"].ToString()
                    }).ToList();

            }

        }
        catch (WebException ex)
        {
        }
        return sellers;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SellerUnit> BindSellerUnits(int Genid)
    {
        Param = new string[100];
        PName = new string[100];
        List<SellerUnit> SellerUnits = new List<SellerUnit>();
        try
        {
            //string apiUrl = Baseurl + "Entitalment/SellerUnitBind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_Entitalment_SellerUnitBind_Q1&SP_Param=" + Genid + "&SP_PName=@GenId&PCount=1&Password=Tvd1234!";
            string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=SP_Entitalment_SellerUnitBind_Q1&parameters={GenId:'" + Genid + "'}&apiKey=123";

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
            request.Method = "GET";
            request.ContentType = "application/json";
            string result = "";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    result = reader.ReadToEnd();
                }
            }
            if (!string.IsNullOrEmpty(result))
            {
                // Parse as array
                JArray jsonArray = JArray.Parse(result);

                SellerUnits = jsonArray
                    .Select(x => new SellerUnit
                    {
                        unitId = x["UnitId"].ToString(),
                        unitName = x["UnitName"].ToString()
                    }).ToList();

            }

        }
        catch (WebException ex)
        {
        }
        return SellerUnits;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Revision> BindRevisions(string date, int Genid)
    {
        Param = new string[100];
        PName = new string[100];
        DateTime date1 = DateTime.Now;
        if (date == null || date == "")
        {
            date1 = DateTime.Now; ;
        }
        else
        {
            date1 = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        }
        date = date1.ToString("yyyy-MM-dd");
        //string apiUrl = Baseurl + "Entitalment/RevisionsBind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_Entitalment_RevisionBind_Q1&SP_Param=" + date + "," + Genid + "&SP_PName=@SchDate,@GenId&PCount=2&Password=Tvd1234!";
        string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=SP_Entitalment_RevisionBind_Q1&parameters={SchDate:'" + date + "',GenId:'" + Genid + "'}&apiKey=123";
        //string apiUrl = Baseurl + "Entitalment/RevisionsBind?SP_Name=SP_Entitalment_RevisionBind_Q1&SP_Param=" + date + "," + Genid + "&SP_PName=@SchDate,@GenId&PCount=2";
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
        request.Method = "GET";
        request.ContentType = "application/json";
        string result = "";

        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        {
            using (StreamReader reader = new StreamReader(response.GetResponseStream()))
            {
                result = reader.ReadToEnd();
            }
        }
        List<Revision> Revisions = new List<Revision>();
        if (!string.IsNullOrEmpty(result))
        {
            // Parse as array
            JArray jsonArray = JArray.Parse(result);

            Revisions = jsonArray
                .Select(x => new Revision
                {
                    Revisions = x["Revision"].ToString()
                }).ToList();

        }
        return Revisions;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object BindData(string date, int Buyerid, int Genid, int GenUnitid, int Revision, string OnbarOffbarBool, string View_Type)
    {
        object[][] obj = new object[300][];
        DataTable finaldt = new DataTable();

        finaldt = BindDataTable(date, Buyerid, Genid, GenUnitid, Revision, OnbarOffbarBool, View_Type);
        // Convert DataTable to object[][]
        obj = finaldt.AsEnumerable().Select(r => r.ItemArray).ToArray();
        obj = new[] { finaldt.Columns.Cast<DataColumn>().Select(c => (object)c.ColumnName).ToArray() }.Concat(finaldt.AsEnumerable().Select(r => r.ItemArray)).ToArray();
        HttpContext.Current.Session["ExportDt"] = finaldt;
        return obj;
    }
    public static DataTable BindDataTable(string date, int Buyerid, int Genid, int GenUnitid, int Revision, string OnbarOffbarBool, string View_Type)
    {
        object[][] obj = new object[300][];
        DataTable finaldt = new DataTable();
        Param = new string[100];
        PName = new string[100];
        DateTime date1 = DateTime.Now;
        if (date == null || date == "")
        {
            date1 = DateTime.Now; ;
        }
        else
        {
            date1 = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        }
        date = date1.ToString("yyyy-MM-dd");
        //string ParamNames = date + "," + Genid + "," + GenUnitid + "," + Buyerid + "," + Revision + "," + OnbarOffbarBool;
        //string SP_PNameName = "@SchDate,@Genid,@UnitId,@Buyerid,@Revision,@OnbarOffbarBool";
        //string ParametersData = "SchDate:'" + date + "',Genid:'" + Genid + "',UnitId:'" + GenUnitid + "',Buyerid:'" + Buyerid + "',Revision:'" + Revision + "',OnbarOffbarBool:'" + OnbarOffbarBool;
        string parameters = "{SchDate:'" + date +
                     "',Genid:'" + Genid +
                     "',UnitId:'" + GenUnitid +
                     "',Buyerid:'" + Buyerid +
                     "',Revision:'" + Revision +
                     "',OnbarOffbarBool:'" + OnbarOffbarBool + "'}";
        string apiUrl = "";
        if (View_Type == "sellerview")
        {
            // string apiUrl = Baseurl + "Entitalment/RevisionsBind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_Entitalment_RevisionBind_Q1&SP_Param=2025-08-09,1&SP_PName=@SchDate,@GenId&PCount=2&Password=Tvd1234!";
            //apiUrl = Baseurl + "Entitalment/SellerDataBind?SP_Name=Sp_Entitalment_SellerView_q1&SP_Param=" + ParamNames + "&SP_PName=" + SP_PNameName + "&PCount=6";
            apiUrl = Baseurl
               + "ExecuteStoredProcedure?serverName=DB1"
               + "&dbName=DBOSAMAST_SCHEDULING"
               + "&procedureName=Sp_Entitalment_SellerView_q1"
               + "&parameters=" + Uri.EscapeDataString(parameters)   // ✅ encoding here
               + "&apiKey=123";
        }
        else if (View_Type == "buyerview")
        {
            // string apiUrl = Baseurl + "Entitalment/RevisionsBind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_Entitalment_RevisionBind_Q1&SP_Param=2025-08-09,1&SP_PName=@SchDate,@GenId&PCount=2&Password=Tvd1234!";
            //apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=Sp_Entitalment_buyerView_q1&parameters={'"+ParametersData+"'}&apiKey=123";
            apiUrl = Baseurl
       + "ExecuteStoredProcedure?serverName=DB1"
       + "&dbName=DBOSAMAST_SCHEDULING"
       + "&procedureName=Sp_Entitalment_buyerView_q1"
       + "&parameters=" + Uri.EscapeDataString(parameters)   // ✅ encoding here
       + "&apiKey=123";
        }
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
        request.Method = "GET";
        request.ContentType = "application/json";
        string result = "";
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        {
            using (StreamReader reader = new StreamReader(response.GetResponseStream()))
            {
                result = reader.ReadToEnd();
            }
        }

        //var jsonObject = JObject.Parse(result);
        // Parse the full JSON
        if (!string.IsNullOrEmpty(result))
        {
            JArray jsonArray = JArray.Parse(result);

            finaldt = JsonConvert.DeserializeObject<DataTable>(jsonArray.ToString());

            if (finaldt.Columns.Contains("SortOrder"))
            {
                finaldt.Columns.Remove("SortOrder");
            }
            if (finaldt.Columns.Contains("SortBlock"))
            {
                finaldt.Columns.Remove("SortBlock");
            }
        }
        return finaldt;
    }
    public class Seller
    {
        public string GenId { get; set; }
        public string GenName { get; set; }
    }
    public class SellerUnit
    {
        public string unitId { get; set; }
        public string unitName { get; set; }
    }
    public class Buyer
    {
        public string BuyerId { get; set; }
        public string BuyerName { get; set; }
    }
    public class Revision
    {
        public string Revisions { get; set; }
    }
}