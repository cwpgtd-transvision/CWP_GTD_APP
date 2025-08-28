using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing.Printing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.ServiceModel.Activities;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DataTable = System.Data.DataTable;
using Font = iTextSharp.text.Font;

public partial class Rpt_DamLevel : System.Web.UI.Page 
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
        else
        {
            login_user = HttpContext.Current.Session["USERNAME"].ToString();
        }
    }

    [WebMethod]
    public static string BindReservoirData(string date)
    {
        string result = "";
        try
        {
            DateTime cdate = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            string[] spParam = new[] { cdate.AddDays(-1).ToString("yyyy-MM-dd"), cdate.ToString("yyyy-MM-dd") };
            string[] spPName = new[] { "@PDATE", "@CDATE" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
            string parameters = "{PDATE:'" + cdate.AddDays(-1).ToString("yyyy-MM-dd") +
             "',CDATE:'" + cdate.ToString("yyyy-MM-dd")
            + "'}";

            DataTable dt = SqlCmds.GetDT("SP_MASTERDAMVIEW_Q1", encodedParams, encodedPNames, Count = 2, DbNameSch, key, DbserverSchAndLoad, parameters);
            //DataTable dt = SqlCmds.SelectDataMis("SP_MASTERDAMVIEW_Q1", spParam, spPName, Count = 2);

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
            throw new Exception("Server Error: " + ex.Message);
        }
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string GeneratePDF(string date)
    {
        try
        {
            DateTime cdate = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            string[] spParam = new[] { cdate.AddDays(-1).ToString("yyyy-MM-dd"), cdate.ToString("yyyy-MM-dd") };
            string[] spPName = new[] { "@PDATE", "@CDATE" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));

            string parameters = "{PDATE:'" + cdate.AddDays(-1).ToString("yyyy-MM-dd") +
             "',CDATE:'" + cdate.ToString("yyyy-MM-dd")
            + "'}";

            DataTable dt = SqlCmds.GetDT("SP_MASTERDAMVIEW_Q1", encodedParams, encodedPNames, Count = 2, DbNameSch, key, DbserverSchAndLoad, parameters);

            if (dt == null || dt.Rows.Count == 0)
            {
                return "dataNotFound";
            }

            using (MemoryStream ms = new MemoryStream())
            {
                using (Document document = new Document(PageSize.A3.Rotate(), 30, 30, 30, 20))
                {
                    PdfWriter.GetInstance(document, ms);

                    // Fonts
                    Font fontBold = new Font(Font.FontFamily.HELVETICA, 9f, Font.BOLD);
                    Font fontNormal = new Font(Font.FontFamily.HELVETICA, 9f, Font.NORMAL);

                    document.Open();

                    // Add Logo
                    string imgpath = HttpContext.Current.Server.MapPath("~/assets/images/RPTLOGO.jpg");
                    iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(imgpath);
                    image.Alignment = iTextSharp.text.Image.ALIGN_RIGHT;
                    image.ScaleToFit(150f, 80f);
                    //document.Add(image);

                    // Title
                    Paragraph title = new Paragraph("Kpcl\nDam Levels Report as on " + cdate.ToString("dd-MM-yyyy"), fontBold);
                    title.Alignment = Element.ALIGN_CENTER;
                    document.Add(title);
                    document.Add(new Paragraph("\r\n"));

                    // Create table with 14 columns
                    PdfPTable pdfTable = new PdfPTable(14);
                    pdfTable.WidthPercentage = 100;

                    PdfPCell cell;

                    // First Row (rowspan headers)
                    string[] firstRowHeaders = { "SLNO", "Reservoir", "Gross Capacity (MCft)", "Live Capacity (MCft)", "FRL", "MDDL" };
                    foreach (string header in firstRowHeaders)
                    {
                        cell = new PdfPCell(new Phrase(header, fontBold))
                        {
                            Rowspan = 2,
                            HorizontalAlignment = Element.ALIGN_CENTER,
                            VerticalAlignment = Element.ALIGN_MIDDLE,
                            BackgroundColor = new BaseColor(228, 236, 247)
                        };
                        pdfTable.AddCell(cell);
                    }

                    // Group headers (colspan)
                    cell = new PdfPCell(new Phrase("Present Year : Capacity", fontBold))
                    {
                        Colspan = 4,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        VerticalAlignment = Element.ALIGN_MIDDLE,
                        BackgroundColor = new BaseColor(200, 220, 240)
                    };
                    pdfTable.AddCell(cell);

                    cell = new PdfPCell(new Phrase("Last Year : Capacity", fontBold))
                    {
                        Colspan = 4,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        VerticalAlignment = Element.ALIGN_MIDDLE,
                        BackgroundColor = new BaseColor(200, 220, 240)
                    };
                    pdfTable.AddCell(cell);

                    // Second Row (sub-headers)
                    string[] subHeaders = { "Level", "Cap(MCft)", "Cap(%)", "Eq.Energy(MU)",
                                        "Level", "Cap(MCft)", "Cap(%)", "Eq.Energy(MU)" };
                    foreach (string header in subHeaders)
                    {
                        cell = new PdfPCell(new Phrase(header, fontBold))
                        {
                            HorizontalAlignment = Element.ALIGN_CENTER,
                            VerticalAlignment = Element.ALIGN_MIDDLE,
                            BackgroundColor = new BaseColor(228, 236, 247)
                        };
                        pdfTable.AddCell(cell);
                    }

                    // Data Rows
                    foreach (DataRow row in dt.Rows)
                    {
                        foreach (var item in row.ItemArray)
                        {
                            cell = new PdfPCell(new Phrase(item.ToString(), fontNormal))
                            {
                                HorizontalAlignment = Element.ALIGN_CENTER,
                                VerticalAlignment = Element.ALIGN_MIDDLE
                            };
                            pdfTable.AddCell(cell);
                        }
                    }

                    document.Add(pdfTable);
                    document.Close();
                }

                return Convert.ToBase64String(ms.ToArray());
            }
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string[] GenerateExcel(string date)
    {
        string[] result = new string[2]; // [0]=base64, [1]=filename
        Application xlApp = null;
        Workbook xlWorkBook = null;
        Worksheet xlWorkSheet = null;
        object misValue = System.Reflection.Missing.Value;
        bool foundPID;
        int ourPID = 0;
        int tmpX = 0;
        int indexRow = 1;
        int indexCol = 1;
        int[] existingPIDs = new int[1000]; // Consider using a List<int> for dynamic size if needed
        Process[] existingExcels = Process.GetProcessesByName("excel");
        foreach (Process proc in existingExcels)
        {
            existingPIDs[tmpX++] = proc.Id;
        }
        try
        {
            DateTime cdate = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            string[] spParam = new[] { cdate.AddDays(-1).ToString("yyyy-MM-dd"), cdate.ToString("yyyy-MM-dd") };
            string[] spPName = new[] { "@PDATE", "@CDATE" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
            string parameters = "{PDATE:'" + cdate.AddDays(-1).ToString("yyyy-MM-dd") +
              "',CDATE:'" + cdate.ToString("yyyy-MM-dd")
             + "'}";

            DataTable dt = SqlCmds.GetDT("SP_MASTERDAMVIEW_Q1", encodedParams, encodedPNames, Count = 2, DbNameSch, key, DbserverSchAndLoad, parameters);

            if (dt == null || dt.Rows.Count == 0)
            {
                return new string[] { "dataNotFound", "" };
            }

            // Start Excel
            xlApp = new Application();
            xlApp.DisplayAlerts = false;
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Worksheet)xlWorkBook.Sheets[1];
            xlWorkSheet.Name = "Dam Levels";

            // ===== First Row Headers (rowspan style) =====
            string[] firstRowHeaders = new[] { "SLNO", "Reservoir", "Gross Capacity (MCft)", "Live Capacity (MCft)", "FRL", "MDDL" };
            int colIndex = 1;
            for (int i = 0; i < firstRowHeaders.Length; i++)
            {
                xlWorkSheet.Cells[1, colIndex] = firstRowHeaders[i];
                Range range = xlWorkSheet.Range[xlWorkSheet.Cells[1, colIndex], xlWorkSheet.Cells[2, colIndex]];
                range.Merge();
                range.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                range.VerticalAlignment = XlVAlign.xlVAlignCenter;
                range.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightSteelBlue);
                range.Font.Bold = true;
                colIndex++;
            }

            // ===== Group headers (colspan style) =====
            // Present Year
            Range rangePresent = xlWorkSheet.Range[xlWorkSheet.Cells[1, colIndex], xlWorkSheet.Cells[1, colIndex + 3]];
            rangePresent.Merge();
            rangePresent.Value2 = "Present Year : Capacity";
            rangePresent.HorizontalAlignment = XlHAlign.xlHAlignCenter;
            rangePresent.VerticalAlignment = XlVAlign.xlVAlignCenter;
            rangePresent.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightBlue);
            rangePresent.Font.Bold = true;
            colIndex += 4;

            // Last Year
            Range rangeLast = xlWorkSheet.Range[xlWorkSheet.Cells[1, colIndex], xlWorkSheet.Cells[1, colIndex + 3]];
            rangeLast.Merge();
            rangeLast.Value2 = "Last Year : Capacity";
            rangeLast.HorizontalAlignment = XlHAlign.xlHAlignCenter;
            rangeLast.VerticalAlignment = XlVAlign.xlVAlignCenter;
            rangeLast.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightBlue);
            rangeLast.Font.Bold = true;

            // ===== Second Row Sub-Headers =====
            string[] subHeaders = new[] { "Level", "Cap(MCft)", "Cap(%)", "Eq.Energy(MU)", "Level", "Cap(MCft)", "Cap(%)", "Eq.Energy(MU)" };
            colIndex = 7;
            for (int i = 0; i < subHeaders.Length; i++)
            {
                xlWorkSheet.Cells[2, colIndex] = subHeaders[i];
                Range r = (Range)xlWorkSheet.Cells[2, colIndex];
                r.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                r.VerticalAlignment = XlVAlign.xlVAlignCenter;
                r.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightSteelBlue);
                r.Font.Bold = true;
                colIndex++;
            }

            // Header borders
            xlWorkSheet.Range["A1", "N2"].Borders.LineStyle = XlLineStyle.xlContinuous;

            // ===== Data Rows =====
            int rowIndex = 3;
            foreach (DataRow dr in dt.Rows)
            {
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    // write as text to avoid Excel auto-format issues
                    xlWorkSheet.Cells[rowIndex, i + 1] = (dr[i] == null) ? "" : dr[i].ToString();
                }
                rowIndex++;
            }

            // ===== Auto Fit & Protect =====
            xlWorkSheet.Columns.AutoFit();

            // Protect (all optional params as in your snippet)
            xlWorkSheet.Protect(
                misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue,
                misValue, misValue, misValue, misValue, misValue, misValue, misValue, misValue
            );

            // ===== Save in both locations =====
            string datetime = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");
            string compname = "DamLevelsReport"; // change if you have a dynamic name
            string drive = "D";
            string dir = drive + @":\DOWNLOADED DAMLEVELS";
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            // Web ~/Files/ directory
            string webDir = HostingEnvironment.MapPath("~/Files/");
            if (!Directory.Exists(webDir))
            {
                Directory.CreateDirectory(webDir);
            }

            string fileName = compname + "-" + datetime + ".xlsx";
            string drivePath = Path.Combine(dir, fileName);
            string webPath = Path.Combine(webDir, fileName);

            // Save to drive path
            xlWorkBook.SaveAs(
                drivePath,
                XlFileFormat.xlOpenXMLWorkbook,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                XlSaveAsAccessMode.xlNoChange,
                XlSaveConflictResolution.xlLocalSessionChanges,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing
            );

            // Save to ~/Files/
            xlWorkBook.SaveAs(
                webPath,
                XlFileFormat.xlOpenXMLWorkbook,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                XlSaveAsAccessMode.xlNoChange,
                XlSaveConflictResolution.xlLocalSessionChanges,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing
            );

            // Close/quit
            xlWorkBook.Close(false, misValue, misValue);
            xlApp.Quit();

            // Read from ~/Files/ for download
            byte[] bytes = File.ReadAllBytes(webPath);
            result[0] = Convert.ToBase64String(bytes, 0, bytes.Length);
            result[1] = fileName;
            try
            {
                if (File.Exists(webPath))
                    File.Delete(webPath);

                if (File.Exists(drivePath))
                    File.Delete(drivePath);
            }
            catch
            {
                // Optional: log if you want to track failures to delete
            }
            // Check for new Excel processes
            existingExcels = Process.GetProcessesByName("excel");
            // Find out which of the Excel process IDs is our new app
            foreach (Process proc in existingExcels)
            {
                foundPID = false;
                foreach (int p in existingPIDs)
                {
                    if (p == proc.Id)
                    {
                        foundPID = true;
                        break;
                    }
                }
                if (!foundPID)
                {
                    ourPID = proc.Id;
                    break; // Exit loop early once we find the new PID
                }
            }
            Process[] localByName = Process.GetProcessesByName("excel");
            // Close Excel processes based on conditions
            if (tmpX == 0)
            {
                foreach (Process proc in localByName)
                {
                    proc.Kill();
                }
            }
            else if (ourPID != 0)
            {
                foreach (Process proc in localByName)
                {
                    if (proc.Id == ourPID)
                    {
                        proc.Kill();
                        break; // Exit loop early once we kill the specific Excel process
                    }
                }
            }
            return result;
        }
        catch(Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
        finally
        {
            // COM cleanup
            try
            {
                if (xlWorkSheet != null) Marshal.ReleaseComObject(xlWorkSheet);
            }
            catch { }
            try
            {
                if (xlWorkBook != null) Marshal.ReleaseComObject(xlWorkBook);
            }
            catch { }
            try
            {
                if (xlApp != null) Marshal.ReleaseComObject(xlApp);
            }
            catch { }
            xlWorkSheet = null;
            xlWorkBook = null;
            xlApp = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }
}