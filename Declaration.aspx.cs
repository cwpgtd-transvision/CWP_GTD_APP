using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.ServiceModel.Activities;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Declaration : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[40];
    static string[] PName = new string[40];
    alertmsg msg = new alertmsg();
    static int Count = 0;
    //static string Baseurl = "http://localhost:5156/api/";
    //static string Baseurl = "https://gtdapi6s5f30gvf53l.kasamast.in/api/";
    static string Baseurl = "https://gtdapi6s5f30gvf53l.kasamast.in/api/Samast/";
    protected void Page_Load(object sender, EventArgs e)
    {
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
            //string apiUrl = Baseurl + "Entitalment/Sellers?SP_Name=SP_DECLARATION_SELLERBIND_Q1&SP_Param=" + date + "&SP_PName=@SchDate&PCount=1";
            string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=SP_DECLARATION_SELLERBIND_Q1&parameters={SchDate:'"+ date + "'}&apiKey=123";
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
                var jsonArray = JArray.Parse(result);
                //var jsonObject = JObject.Parse(result);

                // Convert the "SellerBind" array into a List<getdata1>
                //sellers = jsonObject["SellerBind"]
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
    //[System.Web.Services.WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<seller> BindSeller(string date)
    //{
    //    Param = new string[40];
    //    PName = new string[40];

    //    DateTime date1 = DateTime.Now;
    //    if (date == null || date == "")
    //    {
    //        date1 = DateTime.Now; ;
    //    }
    //    else
    //    {
    //        date1 = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
    //    }
    //    date = date1.ToString("yyyy-MM-dd");
    //    string apiUrl = Baseurl + "Declaration/Seller_Bind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_DECLARATION_SELLERBIND_Q1&SP_Param=" + date + "&SP_PName=@SchDate&PCount=1&Password=Tvd1234!";

    //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
    //    request.Method = "GET";
    //    request.ContentType = "application/json";

    //    string result = "";
    //    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
    //    {
    //        using (StreamReader reader = new StreamReader(response.GetResponseStream()))
    //        {
    //            result = reader.ReadToEnd();
    //        }
    //    }
    //    List<seller> seller = new List<seller>();
    //    if (!string.IsNullOrEmpty(result))
    //    {
    //        var jsonObject = JObject.Parse(result);
    //        seller = jsonObject["SellerBind"]
    //           .Select(x => new seller
    //           {
    //               GId = x["GenId"].ToString(),
    //               GenName = x["GenName"].ToString()
    //           })
    //           .ToList();
    //    }
    //    return seller;
    //}
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
            //string apiUrl = Baseurl + "Entitalment/SellerUnitBind?SP_Name=SP_DECLARATION_SELLER_UNIT_BIND_Q1&SP_Param=" + Genid + "&SP_PName=@GenId&PCount=1";
            string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=SP_DECLARATION_SELLER_UNIT_BIND_Q1&parameters={GenId:'"+ Genid + "'}&apiKey=123";

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
                //var jsonObject = JObject.Parse(result);
                // Convert the "SellerUnit" array into a List<getdata1>
                var jsonArray = JArray.Parse(result);
                //SellerUnits = jsonObject["SellerunitBind"]
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
    //[System.Web.Services.WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<sellerUnit_bind> BindSellerUnits(String seller)
    //{
    //    string apiUrl = Baseurl + "Declaration/Seller_UnitBind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_DECLARATION_SELLER_UNIT_BIND_Q1&SP_Param=" + seller + "&SP_PName=@GId&PCount=1&Password=Tvd1234!";

    //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
    //    request.Method = "GET";
    //    request.ContentType = "application/json";

    //    string result = "";
    //    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
    //    {
    //        using (StreamReader reader = new StreamReader(response.GetResponseStream()))
    //        {
    //            result = reader.ReadToEnd();
    //        }
    //    }
    //    List<sellerUnit_bind> sellerUnit = new List<sellerUnit_bind>();
    //    if (!string.IsNullOrEmpty(result))
    //    {
    //        var jsonObject = JObject.Parse(result);
    //        sellerUnit = jsonObject["SellerunitBind"]
    //        .Select(x => new sellerUnit_bind
    //        {
    //            Units = x["UnitName"].ToString(),
    //            UnitId = x["UnitId"].ToString()
    //        })
    //        .ToList();
    //    }
    //    return sellerUnit;
    //}
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
        //string apiUrl = Baseurl + "Entitalment/RevisionsBind?SP_Name=SP_DECLARATION_REVISION_BIND_Q1&SP_Param=" + date + "," + Genid + "&SP_PName=@SchDate,@GenId&PCount=2";
        string apiUrl = Baseurl + "ExecuteStoredProcedure?serverName=DB1&dbName=DBOSAMAST_SCHEDULING&procedureName=SP_DECLARATION_REVISION_BIND_Q1&parameters={SchDate:'"+ date + "',GenId:'"+ Genid + "'}&apiKey=123";
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
            //var jsonObject = JObject.Parse(result);
            var jsonArray = JArray.Parse(result);
            Revisions = jsonArray
                .Select(x => new Revision
                {
                    Revisions = x["Revision"].ToString()
                }).ToList();
        }
        return Revisions;
    }
    //[System.Web.Services.WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<Revision> BindRevisions(String date, int Genid)
    //{
    //    DateTime date1 = DateTime.Now;
    //    if (date == null || date == "" || date == "1")
    //    {
    //        date1 = DateTime.Now;
    //    }
    //    else
    //    {
    //        date1 = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
    //    }
    //    date = date1.ToString("yyyy-MM-dd");

    //    string apiUrl = Baseurl + "Declaration/BindRevisions?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_DECLARATION_REVISION_BIND_Q1&SP_Param=" + date + "," + Genid + "&SP_PName=@SchDate,@GenId&PCount=2&Password=Tvd1234!";
    //           //apiUrl = Baseurl + "Entitalment/SellerDataBind?SP_Name=Sp_Entitalment_SellerView_q1&SP_Param=" + ParamNames + "&SP_PName=" + SP_PNameName + "&PCount=6";

    //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
    //    request.Method = "GET";
    //    request.ContentType = "application/json";

    //    string result = "";
    //    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
    //    {
    //        using (StreamReader reader = new StreamReader(response.GetResponseStream()))
    //        {
    //            result = reader.ReadToEnd();
    //        }
    //    }
    //    List<Revision> Revision = new List<Revision>();
    //    if (!string.IsNullOrEmpty(result))
    //    {
    //        var jsonObject = JObject.Parse(result);
    //        Revision = jsonObject["RevisionBind"]
    //       .Select(x => new Revision
    //       {
    //           Revisions = x["Revision"].ToString(),
    //       })
    //       .ToList();
    //    }
    //    return Revision;
    //}

    [System.Web.Services.WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Object BindData(string date, int Genid, int GenUnitid, int Revision, String OnbarOffbarBool)
    {
        object[][] obj = new object[300][];
        DataTable finaldt = new DataTable();
        finaldt = BindDataTable(date, Genid, GenUnitid, Revision, OnbarOffbarBool);
        // Convert DataTable to object[][]
        obj = finaldt.AsEnumerable().Select(r => r.ItemArray).ToArray();
        obj = new[] { finaldt.Columns.Cast<DataColumn>().Select(c => (object)c.ColumnName).ToArray() }.Concat(finaldt.AsEnumerable().Select(r => r.ItemArray)).ToArray();
        HttpContext.Current.Session["ExportDt"] = finaldt;
        return obj;
        
        
    }

    public static DataTable BindDataTable(string date, int Genid, int GenUnitid, int Revision, string OnbarOffbarBool)
    {
        DataTable finaldt = new DataTable();
        DataTable dt = new DataTable();

        DateTime date1 = DateTime.Now;
        if (date == null || date == "")
        {
            date1 = DateTime.Now; ;
        }
        else
        {
            date1 = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        }
        // date = date1.AddDays(-2).ToString("yyyy-MM-dd");
        date = date1.ToString("yyyy-MM-dd");

        //string ParamNames = date + "," + Genid + "," + GenUnitid + "," + Revision + "," + OnbarOffbarBool;
        //string SP_PNameName = "@SchDate,@Genid,@UnitId,@Revision,@OnbarOffbarBool";

        string parameters = "{SchDate:'" + date +
             "',Genid:'" + Genid +
             "',UnitId:'" + GenUnitid +
             "',Revision:'" + Revision +
             "',OnbarOffbarBool:'" + OnbarOffbarBool + "'}";


        //string apiUrl = Baseurl + "Declaration/Seller_ALLBind?DBName=DBOSAMAST_SCHEDULING&DBServer=1&SP_Name=SP_DECLARATION_DATA_BIND_Q1 " +
        //"  &SP_Param=" + ParamNames + "&SP_PName= " + SP_PNameName + "&PCount=5&Password=Tvd1234!";
        //string apiUrl = Baseurl + "Declaration/SellerDataBind?SP_Name=SP_DECLARATION_DataView_Q1&SP_Param=" + ParamNames + "&SP_PName= " + SP_PNameName + "&PCount=5&Password=Tvd1234!";
        string apiUrl = Baseurl
       + "ExecuteStoredProcedure?serverName=DB1"
       + "&dbName=DBOSAMAST_SCHEDULING"
       + "&procedureName=SP_DECLARATION_DataView_Q1"
       + "&parameters=" + Uri.EscapeDataString(parameters)   
       + "&apiKey=123";

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
            //var jsonObject = JObject.Parse(result);
            var jsonArray = JArray.Parse(result);
            // Extract the "JsonData" array
            //var jsonDataArray = jsonObject["JsonData"].ToString();
            // Deserialize that array into a DataTable
            finaldt = JsonConvert.DeserializeObject<DataTable>(jsonArray.ToString());
            finaldt.Columns.Remove("SortOrder");
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
    public class Revision
    {
        public string Revisions { get; set; }
    }

}