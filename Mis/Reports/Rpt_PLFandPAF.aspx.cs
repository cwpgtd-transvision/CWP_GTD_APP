using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Printing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Web;
using System.Web.Hosting;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Excel = Microsoft.Office.Interop.Excel;
using Workbook = Microsoft.Office.Interop.Excel.Workbook;
using Worksheet = Microsoft.Office.Interop.Excel.Worksheet;
using DataTable = System.Data.DataTable;
using Font = iTextSharp.text.Font;


public partial class PLFandPAF : System.Web.UI.Page
{
    static string DbserverSchAndLoad = "DB2", DbNameSch = "MIS", key = "123", msg = "", login_user = "";
    static SqlCmd SqlCmds = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    } 
    public class PLFPAFDataRow
    {
        public string UnitName { get; set; }
        public double PresentFY_Daily_PLF { get; set; }
        public double PresentFY_Daily_PAF { get; set; }
        public double PresentFY_Monthly_PLF { get; set; }
        public double PresentFY_Monthly_PAF { get; set; }
        public double PresentFY_Yearly_PLF { get; set; }
        public double PresentFY_Yearly_PAF { get; set; }
        public double PreviousFY_Daily_PLF { get; set; }
        public double PreviousFY_Daily_PAF { get; set; }
        public double PreviousFY_Monthly_PLF { get; set; }
        public double PreviousFY_Monthly_PAF { get; set; }
        public double PreviousFY_Yearly_PLF { get; set; }
        public double PreviousFY_Yearly_PAF { get; set; }
    }
    



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PLFPAFDataRow> GetPLFPAFData(string Date, string StationName)
    {
        List<PLFPAFDataRow> result = new List<PLFPAFDataRow>();

        try
        {
            DateTime cdate = DateTime.ParseExact(Date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            string parameters = string.Join(",", cdate.ToString("yyyy-MM-dd"), StationName);
            string parameterNames = string.Join(",","@ReportDate", "@StationName");
            string parameters2 = "{ReportDate:'" + cdate.AddDays(-1).ToString("yyyy-MM-dd") +
            "',StationName:'" + StationName
           + "'}";

            DataTable dt = SqlCmds.GetDT("GetGenerationReportByStationAndUnit", parameters, parameterNames, 2, DbNameSch, key,DbserverSchAndLoad, parameters2);
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    result.Add(new PLFPAFDataRow
                    {
                        UnitName = row["UnitName"].ToString(),
                        PresentFY_Daily_PLF = Convert.ToDouble(row["PresentFY_Daily_PLF"]),
                        PresentFY_Daily_PAF = Convert.ToDouble(row["PresentFY_Daily_PAF"]),
                        PresentFY_Monthly_PLF = Convert.ToDouble(row["PresentFY_Monthly_PLF"]),
                        PresentFY_Monthly_PAF = Convert.ToDouble(row["PresentFY_Monthly_PAF"]),
                        PresentFY_Yearly_PLF = Convert.ToDouble(row["PresentFY_Yearly_PLF"]),
                        PresentFY_Yearly_PAF = Convert.ToDouble(row["PresentFY_Yearly_PAF"]),
                        PreviousFY_Daily_PLF = Convert.ToDouble(row["PreviousFY_Daily_PLF"]),
                        PreviousFY_Daily_PAF = Convert.ToDouble(row["PreviousFY_Daily_PAF"]),
                        PreviousFY_Monthly_PLF = Convert.ToDouble(row["PreviousFY_Monthly_PLF"]),
                        PreviousFY_Monthly_PAF = Convert.ToDouble(row["PreviousFY_Monthly_PAF"]),
                        PreviousFY_Yearly_PLF = Convert.ToDouble(row["PreviousFY_Yearly_PLF"]),
                        PreviousFY_Yearly_PAF = Convert.ToDouble(row["PreviousFY_Yearly_PAF"])
                    });
                }
            }
            
        }
        catch (Exception ex)
        {
            throw new Exception("Error retrieving PLF/PAF data: " + ex.Message);
        }

        return result;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PLFPAFDataRow> GetAllData(string Date)
    {
        var result = new List<PLFPAFDataRow>();
       
        try
        {
            DateTime cdate = DateTime.ParseExact(Date, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            string parameters = string.Join(",", cdate.ToString("yyyy-MM-dd"));
            string parameterNames = string.Join(",", "@ReportDate");

            string parameters2 = "{ReportDate:'" + cdate.AddDays(-1).ToString("yyyy-MM-dd") +"'}";

            DataTable dt = SqlCmds.GetDT("GetGenerationReportForAllStations", parameters, parameterNames, 1, DbNameSch, key, DbserverSchAndLoad, parameters2);
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    result.Add(new PLFPAFDataRow
                    {
                        UnitName = row["UnitName"].ToString(),
                        PresentFY_Daily_PLF = Convert.ToDouble(row["PresentFY_Daily_PLF"]),
                        PresentFY_Daily_PAF = Convert.ToDouble(row["PresentFY_Daily_PAF"]),
                        PresentFY_Monthly_PLF = Convert.ToDouble(row["PresentFY_Monthly_PLF"]),
                        PresentFY_Monthly_PAF = Convert.ToDouble(row["PresentFY_Monthly_PAF"]),
                        PresentFY_Yearly_PLF = Convert.ToDouble(row["PresentFY_Yearly_PLF"]),
                        PresentFY_Yearly_PAF = Convert.ToDouble(row["PresentFY_Yearly_PAF"]),
                        PreviousFY_Daily_PLF = Convert.ToDouble(row["PreviousFY_Daily_PLF"]),
                        PreviousFY_Daily_PAF = Convert.ToDouble(row["PreviousFY_Daily_PAF"]),
                        PreviousFY_Monthly_PLF = Convert.ToDouble(row["PreviousFY_Monthly_PLF"]),
                        PreviousFY_Monthly_PAF = Convert.ToDouble(row["PreviousFY_Monthly_PAF"]),
                        PreviousFY_Yearly_PLF = Convert.ToDouble(row["PreviousFY_Yearly_PLF"]),
                        PreviousFY_Yearly_PAF = Convert.ToDouble(row["PreviousFY_Yearly_PAF"])
                    });
                }
            }
            

        }
        catch (Exception ex)
        {
            throw new Exception("Error retrieving PLF/PAF data: " + ex.Message, ex);
        }

        return result;
        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<string> GetStations()
    {
        List<string> stations = new List<string>();
        try
        {
            string parameters= "";
            string parameterNames = "";

            DataTable dt = SqlCmds.GetDT("GetDistinctStations", parameters, parameterNames, 0, DbNameSch, key, DbserverSchAndLoad, parameters);
            foreach (DataRow row in dt.Rows)
            {
                stations.Add(row["GENSTN"].ToString());
            }
        }
        catch (Exception ex)
        {
            throw new Exception("Error retrieving stations: " + ex.Message);
        }
        return stations;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object DownloadPDF(string StationName, string Date)
    {
        try
        {
            if (string.IsNullOrEmpty(Date))
            {
                return new { error = "Date parameter is missing." };
            }

            DateTime dt;
            
            if (!DateTime.TryParseExact(Date, "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dt))
            {
                return new { error = "Invalid date format. Please use 'dd-MM-yyyy'." };
            }

            var data = StationName == "All" ? GetAllData(Date) : GetPLFPAFData(Date, StationName);

            if (data == null || data.Count == 0)
            {
                // You should return an object with an error or a message
                return new { message = "No data available for the selected station and date." };
            }

            using (MemoryStream ms = new MemoryStream())
            {
                // ... (Your existing iTextSharp PDF generation code) ...
                Document doc = new Document(PageSize.A4.Rotate(), 10, 10, 10, 10);
                PdfWriter.GetInstance(doc, ms);
                doc.Open();

                Paragraph title = new Paragraph(
                    "KARNATAKA POWER TRANSMISSION CORPORATION LIMITED (KPTCL) " + dt.ToString("dd-MM-yyyy"),
                    FontFactory.GetFont("Calibri", 14, iTextSharp.text.Font.BOLD)
                );
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);
                doc.Add(new Paragraph(" "));

                PdfPTable table = new PdfPTable(13);
                table.WidthPercentage = 100;
                table.SetWidths(new float[] { 18f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f });

                PdfPCell cell = new PdfPCell(new Phrase("Unit Name", FontFactory.GetFont("Calibri", 9, iTextSharp.text.Font.BOLD)));
                cell.Rowspan = 3; cell.HorizontalAlignment = Element.ALIGN_CENTER; cell.VerticalAlignment = Element.ALIGN_MIDDLE;
                cell.BackgroundColor = new BaseColor(173, 216, 230);
                table.AddCell(cell);

                cell = new PdfPCell(new Phrase("Present FY", FontFactory.GetFont("Calibri", 9, iTextSharp.text.Font.BOLD)));
                cell.Colspan = 6; cell.HorizontalAlignment = Element.ALIGN_CENTER; cell.BackgroundColor = new BaseColor(173, 216, 230);
                table.AddCell(cell);

                cell = new PdfPCell(new Phrase("Previous FY", FontFactory.GetFont("Calibri", 9, iTextSharp.text.Font.BOLD)));
                cell.Colspan = 6; cell.HorizontalAlignment = Element.ALIGN_CENTER; cell.BackgroundColor = new BaseColor(173, 216, 230);
                table.AddCell(cell);

                string[] subHeaders = { "Daily", "Monthly", "Yearly", "Daily", "Monthly", "Yearly" };
                foreach (var hdr in subHeaders)
                {
                    cell = new PdfPCell(new Phrase(hdr, FontFactory.GetFont("Calibri", 9, iTextSharp.text.Font.BOLD)));
                    cell.Colspan = 2; cell.HorizontalAlignment = Element.ALIGN_CENTER; cell.BackgroundColor = new BaseColor(173, 216, 230);
                    table.AddCell(cell);
                }

                for (int i = 0; i < 6; i++)
                {
                    table.AddCell(CreateHeaderCell("PLF%"));
                    table.AddCell(CreateHeaderCell("PAF%"));
                }

                foreach (var item in data)
                {
                    table.AddCell(CreateCell(item.UnitName, Element.ALIGN_LEFT));
                    table.AddCell(CreateCell(item.PresentFY_Daily_PLF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PresentFY_Daily_PAF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PresentFY_Monthly_PLF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PresentFY_Monthly_PAF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PresentFY_Yearly_PLF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PresentFY_Yearly_PAF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PreviousFY_Daily_PLF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PreviousFY_Daily_PAF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PreviousFY_Monthly_PLF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PreviousFY_Monthly_PAF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PreviousFY_Yearly_PLF.ToString("F2"), Element.ALIGN_RIGHT));
                    table.AddCell(CreateCell(item.PreviousFY_Yearly_PAF.ToString("F2"), Element.ALIGN_RIGHT));
                }

                doc.Add(table);
                doc.Close();

                byte[] pdfData = ms.ToArray();

                // Return a JSON object with a 'fileData' property
                return new { fileData = Convert.ToBase64String(pdfData) };
            }
        }
        catch (Exception ex)
        {
            // Return a JSON object with an 'error' property
            return new { error = "An unexpected error occurred: " + ex.Message };
        }
    }

 
    private static PdfPCell CreateHeaderCell(string text)
    {
        var cell = new PdfPCell(new Phrase(text, FontFactory.GetFont("Calibri", 9, iTextSharp.text.Font.BOLD)));
        cell.HorizontalAlignment = Element.ALIGN_CENTER;
        cell.VerticalAlignment = Element.ALIGN_MIDDLE;
        cell.BackgroundColor = new BaseColor(240, 240, 240);
        return cell;
    }

    private static PdfPCell CreateCell(string text, int alignment)
    {
        var cell = new PdfPCell(new Phrase(text, FontFactory.GetFont("Calibri", 9)));
        cell.HorizontalAlignment = alignment;
        cell.VerticalAlignment = Element.ALIGN_MIDDLE;
        return cell;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object DownloadExcel(string StationName, string Date)
    {
        string[] result = new string[2]; 
        Application xlApp = null;
        Workbook xlWorkBook = null;
        Worksheet xlWorkSheet = null;
        object misValue = System.Reflection.Missing.Value;

        try
        {
           
            if (string.IsNullOrWhiteSpace(Date))
            {
                return new { error = "Error: Date parameter is missing." };
            }

            DateTime dt;
            if (!DateTime.TryParseExact(Date, "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dt))
            {
                return new { error = "Error: Invalid date format. Please use 'yyyy-MM-dd'." };
            }
            var data = StationName == "All" ? GetAllData(Date) : GetPLFPAFData(Date, StationName);



            if (data == null || data.Count == 0)
            {
                return new { error = "No data found for the selected station and date." };
            }

            
            xlApp = new Application();
            xlApp.DisplayAlerts = false;
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Worksheet)xlWorkBook.Sheets[1];
            xlWorkSheet.Name = "Daily Generation Report";

          
            xlWorkSheet.Cells[1, 1] = "KARNATAKA POWER TRANSMISSION CORPORATION LIMITED (KPTCL) " + dt.ToString("dd-MM-yyyy");
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 1], xlWorkSheet.Cells[1, 17]].Merge();
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 1], xlWorkSheet.Cells[1, 17]].HorizontalAlignment = XlHAlign.xlHAlignCenter;
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 1], xlWorkSheet.Cells[1, 17]].Font.Bold = true;
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 1], xlWorkSheet.Cells[1, 17]].Font.Size = 14;

            
            xlWorkSheet.Cells[3, 1] = "Unit Name";
            xlWorkSheet.Range[xlWorkSheet.Cells[3, 1], xlWorkSheet.Cells[4, 1]].Merge();
            xlWorkSheet.Cells[3, 2] = "Present FY";
            xlWorkSheet.Range[xlWorkSheet.Cells[3, 2], xlWorkSheet.Cells[3, 7]].Merge();
            xlWorkSheet.Cells[3, 8] = "Previous FY";
            xlWorkSheet.Range[xlWorkSheet.Cells[3, 8], xlWorkSheet.Cells[3, 13]].Merge();
            xlWorkSheet.Range[xlWorkSheet.Cells[3, 1], xlWorkSheet.Cells[3, 13]].HorizontalAlignment = XlHAlign.xlHAlignCenter;
            xlWorkSheet.Range[xlWorkSheet.Cells[3, 1], xlWorkSheet.Cells[3, 13]].Font.Bold = true;
            xlWorkSheet.Range[xlWorkSheet.Cells[3, 1], xlWorkSheet.Cells[3, 13]].Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightSteelBlue);

            
            string[] plfPafHeaders = { "PLF%", "PAF%", "PLF%", "PAF%", "PLF%", "PAF%", "PLF%", "PAF%", "PLF%", "PAF%", "PLF%", "PAF%" };
            int col = 2;
            for (int i = 0; i < plfPafHeaders.Length; i++)
            {
                xlWorkSheet.Cells[4, col] = plfPafHeaders[i];
                col++;
            }

            xlWorkSheet.Range[xlWorkSheet.Cells[4, 1], xlWorkSheet.Cells[4, 13]].HorizontalAlignment = XlHAlign.xlHAlignCenter;
            xlWorkSheet.Range[xlWorkSheet.Cells[4, 1], xlWorkSheet.Cells[4, 13]].Font.Bold = true;
            xlWorkSheet.Range[xlWorkSheet.Cells[4, 1], xlWorkSheet.Cells[4, 13]].Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightSteelBlue);

            
            int row = 5;
            foreach (var item in data)
            {
                xlWorkSheet.Cells[row, 1] = item.UnitName;
                xlWorkSheet.Cells[row, 2] = item.PresentFY_Daily_PLF;
                xlWorkSheet.Cells[row, 3] = item.PresentFY_Daily_PAF;
                xlWorkSheet.Cells[row, 4] = item.PresentFY_Monthly_PLF;
                xlWorkSheet.Cells[row, 5] = item.PresentFY_Monthly_PAF;
                xlWorkSheet.Cells[row, 6] = item.PresentFY_Yearly_PLF;
                xlWorkSheet.Cells[row, 7] = item.PresentFY_Yearly_PAF;
                xlWorkSheet.Cells[row, 8] = item.PreviousFY_Daily_PLF;
                xlWorkSheet.Cells[row, 9] = item.PreviousFY_Daily_PAF;
                xlWorkSheet.Cells[row, 10] = item.PreviousFY_Monthly_PLF;
                xlWorkSheet.Cells[row, 11] = item.PreviousFY_Monthly_PAF;
                xlWorkSheet.Cells[row, 12] = item.PreviousFY_Yearly_PLF;
                xlWorkSheet.Cells[row, 13] = item.PreviousFY_Yearly_PAF;
                row++;
            }

           
            xlWorkSheet.Range[xlWorkSheet.Cells[5, 2], xlWorkSheet.Cells[row - 1, 13]].NumberFormat = "0.00";
            xlWorkSheet.Range[xlWorkSheet.Cells[5, 2], xlWorkSheet.Cells[row - 1, 13]].HorizontalAlignment = XlHAlign.xlHAlignRight;
            
           

           
            xlWorkSheet.Columns.AutoFit();

        
            Range tableRange = xlWorkSheet.Range[xlWorkSheet.Cells[3, 1], xlWorkSheet.Cells[row - 1, 13]];
            tableRange.Borders.LineStyle = XlLineStyle.xlContinuous;
            tableRange.Borders.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Black);
            tableRange.Borders.Weight = XlBorderWeight.xlThin;  


            xlWorkSheet.Columns.AutoFit();
            xlWorkSheet.Range["A:A"].ColumnWidth = 20;  
            xlWorkSheet.Range["B:B"].ColumnWidth = 12;  
            xlWorkSheet.Range["C:C"].ColumnWidth = 12;  
            xlWorkSheet.Range["M:M"].ColumnWidth = 12;  

            string datetime = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");
            string compname = "DailyGenerationReport"; 
            string drive = "D";
            string dir = drive + @":\DOWNLOADED REPORTS";
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            
            string webDir = HostingEnvironment.MapPath("~/Files/");
            if (!Directory.Exists(webDir))
            {
                Directory.CreateDirectory(webDir);
            }

            string fileName = compname + "-" + datetime + ".xlsx";
            string drivePath = Path.Combine(dir, fileName);
            string webPath = Path.Combine(webDir, fileName);

            
            xlWorkBook.SaveAs(
                drivePath,
                XlFileFormat.xlOpenXMLWorkbook,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                XlSaveAsAccessMode.xlNoChange,
                XlSaveConflictResolution.xlLocalSessionChanges,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing
            );

           
            xlWorkBook.SaveAs(
                webPath,
                XlFileFormat.xlOpenXMLWorkbook,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                XlSaveAsAccessMode.xlNoChange,
                XlSaveConflictResolution.xlLocalSessionChanges,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing
            );

            
            xlWorkBook.Close(false, misValue, misValue);
            xlApp.Quit();

            
            byte[] bytes = File.ReadAllBytes(webPath);
            result[0] = Convert.ToBase64String(bytes, 0, bytes.Length);
            result[1] = fileName;

            
            try
            {
                if (File.Exists(webPath)) File.Delete(webPath);
                if (File.Exists(drivePath)) File.Delete(drivePath);
            }
            catch
            {
                
            }

           
            return new { fileData = result[0], fileName = result[1] };
        }
        catch (Exception ex)
        {
            return new { error = "An unexpected error occurred: " + ex.Message };
        }
        finally
        {
            
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





