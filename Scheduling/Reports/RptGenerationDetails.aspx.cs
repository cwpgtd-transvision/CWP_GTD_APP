using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser.clipper;
using Microsoft.Office.Interop.Excel;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Printing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Application = Microsoft.Office.Interop.Excel.Application;
using Color = System.Drawing.Color;
using DataTable = System.Data.DataTable;
using Document = iTextSharp.text.Document;
using Font = iTextSharp.text.Font;
using Workbook = Microsoft.Office.Interop.Excel.Workbook;
using Worksheet = Microsoft.Office.Interop.Excel.Worksheet;

public partial class RptGenerationDetails : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static string msg = "";

    static string DbserverSchAndLoad = "1", DbNameSch = "DBOSAMAST_SCHEDULING", key = "Tvd1234!", login_user = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static string GetGenerationData(string dValue)
    {
        try
        {
            var data = new List<object>();
            DateTime tDate = DateTime.ParseExact(dValue, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            string[] spParam = new[] { tDate.ToString("yyyy-MM-dd") };
            string[] spPName = new[] { "@SCH_DATE" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
            DataTable dt = SqlCmd.GetDT("SP_RPT_GENERATION_Q1", encodedParams, encodedPNames, Count = 1, DbNameSch, key, DbserverSchAndLoad);
            foreach (DataRow row in dt.Rows)
            {
                data.Add(new object[]
                {
            row["GENID"],
            row["GENFULLNAME"],
            row["MW_MU"],
            row["Unit1"],
            row["Unit2"],
            row["Unit3"],
            row["Unit4"],
            row["Unit5"],
            row["Unit6"],
            row["Unit7"],
            row["Unit8"],
            row["Unit9"],
            row["Unit10"],
            row["DAILYGEN"],
            row["PLF"],
            row["Gross"],
            row["Net"],
            row["MONTHGEN"],
            row["MONTHTAR"],
            row["FYTAR"],
            row["FYGN"],
            row["LFYGEN"],
            row["WYGEN"],
             row["LTWYGEN"]

                });
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(data);
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
    }

    [WebMethod]
    public static string DownloadGenerationDataPdf(string dValue)
    {
        try
        {
            DateTime tDate = DateTime.ParseExact(dValue, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            string[] spParam = new[] { tDate.ToString("yyyy-MM-dd") };
            string[] spPName = new[] { "@SCH_DATE" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
            DataTable dt = SqlCmd.GetDT("SP_RPT_GENERATION_Q1", encodedParams, encodedPNames, Count = 1, DbNameSch, key, DbserverSchAndLoad);
            dt.Columns.Remove("SlNo");

            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document(PageSize.A3.Rotate(), 10, 10, 10, 10);
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                document.Open();

                // Add Image (logo)
                string imagePath = HttpContext.Current.Server.MapPath("~/assets/images/RPTLOGO.jpg");
                iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(imagePath);
                logo.ScaleToFit(120f, 60f);
                logo.Alignment = Element.ALIGN_CENTER;
                //document.Add(logo);

                // Add Title
                Paragraph pHeader = new Paragraph("KARNATAKA POWER CORPORATION LIMITED", FontFactory.GetFont("Arial", 16, Font.BOLD));
                pHeader.Alignment = Element.ALIGN_CENTER;
                pHeader.SpacingBefore = 10f;   // space after logo
                pHeader.SpacingAfter = 5f;
                document.Add(pHeader);

                // Add Sub-Title
                Paragraph pSubHeader = new Paragraph("HO-Daily Generation Report", FontFactory.GetFont("Arial", 14, Font.BOLD));
                pSubHeader.Alignment = Element.ALIGN_CENTER;
                pSubHeader.SpacingAfter = 10f;
                document.Add(pSubHeader);

                // Table setup
                PdfPTable table = new PdfPTable(24);
                table.WidthPercentage = 100;

                float[] columnWidths = new float[]
                {
            2f, 10f, 7f, // Slno, Project, Unit MW/Mu
            4f,4f,4f,4f,4f,4f,4f,4f,4f,4f, // Units 1–10
            3f,3f, // Daily Gen, PLF
            3f,3f, // Gross, Net
            4f,4f, // Monthly Genration, Monthly Target
            4f,4f, // FY Target, FY Generation
            4f,4f ,4f // Last FY Gen, WY Gen
                };

                table.SetWidths(columnWidths);

                // Headers
                string[] colHeaders = new string[] {
            "Slno", "Project", "Unit MW/Mu", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
            "Daily Gen", "PLF in(%)", "Gross", "Net", "Monthly Genration", "Monthly Target",
            "FY Target", "FY Generation", "Last FY Generation", "WY Gen", "Last WY Gen"
        };

                BaseColor headerColor = new BaseColor(0xe4, 0xec, 0xf7);
                foreach (var col in colHeaders)
                {
                    PdfPCell cell = new PdfPCell(new Phrase(col, FontFactory.GetFont("Arial", 7, Font.BOLD)));
                    cell.BackgroundColor = headerColor;
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    cell.VerticalAlignment = Element.ALIGN_MIDDLE;
                    table.AddCell(cell);
                }

                List<decimal> numeratorTotals = new List<decimal>();
                List<decimal> denominatorTotals = new List<decimal>();
                List<decimal> otherValues = new List<decimal>();

                int totalColumns = dt.Columns.Count;

                // Initialize totals for columns starting from index 2 (3rd column)
                for (int i = 2; i < totalColumns; i++)
                {
                    numeratorTotals.Add(0m);
                    denominatorTotals.Add(0m);
                    otherValues.Add(0m);
                }

                // Loop through rows
                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < row.ItemArray.Length; i++)
                    {
                        var item = row[i];
                        string itemString = item.ToString().Trim() ?? "";

                        // Add the cell to the PDF table
                        PdfPCell cell = new PdfPCell(new Phrase(itemString, FontFactory.GetFont("Arial", 9)));
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_MIDDLE;
                        table.AddCell(cell);

                        // Only process totals from column index 2 onward
                        if (i >= 2)
                        {
                            string[] parts = itemString.Split('/');
                            decimal numerator, denominator;
                            if (i == 2 && parts.Length == 2 &&
                                decimal.TryParse(parts[0].Trim(), NumberStyles.Any, CultureInfo.InvariantCulture, out numerator) &&
                                decimal.TryParse(parts[1].Trim(), NumberStyles.Any, CultureInfo.InvariantCulture, out denominator))
                            {
                                numeratorTotals[i - 2] += numerator;
                                denominatorTotals[i - 2] += denominator;
                            }
                            else
                            {
                                decimal value;
                                if (decimal.TryParse(itemString, NumberStyles.Any, CultureInfo.InvariantCulture, out value))
                                {
                                    otherValues[i - 2] += value;
                                }
                            }
                        }
                    }
                }

                // Add totals row to PDF table
                for (int i = 0; i < totalColumns; i++)
                {
                    PdfPCell totalCell;

                    if (i < 1)
                    {
                        totalCell = new PdfPCell(new Phrase("")); // First column empty
                    }
                    else if (i == 1)
                    {
                        totalCell = new PdfPCell(new Phrase("Total:", new Font(Font.FontFamily.HELVETICA, 10f, Font.BOLD)));
                        totalCell.HorizontalAlignment = Element.ALIGN_RIGHT;
                    }
                    else
                    {
                        string totalValue;

                        if (i == 2) // Special format for column 3: numerator / denominator
                        {
                            decimal totalNumerator = numeratorTotals[i - 2];
                            decimal totalDenominator = denominatorTotals[i - 2];
                            totalValue = totalNumerator + "/" + totalDenominator;
                        }
                        else // Regular numeric sum
                        {
                            decimal total = otherValues[i - 2];
                            totalValue = total.ToString("F3");
                        }

                        totalCell = new PdfPCell(new Phrase(totalValue, new Font(Font.FontFamily.HELVETICA, 10f, Font.BOLD)));
                        totalCell.HorizontalAlignment = Element.ALIGN_CENTER;
                    }

                    totalCell.VerticalAlignment = Element.ALIGN_MIDDLE;
                    totalCell.FixedHeight = 20f;
                    table.AddCell(totalCell);
                }


                Paragraph cell2 = new Paragraph(new Phrase("System Peak           :" + "12553 MW" + "               TB Share           :   " + ".2423" + "                      1.2386", FontFactory.GetFont("Arial", 7, Font.BOLD)));
                cell2.Alignment = Element.ALIGN_CENTER;
                cell2.SpacingAfter = 5f;

                Paragraph cell3 = new Paragraph(new Phrase("Max Frequency         :" + "50.12 Hz" + "               Jurala Share       :" + "4.1300" + "                        16.5690", FontFactory.GetFont("Arial", 7, Font.BOLD)));
                cell3.Alignment = Element.ALIGN_CENTER;
                cell3.SpacingAfter = 5f;


                Paragraph cell4 = new Paragraph(new Phrase("Min Frequency         : " + "49.71 Hz" + "              State Import       :" + "134.76000" + "                     742.0833", FontFactory.GetFont("Arial", 7, Font.BOLD)));

                cell4.Alignment = Element.ALIGN_CENTER;
                cell4.SpacingAfter = 5f;


                Paragraph cell5 = new Paragraph(new Phrase("                         " + "12553" + "               State Consumption   :" + "245.9128" + "                     1296.2999", FontFactory.GetFont("Arial", 7, Font.BOLD)));
                cell5.Alignment = Element.ALIGN_CENTER;
                cell5.SpacingAfter = 5f;


                document.Add(table);
                document.Add(cell2);
                document.Add(cell3);
                document.Add(cell4);
                document.Add(cell5);
                document.Close();

                return Convert.ToBase64String(ms.ToArray());
            }
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
    }

    [WebMethod]
    public static string[] DownloadGenerationDataExcelHtml(string dValue)
    {
        string[] result = new string[2]; // [0]=base64, [1]=filename
        Application xlApp = null;
        Workbook xlWorkBook = null;
        Worksheet xlWorkSheet = null;
        object misValue = Type.Missing;
        bool foundPID;
        int ourPID = 0;
        int tmpX = 0;
        int[] existingPIDs = new int[1000];

        var existingExcels = Process.GetProcessesByName("EXCEL");
        foreach (var proc in existingExcels)
            existingPIDs[tmpX++] = proc.Id;

        try
        {
            // Initialize Excel COM objects
            xlApp = new Application();
            xlApp.DisplayAlerts = false;
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Worksheet)xlWorkBook.Sheets[1];
            xlWorkSheet.Name = "Generation Report";

            // Parse input date
            DateTime tDate = DateTime.ParseExact(dValue, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            string[] spParam = new[] { tDate.ToString("yyyy-MM-dd") };
            string[] spPName = new[] { "@SCH_DATE" };
            string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
            string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
            DataTable dt = SqlCmd.GetDT("SP_RPT_GENERATION_Q1", encodedParams, encodedPNames, Count = 1, DbNameSch, key, DbserverSchAndLoad);
            //DataTable dt = SqlCmd.GetDT("SP_RPT_GENERATION_Q1",param);
            dt.Columns.Remove("SlNo");


            // Title Rows
            xlWorkSheet.Cells[1, 1] = "KARNATAKA POWER CORPORATION LIMITED";
            var title1 = xlWorkSheet.Range[xlWorkSheet.Cells[1, 1], xlWorkSheet.Cells[1, 24]];
            title1.Merge();
            title1.Font.Bold = true;
            title1.Font.Size = 14;
            title1.HorizontalAlignment = XlHAlign.xlHAlignCenter;

            xlWorkSheet.Cells[2, 1] = "HO - Daily Generation Report";
            var title2 = xlWorkSheet.Range[xlWorkSheet.Cells[2, 1], xlWorkSheet.Cells[2, 24]];
            title2.Merge();
            title2.Font.Bold = true;
            title2.Font.Size = 12;
            title2.HorizontalAlignment = XlHAlign.xlHAlignCenter;

            // Headers
            string[] headers = {
            "Slno", "Project", "Unit MW/Mu", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
            "Daily Gen", "PLF in(%)", "Gross", "Net", "Monthly Genration", "Monthly Target",
            "FY Target", "FY Generation", "Last FY Generation", "WY Gen", "Last WY Gen"
        };

            for (int i = 0; i < headers.Length; i++)
            {
                Range cell = (Range)xlWorkSheet.Cells[3, i + 1];
                cell.Value2 = headers[i];
                cell.Interior.Color = ColorTranslator.ToOle(Color.LightSteelBlue);
                cell.Font.Bold = true;
                cell.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                cell.VerticalAlignment = XlVAlign.xlVAlignCenter;
            }

            // Data rows and totals
            int dataStartRow = 4;
            int colCount = headers.Length;
            decimal[] numerators = new decimal[colCount - 2];
            decimal[] denominators = new decimal[colCount - 2];
            decimal[] valueTotals = new decimal[colCount - 2];

            int rowIndex = dataStartRow;
            foreach (DataRow dr in dt.Rows)
            {

                for (int c = 0; c < dt.Columns.Count; c++)
                {
                    var val = dr[c].ToString().Trim() ?? "";
                    xlWorkSheet.Cells[rowIndex, c + 1] = val;
                    decimal n = 0;
                    if (c >= 2)
                    {
                        if (c == 2 && val.Contains("/"))
                        {
                            var parts = val.Split('/');
                            decimal num, den;
                            if (parts.Length == 2
                                && decimal.TryParse(parts[0], out num)
                                && decimal.TryParse(parts[1], out den))
                            {
                                numerators[c - 2] += num;
                                denominators[c - 2] += den;
                            }
                        }
                        else if (decimal.TryParse(val, out n))
                        {
                            valueTotals[c - 2] += n;
                        }
                    }
                }
                rowIndex++;
            }

            // Totals row
            int totalRow = rowIndex;
            for (int c = 0; c < colCount; c++)
            {
                var cell = (Range)xlWorkSheet.Cells[totalRow, c + 1];
                if (c == 0) cell.Value2 = "";
                else if (c == 1) cell.Value2 = "Total:";
                else if (c == 2) cell.Value2 = numerators[c - 2] + "/" + denominators[c - 2];
                else cell.Value2 = valueTotals[c - 2].ToString("0.000");

                cell.Font.Bold = true;
                cell.Interior.Color = ColorTranslator.ToOle(Color.LightBlue);
            }

            // Summary rows

            rowIndex++;
            var rng1 = xlWorkSheet.Range[xlWorkSheet.Cells[rowIndex, 1], xlWorkSheet.Cells[rowIndex, 24]];
            rng1.Merge();
            rng1.Value2 = "System Peak: 12553 MW   TB Share: 0.2423   1.2386";
            rng1.Font.Bold = true;
            rng1.HorizontalAlignment = XlHAlign.xlHAlignCenter;

            rowIndex++;
            var rng2 = xlWorkSheet.Range[xlWorkSheet.Cells[rowIndex, 1], xlWorkSheet.Cells[rowIndex, 24]];
            rng2.Merge();
            rng2.Value2 = "Max Frequency: 50.12 Hz   Jurala Share: 4.1300   16.5690";
            rng2.Font.Bold = true;
            rng2.HorizontalAlignment = XlHAlign.xlHAlignCenter;

            rowIndex++;
            var rng3 = xlWorkSheet.Range[xlWorkSheet.Cells[rowIndex, 1], xlWorkSheet.Cells[rowIndex, 24]];
            rng3.Merge();
            rng3.Value2 = "Min Frequency: 49.71 Hz   State Import: 134.76000   742.0833";
            rng3.Font.Bold = true;
            rng3.HorizontalAlignment = XlHAlign.xlHAlignCenter;

            rowIndex++;
            var rng4 = xlWorkSheet.Range[xlWorkSheet.Cells[rowIndex, 1], xlWorkSheet.Cells[rowIndex, 24]];
            rng4.Merge();
            rng4.Value2 = "12553   State Consumption: 245.9128   1296.2999";
            rng4.Font.Bold = true;
            rng4.HorizontalAlignment = XlHAlign.xlHAlignCenter;




            xlWorkSheet.Columns.AutoFit();

            // Save Excel to disk and to web folder
            string timestamp = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");
            string compName = "RptGenerations";
            var dir = Path.Combine("D:\\DOWNLOADED RPTGENERATION");
            Directory.CreateDirectory(dir);

            var webDir = HostingEnvironment.MapPath("~/Files/");
            Directory.CreateDirectory(webDir);

            string fileName = compName + "_" + timestamp + ".xlsx";
            string drivePath = Path.Combine(dir, fileName);
            string webPath = Path.Combine(webDir, fileName);

            xlWorkBook.SaveAs(drivePath, XlFileFormat.xlOpenXMLWorkbook);
            xlWorkBook.SaveAs(webPath, XlFileFormat.xlOpenXMLWorkbook);

            xlWorkBook.Close(false, misValue, misValue);
            xlApp.Quit();

            // Return Base64 and filename
            var bytes = File.ReadAllBytes(webPath);
            result[0] = Convert.ToBase64String(bytes);
            result[1] = fileName;

            // Cleanup
            File.Delete(webPath);
            File.Delete(drivePath);

            existingExcels = Process.GetProcessesByName("EXCEL");
            foreach (var proc in existingExcels)
            {
                foundPID = !existingPIDs.Contains(proc.Id);
                if (foundPID)
                {
                    proc.Kill();
                    break;
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
            if (xlWorkSheet != null) Marshal.ReleaseComObject(xlWorkSheet);
            if (xlWorkBook != null) Marshal.ReleaseComObject(xlWorkBook);
            if (xlApp != null) Marshal.ReleaseComObject(xlApp);
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }



}