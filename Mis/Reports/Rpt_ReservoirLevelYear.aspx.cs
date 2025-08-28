using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Office.Interop.Excel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using DataTable = System.Data.DataTable;
public partial class ReservoirLevelYear : System.Web.UI.Page 
{
    static string DbserverSchAndLoad = "DB2", DbNameSch = "MIS", key = "123", msg = "", login_user = "";
    static SqlCmd SqlCmds = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] == null)
        {
            Response.Redirect("/templates/login/LoginMain.aspx");
        }
        if (!IsPostBack)
        {

        }
    }
    [WebMethod]
    public static string GetReservoirData(string selectedDate, string selectedDate1)
    {
        try
        {
            // Convert dd-MM-yyyy → yyyy-MM-dd
            DateTime fromDate = DateTime.ParseExact(selectedDate, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            DateTime toDate = DateTime.ParseExact(selectedDate1, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            string[] paramName = { "@FromDate", "@ToDate" };
            string[] param = { fromDate.ToString("yyyy-MM-dd"), toDate.ToString("yyyy-MM-dd") };
            string encodedParams = string.Join(",", param.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", paramName.Select(HttpUtility.UrlEncode));
            // Fixed Count parameter (just pass 2)

            string parameters = "{FromDate:'" + fromDate.ToString("yyyy-MM-dd") +
           "',ToDate:'" + toDate.ToString("yyyy-MM-dd")
          + "'}";

            DataTable dtData = SqlCmds.GetDT("sp_GetReservoirReport", encodedParams, encodedPNames, 2, DbNameSch, key, DbserverSchAndLoad, parameters);
            if (dtData == null || dtData.Rows.Count == 0)
            {
                // return JSON with message for popup
                return JsonConvert.SerializeObject(new { message = "No data found for the selected date range." });
            }


            var rows = new List<Dictionary<string, object>>();

            // Take distinct dates in order
            var distinctDates = dtData.AsEnumerable()
                                      .Select(r => r.Field<DateTime>("PresentYearDate").Date)
                                      .Distinct()
                                      .OrderBy(d => d);

            foreach (var date in distinctDates)
            {
                var col = new Dictionary<string, object>();
                col.Add("Date", date.ToString("dd-MM-yyyy"));

            

                // Get data for this date only
                var dayRows = dtData.AsEnumerable()
                                    .Where(r => r.Field<DateTime>("PresentYearDate").Date == date)
                                    .ToList();

                int count = 0;
                foreach (var dr in dayRows)
                {
                    count++;
                    if (count == 1)
                    {
                        col["L_CUR_Level"] = dr["PresentYearLevel"];
                        col["L_CUR_Cap"] = dr["PresentYearPercentCap"];
                        col["L_CUR_Inflow"] = dr["PresentYearInflow"];

                        col["L_CUR_Level1"] = dr["PrevYearLevel"];
                        col["L_CUR_Cap1"] = dr["PrevYearPercentCap"];
                        col["L_CUR_Inflow1"] = dr["PrevYearInflow"];
                    }
                    else if (count == 2)
                    {
                        col["MANI_CUR_Level"] = dr["PresentYearLevel"];
                        col["MANI_CUR_Cap"] = dr["PresentYearPercentCap"];
                        col["MANI_CUR_Inflow"] = dr["PresentYearInflow"];

                        col["MANI_Level1"] = dr["PrevYearLevel"];
                        col["MANI_Cap1"] = dr["PrevYearPercentCap"];
                        col["MANI_Inflow1"] = dr["PrevYearInflow"];
                    }
                    else if (count == 3)
                    {
                        col["S_CUR_Level"] = dr["PresentYearLevel"];
                        col["S_CUR_Cap"] = dr["PresentYearPercentCap"];
                        col["S_CUR_Inflow"] = dr["PresentYearInflow"];

                        col["SUPA_Level1"] = dr["PrevYearLevel"];
                        col["SUPA_Cap1"] = dr["PrevYearPercentCap"];
                        col["SUPA_Inflow1"] = dr["PrevYearInflow"];
                    }
                }

                rows.Add(col);
            }

            return JsonConvert.SerializeObject(rows);
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
    }
    [System.Web.Services.WebMethod(EnableSession = true)]

    public static string[] GenerateReservoirExcel(string fromDateStr, string toDateStr)
    {
        string[] result = new string[2]; // [0]=base64, [1]=filename
        Application xlApp = null;
        Workbook xlWorkBook = null;
        Worksheet xlWorkSheet = null;
        object misValue = System.Reflection.Missing.Value;
        bool foundPID;
        int ourPID = 0;
        int tmpX = 0;
        int[] existingPIDs = new int[1000];

        // Track already running Excel processes
        Process[] existingExcels = Process.GetProcessesByName("excel");
        foreach (Process proc in existingExcels)
        {
            existingPIDs[tmpX++] = proc.Id;
        }

        try
        {
            // Parse dates
            DateTime fromDate = DateTime.ParseExact(fromDateStr, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            DateTime toDate = DateTime.ParseExact(toDateStr, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            string[] spParam = { fromDate.ToString("yyyy-MM-dd"), toDate.ToString("yyyy-MM-dd") };
            string[] spPName = { "@FromDate", "@ToDate" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
            string parameters = "{FromDate:'" + fromDate.ToString("yyyy-MM-dd") +
          "',ToDate:'" + toDate.ToString("yyyy-MM-dd")
         + "'}";
            // Get data from DB
            DataTable dt = SqlCmds.GetDT("sp_GetReservoirReport", encodedParams, encodedPNames, 2, DbNameSch, key, DbserverSchAndLoad, parameters);
            if (dt == null || dt.Rows.Count == 0)
            {
                return new string[] { "dataNotFound", "" };
            }

            // Start Excel
            xlApp = new Application();
            xlApp.DisplayAlerts = false;
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Worksheet)xlWorkBook.Sheets[1];
            xlWorkSheet.Name = "Reservoir Data";

            // ===== Headers =====
            for (int col = 0; col < dt.Columns.Count; col++)
            {
                xlWorkSheet.Cells[1, col + 1] = dt.Columns[col].ColumnName;
                Range headerCell = (Range)xlWorkSheet.Cells[1, col + 1];
                headerCell.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                headerCell.VerticalAlignment = XlVAlign.xlVAlignCenter;
                headerCell.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightSteelBlue);
                headerCell.Font.Bold = true;
            }

            // ===== Data =====
            int rowIndex = 2;
            foreach (DataRow dr in dt.Rows)
            {
                for (int col = 0; col < dt.Columns.Count; col++)
                {
                    xlWorkSheet.Cells[rowIndex, col + 1] = dr[col].ToString();
                }
                rowIndex++;
            }

            // Borders & auto fit
            xlWorkSheet.Range[
                xlWorkSheet.Cells[1, 1],
                xlWorkSheet.Cells[dt.Rows.Count + 1, dt.Columns.Count]
            ].Borders.LineStyle = XlLineStyle.xlContinuous;
            xlWorkSheet.Columns.AutoFit();

            // ===== Save to both locations =====
            string datetime = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");
            string fileName = "ReservoirData-" + datetime + ".xlsx";

            string localDir = @"D:\DOWNLOADED RESERVOIR";
            if (!Directory.Exists(localDir))
                Directory.CreateDirectory(localDir);

            string webDir = HostingEnvironment.MapPath("~/Files/");
            if (!Directory.Exists(webDir))
                Directory.CreateDirectory(webDir);

            string drivePath = Path.Combine(localDir, fileName);
            string webPath = Path.Combine(webDir, fileName);

            xlWorkBook.SaveAs(drivePath, XlFileFormat.xlOpenXMLWorkbook);
            xlWorkBook.SaveAs(webPath, XlFileFormat.xlOpenXMLWorkbook);

            xlWorkBook.Close(false);
            xlApp.Quit();

            // Read for Base64
            byte[] bytes = File.ReadAllBytes(webPath);
            result[0] = Convert.ToBase64String(bytes);
            result[1] = fileName;

            // Delete temp files
            if (File.Exists(webPath)) File.Delete(webPath);
            if (File.Exists(drivePath)) File.Delete(drivePath);

            // Close new Excel process
            existingExcels = Process.GetProcessesByName("excel");
            foreach (Process proc in existingExcels)
            {
                foundPID = false;
                foreach (int p in existingPIDs)
                {
                    if (p == proc.Id) { foundPID = true; break; }
                }
                if (!foundPID) { ourPID = proc.Id; break; }
            }

            if (tmpX == 0)
            {
                foreach (Process proc in Process.GetProcessesByName("excel"))
                    proc.Kill();
            }
            else if (ourPID != 0)
            {
                foreach (Process proc in Process.GetProcessesByName("excel"))
                {
                    if (proc.Id == ourPID) { proc.Kill(); break; }
                }
            }

            return result;
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
        finally
        {
            // Release COM
            try { if (xlWorkSheet != null) Marshal.ReleaseComObject(xlWorkSheet); } catch { }
            try { if (xlWorkBook != null) Marshal.ReleaseComObject(xlWorkBook); } catch { }
            try { if (xlApp != null) Marshal.ReleaseComObject(xlApp); } catch { }
            xlWorkSheet = null;
            xlWorkBook = null;
            xlApp = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }
    [WebMethod]
    public static string[] GenerateReservoirPDF(string fromDate, string toDate)
    {
        try
        {
            DateTime fromDt = DateTime.ParseExact(fromDate, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            DateTime toDt = DateTime.ParseExact(toDate, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            string[] paramNames = { "@FromDate", "@ToDate" };
            string[] paramValues = { fromDt.ToString("yyyy-MM-dd"), toDt.ToString("yyyy-MM-dd") };

            string encodedParams = string.Join(",", paramValues.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", paramNames.Select(HttpUtility.UrlEncode));

            string parameters = "{FromDate:'" + fromDt.ToString("yyyy-MM-dd") +
         "',ToDate:'" + toDt.ToString("yyyy-MM-dd")
        + "'}";
            // Get data from DB
            DataTable dt = SqlCmds.GetDT("sp_GetReservoirReport", encodedParams, encodedPNames, 2, DbNameSch, key, DbserverSchAndLoad, parameters);

            if (dt == null || dt.Rows.Count == 0)
            {
                return new string[] { "dataNotFound", "" };
            }

            using (MemoryStream ms = new MemoryStream())
            {
                // Create PDF
                iTextSharp.text.Document doc = new iTextSharp.text.Document(PageSize.A4.Rotate(), 20f, 20f, 20f, 20f);
                PdfWriter writer = PdfWriter.GetInstance(doc, ms);
                doc.Open();

                // Title
                Paragraph header = new Paragraph("Reservoir Data", FontFactory.GetFont("Arial", 16, iTextSharp.text.Font.BOLD));
                header.Alignment = Element.ALIGN_CENTER;
                doc.Add(header);
                doc.Add(new Paragraph("\n"));

                // Table
                PdfPTable table = new PdfPTable(dt.Columns.Count);
                table.WidthPercentage = 100;

                // Header style
                foreach (DataColumn col in dt.Columns)
                {
                    PdfPCell cell = new PdfPCell(new Phrase(col.ColumnName, FontFactory.GetFont("Arial", 10, iTextSharp.text.Font.BOLD, BaseColor.WHITE)));
                    cell.BackgroundColor = new BaseColor(0, 102, 204);
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    table.AddCell(cell);
                }

                // Data rows
                foreach (DataRow row in dt.Rows)
                {
                    foreach (var val in row.ItemArray)
                    {
                        PdfPCell cell = new PdfPCell(new Phrase(val.ToString() ?? "", FontFactory.GetFont("Arial", 9)));
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.AddCell(cell);
                    }
                }

                doc.Add(table);
                doc.Close();

                return new string[] { Convert.ToBase64String(ms.ToArray()), "ReservoirData.pdf" };
            }
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
    }

}
