using Microsoft.Office.Interop.Excel;
using Microsoft.SqlServer.Server;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing.Printing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DataTable = System.Data.DataTable;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using Workbook = Microsoft.Office.Interop.Excel.Workbook;
using Worksheet = Microsoft.Office.Interop.Excel.Worksheet;
public partial class Report_Hydrologic : System.Web.UI.Page 
{
    static SqlCmd SqlCmds = new SqlCmd();
    static string[] Param = new string[30];
    static int Count = 0;
    static string[] PName = new string[30];
    static string DbserverSchAndLoad = "DB2", DbNameSch = "MIS", key = "123", msg = "", login_user = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetData(string date)
    {
        DataTable finaldt=getdata(date);    
        return JsonConvert.SerializeObject(finaldt);
    }
    static DataTable getdata(string date)
    {
        string inputFormat = "dd-MM-yyyy";
        string outputFormat = "yyyy-MM-dd";
        string date1 = conovrtdate(date, inputFormat, outputFormat);
        Param[0] = date1;
        PName[0] = "@Date";
        string[] spParam = new[] { date1 };
        string[] spPName = new[] { "@Date" };
        string encodedParams = string.Join(",", spParam.Select(HttpUtility.UrlEncode));
        string encodedPNames = string.Join(",", spPName.Select(HttpUtility.UrlEncode));
        string parameters = "{Date:'" + date1  + "'}";
        DataTable dt = SqlCmds.GetDT("sp_gethydroLogicdate_q1", encodedParams, encodedPNames, Count = 1, DbNameSch, key, DbserverSchAndLoad, parameters);
       // DataTable dt = SqlCmd.SelectDataMis("sp_gethydroLogicdate_q1", Param, PName, Count = 1);


        var givenDate = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        var lastYearDate = givenDate.AddYears(-1);
        string lastYearDate1 = lastYearDate.ToString("dd-MM-yyyy");
        DataTable preasentmontdt = presentyeardata(date, dt);
        DataTable previousdata = previousyeardata(lastYearDate1, dt);


        var distinctstn = dt.AsEnumerable()
          .Select(r => r.Field<string>("STATION_NAME"))
          .Distinct()
          .ToList();
        DataTable finaldt = new DataTable();
        finaldt.Columns.Add("STATION_NAME", typeof(string));
        finaldt.Columns.Add("PRESENTDATEINFLOW", typeof(decimal));
        finaldt.Columns.Add("PRESENTDATEDISCHARGE", typeof(decimal));
        finaldt.Columns.Add("PRESENMONTINFLOW", typeof(decimal));
        finaldt.Columns.Add("PRESENMONTHDISCHARGE", typeof(decimal));
        finaldt.Columns.Add("PRESENTDAYCUSECS", typeof(Decimal));
        finaldt.Columns.Add("PREVIOUSDATEINFLOW", typeof(decimal));
        finaldt.Columns.Add("PREVIOUSDATEDISCHARGE", typeof(decimal));
        finaldt.Columns.Add("PREVIOUSMONTINFLOW", typeof(decimal));
        finaldt.Columns.Add("PREVIOUSMONTHDISCHARGE", typeof(decimal));
        finaldt.Columns.Add("PREVIOSDAYCUSECS", typeof(Decimal));

        finaldt.Columns.Add("PresentYearinflowWY", typeof(decimal));
        finaldt.Columns.Add("LasrYeainflowrWY", typeof(decimal));
        finaldt.Columns.Add("PresentYearDischargeYearWY", typeof(decimal));
        finaldt.Columns.Add("LastYearDischargeYearWY", typeof(decimal));
        foreach (string name in distinctstn)
        {
            decimal presentDateInflow = 0;
            decimal presentDateDischarge = 0;
            decimal presentMonthInflow = 0;
            decimal presentMonthDischarge = 0;
            decimal presentDayCusecs = 0;

            decimal previousDateInflow = 0;
            decimal previousDateDischarge = 0;
            decimal previousMonthInflow = 0;
            decimal previousMonthDischarge = 0;
            decimal previousDayCusecs = 0;

            decimal PresentYearinflowWY = 0;
            decimal LasrYeainflowrWY = 0;
            decimal PresentYearDischargeYearWY = 0;
            decimal LastYearDischargeYearWY = 0;
            var presentRow = preasentmontdt.AsEnumerable()
                .FirstOrDefault(r => r.Field<string>("STATION_NAME") == name);
            if (presentRow != null)
            {
                presentDateInflow = presentRow.Field<decimal>("PRESENTDATEINFLOW");
                presentDateDischarge = presentRow.Field<decimal>("PRESENTDATEDISCHARGE");
                presentMonthInflow = presentRow.Field<decimal>("PRESENMONTINFLOW");
                presentMonthDischarge = presentRow.Field<decimal>("PRESENMONTHDISCHARGE");
                presentDayCusecs = presentRow.Field<decimal>("PRESENTDAYCUSECS");
                PresentYearinflowWY = 0;
                PresentYearDischargeYearWY = 0;
            }

            var previousRow = previousdata.AsEnumerable()
                .FirstOrDefault(r => r.Field<string>("STATION_NAME") == name);
            if (previousRow != null)
            {
                previousDateInflow = previousRow.Field<decimal>("PREVIOUSDATEINFLOW");
                previousDateDischarge = previousRow.Field<decimal>("PREVIOUSDATEDISCHARGE");
                previousMonthInflow = previousRow.Field<decimal>("PREVIOUSMONTINFLOW");
                previousMonthDischarge = previousRow.Field<decimal>("PREVIOUSMONTHDISCHARGE");
                previousDayCusecs = previousRow.Field<decimal>("PREVIOSDAYCUSECS");
                LasrYeainflowrWY = 0;
                LastYearDischargeYearWY = 0;
            }

            // Add row to final DataTable
            finaldt.Rows.Add(
                name,
                presentDateInflow,
                presentDateDischarge,
                presentMonthInflow,
                presentMonthDischarge,
                presentDayCusecs,
                previousDateInflow,
                previousDateDischarge,
                previousMonthInflow,
                previousMonthDischarge,
                previousDayCusecs, PresentYearinflowWY, LasrYeainflowrWY, PresentYearDischargeYearWY, LastYearDischargeYearWY
            );
        }
        return finaldt;
    }
    static DataTable presentyeardata(string date, DataTable dt)
    {
        var presentyrli = dt.AsEnumerable()
            .Where(d => d["DATE"].ToString() == date)
            .ToList();
        var givenDate = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        var groupedData_presentmonth = dt.AsEnumerable()
            .Where(d =>
            {
                var currentDate = DateTime.Parse(d["DATE"].ToString());
                return currentDate.Month == givenDate.Month && currentDate.Year == givenDate.Year;
            })
            .GroupBy(d => d.Field<string>("STATION_NAME"))
            .Select(g => new
            {
                STATION_NAME = g.Key,
                INFLOW = g.Sum(x => Convert.ToDecimal(x["INFLOW"])),
                DISCHARGE = g.Sum(x => Convert.ToDecimal(x["DISCHARGE"]))
            })
            .ToList();
        DataTable finaldatatable = new DataTable();
        finaldatatable.Columns.Add("STATION_NAME", typeof(string));
        finaldatatable.Columns.Add("PRESENTDATEINFLOW", typeof(decimal));
        finaldatatable.Columns.Add("PRESENTDATEDISCHARGE", typeof(decimal));
        finaldatatable.Columns.Add("PRESENMONTINFLOW", typeof(decimal));
        finaldatatable.Columns.Add("PRESENMONTHDISCHARGE", typeof(decimal));
        finaldatatable.Columns.Add("PRESENTDAYCUSECS", typeof(Decimal));
        var distinctNames = dt.AsEnumerable()
            .Select(r => r.Field<string>("STATION_NAME"))
            .Distinct()
            .ToList();
        var monthlyDataDict = groupedData_presentmonth.ToDictionary(
            x => x.STATION_NAME,
            x => new { x.INFLOW, x.DISCHARGE }
        );
        foreach (string name in distinctNames)
        {
            decimal dailyInflow = 0;
            decimal dailyDischarge = 0;
            decimal monthlyInflow = 0;
            decimal monthlyDischarge = 0;
            Decimal CUSECSADAY = 0;
            var dailyRow = presentyrli.FirstOrDefault(r => r.Field<string>("STATION_NAME") == name);
            if (dailyRow != null)
            {
                decimal inflow = Convert.ToDecimal(dailyRow["INFLOW"]);
                decimal discharge = Convert.ToDecimal(dailyRow["DISCHARGE"]);
                dailyInflow = inflow;
               dailyDischarge = discharge;
                CUSECSADAY = (inflow * Convert.ToDecimal(Math.Pow(10, 6))) / 86400;
            }
            if (monthlyDataDict.ContainsKey(name))
            {
                monthlyInflow = monthlyDataDict[name].INFLOW;
                monthlyDischarge = monthlyDataDict[name].DISCHARGE;
            }
            finaldatatable.Rows.Add(name, dailyInflow, dailyDischarge, monthlyInflow, monthlyDischarge, CUSECSADAY);
        }

        return finaldatatable; 
    }
    static  DataTable previousyeardata(string date, DataTable dt)
    {
        var PREVIOUSyrli = dt.AsEnumerable()
           .Where(d => d["DATE"].ToString() == date)
           .ToList();
        var givenDate = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.InvariantCulture);
        var groupedData_prviousmonth = dt.AsEnumerable()
            .Where(d =>
            {
                var currentDate = DateTime.Parse(d["DATE"].ToString());
                return currentDate.Month == givenDate.Month && currentDate.Year == givenDate.Year;
            })
            .GroupBy(d => d.Field<string>("STATION_NAME"))
            .Select(g => new
            {
                STATION_NAME = g.Key,
                INFLOW = g.Sum(x => Convert.ToDecimal(x["INFLOW"])),
                DISCHARGE = g.Sum(x => Convert.ToDecimal(x["DISCHARGE"]))
            })
            .ToList();
        DataTable finaldatatable = new DataTable();
        finaldatatable.Columns.Add("STATION_NAME", typeof(string));
        finaldatatable.Columns.Add("PREVIOUSDATEINFLOW", typeof(decimal));
        finaldatatable.Columns.Add("PREVIOUSDATEDISCHARGE", typeof(decimal));
        finaldatatable.Columns.Add("PREVIOUSMONTINFLOW", typeof(decimal));
        finaldatatable.Columns.Add("PREVIOUSMONTHDISCHARGE", typeof(decimal));
        finaldatatable.Columns.Add("PREVIOSDAYCUSECS", typeof(Decimal));
        var distinctNames = dt.AsEnumerable()
            .Select(r => r.Field<string>("STATION_NAME"))
            .Distinct()
            .ToList();
        var monthlyDataDict = groupedData_prviousmonth.ToDictionary(
            x => x.STATION_NAME,
            x => new { x.INFLOW, x.DISCHARGE }
        );
        foreach (string name in distinctNames)
        {
            decimal predailyInflow = 0;
            decimal predailyDischarge = 0;
            decimal premonthlyInflow = 0;
            decimal premonthlyDischarge = 0;
            Decimal preCUSSECSDAY = 0;
            var dailyRow = PREVIOUSyrli.FirstOrDefault(r => r.Field<string>("STATION_NAME") == name);
            if (dailyRow != null)
            {
                decimal inflow = Convert.ToDecimal(dailyRow["INFLOW"]);
                decimal discharge = Convert.ToDecimal(dailyRow["DISCHARGE"]);
                //dailyInflow = dailyRow.Field<decimal>("INFLOW");
                //dailyDischarge = dailyRow.Field<decimal>("DISCHARGE");
                predailyInflow = inflow;
                predailyDischarge = discharge;
                preCUSSECSDAY = (inflow * Convert.ToDecimal(Math.Pow(10, 6))) / 86400;
            }
            if (monthlyDataDict.ContainsKey(name))
            {
                premonthlyInflow = monthlyDataDict[name].INFLOW;
                premonthlyDischarge = monthlyDataDict[name].DISCHARGE;
            }
            finaldatatable.Rows.Add(name, predailyInflow, predailyDischarge, premonthlyInflow, premonthlyDischarge, preCUSSECSDAY);
        }

        return finaldatatable;
    }

    [System.Web.Services.WebMethod(EnableSession = true)]
    public static string[] GenerateExcel(string date)
    {
        string[] result = new string[2]; // [0]=base64, [1]=filename
        object misValue = System.Reflection.Missing.Value;

        Application xlApp = null;
        Workbook xlWorkBook = null;
        Worksheet xlWorkSheet = null;

        try
        {
            DataTable finaldt = getdata(date);
            if (finaldt == null || finaldt.Rows.Count == 0)
            {
                return new string[] { "dataNotFound", "" };
            }

            xlApp = new Application();
            xlApp.DisplayAlerts = false;
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Worksheet)xlWorkBook.Sheets[1];
            xlWorkSheet.Name = "Dam Levels";

            // ===== First Row Headers (merged group headers) =====
            xlWorkSheet.Cells[1, 1] = "SLNO";
            xlWorkSheet.Cells[1, 2] = "Reservoir";

            // Merge and set group headers (3 columns each)
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 3], xlWorkSheet.Cells[1, 5]].Merge();
            xlWorkSheet.Cells[1, 3] = "Present Year: Inflow (MC ft)";
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 6], xlWorkSheet.Cells[1, 8]].Merge();
            xlWorkSheet.Cells[1, 6] = "Last Year: Inflow (MC ft)";
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 9], xlWorkSheet.Cells[1, 11]].Merge();
            xlWorkSheet.Cells[1, 9] = "Present Year: Discharge (MC ft)";
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 12], xlWorkSheet.Cells[1, 14]].Merge();
            xlWorkSheet.Cells[1, 12] = "Last Year: Discharge (MC ft)";
            xlWorkSheet.Range[xlWorkSheet.Cells[1, 15], xlWorkSheet.Cells[1, 16]].Merge();
            xlWorkSheet.Cells[1, 15] = "Inflow in Cusecs";

            // ===== Second Row Sub-Headers =====
            string[] subHeaders = new[]
            {
            "Day", "Month", "WY",     // Present Inflow
            "Day", "Month", "WY",     // Last Inflow
            "Day", "Month", "WY",     // Present Discharge
            "Day", "Month", "WY",     // Last Discharge
            "Day", "LY-Day"           // Cusecs
        };

            for (int i = 0; i < subHeaders.Length; i++)
            {
                xlWorkSheet.Cells[2, i + 3] = subHeaders[i];
            }

            // Format header styles
            Range headerRange = xlWorkSheet.Range["A1", "P2"];
            headerRange.Font.Bold = true;
            headerRange.HorizontalAlignment = XlHAlign.xlHAlignCenter;
            headerRange.VerticalAlignment = XlVAlign.xlVAlignCenter;
            headerRange.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.LightSteelBlue);
            headerRange.Borders.LineStyle = XlLineStyle.xlContinuous;

            // ===== Data Rows =====
            int rowIndex = 3;
            foreach (DataRow dr in finaldt.Rows)
            {
                xlWorkSheet.Cells[rowIndex, 1] = rowIndex - 2; // SLNO
                xlWorkSheet.Cells[rowIndex, 2] = dr["STATION_NAME"].ToString() ?? "";

                xlWorkSheet.Cells[rowIndex, 3] = dr["PRESENTDATEINFLOW"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 4] = dr["PRESENMONTINFLOW"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 5] = dr["PresentYearinflowWY"] ?? 0;

                xlWorkSheet.Cells[rowIndex, 6] = dr["PREVIOUSDATEINFLOW"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 7] = dr["PREVIOUSMONTINFLOW"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 8] = dr["LasrYeainflowrWY"] ?? 0;

                xlWorkSheet.Cells[rowIndex, 9] = dr["PRESENTDATEDISCHARGE"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 10] = dr["PRESENMONTHDISCHARGE"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 11] = dr["PresentYearDischargeYearWY"] ?? 0;

                xlWorkSheet.Cells[rowIndex, 12] = dr["PREVIOUSDATEDISCHARGE"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 13] = dr["PREVIOUSMONTHDISCHARGE"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 14] = dr["LastYearDischargeYearWY"] ?? 0;

                xlWorkSheet.Cells[rowIndex, 15] = dr["PRESENTDAYCUSECS"] ?? 0;
                xlWorkSheet.Cells[rowIndex, 16] = dr["PREVIOSDAYCUSECS"] ?? 0;

                rowIndex++;
            }

            // Auto fit columns
            xlWorkSheet.Columns.AutoFit();

            // ===== Save and Return Base64 =====
            string datetime = DateTime.Now.ToString("yyyy_MM_dd_HH_mm_ss");
            string compname = "DamLevelsReport";
            string webDir = HostingEnvironment.MapPath("~/Files/");
            if (!Directory.Exists(webDir))
                Directory.CreateDirectory(webDir);

            string fileName = compname + "-" + datetime + ".xlsx";
            string filePath = Path.Combine(webDir, fileName);

            xlWorkBook.SaveAs(filePath,
                XlFileFormat.xlOpenXMLWorkbook,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                XlSaveAsAccessMode.xlNoChange,
                XlSaveConflictResolution.xlLocalSessionChanges,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing);

            xlWorkBook.Close(false, misValue, misValue);
            xlApp.Quit();

            // Convert to Base64
            byte[] bytes = File.ReadAllBytes(filePath);
            result[0] = Convert.ToBase64String(bytes);
            result[1] = fileName;

            // Clean up file
            File.Delete(filePath);

            return result;
        }
        catch (Exception ex)
        {
            throw new Exception("Server Error: " + ex.Message);
        }
        finally
        {
            bool foundPID;
            Process[] existingExcels = Process.GetProcessesByName("excel");
            existingExcels = Process.GetProcessesByName("excel");
            int tmpX = 0;
            int ourPID = 0;
            int[] existingPIDs = new int[1000]; // Consider using a List<int> for dynamic size if needed
            //Process[] existingExcels = Process.GetProcessesByName("excel");
            foreach (Process proc in existingExcels)
            {
                existingPIDs[tmpX++] = proc.Id;
            }
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
    [WebMethod(EnableSession = true)]
    public static string GeneratePdf(string date)
    {
        DataTable finaldt = getdata(date);
        if (finaldt == null || finaldt.Rows.Count == 0)
            return null;

        using (MemoryStream ms = new MemoryStream())
        {
            Document document = new Document(PageSize.A4.Rotate(), 20, 20, 40, 20);
            PdfWriter.GetInstance(document, ms);
            document.Open();

            var headerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10);
            var cellFont = FontFactory.GetFont(FontFactory.HELVETICA, 9);



            Paragraph header = new Paragraph(" Hydrologic Data", FontFactory.GetFont("Arial", 16, iTextSharp.text.Font.BOLD));
            header.Alignment = Element.ALIGN_CENTER;
           


            PdfPTable table = new PdfPTable(16) { WidthPercentage = 100f };
            float[] widths = { 3, 8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 };
            table.SetWidths(widths);

            // --- First Header Row ---
            table.AddCell(new PdfPCell(new Phrase("SLNO", headerFont))
            {
                Rowspan = 2,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor= BaseColor.LIGHT_GRAY
            });

            table.AddCell(new PdfPCell(new Phrase("Reservoir", headerFont))
            {
                Rowspan = 2,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor = BaseColor.LIGHT_GRAY
            });

            table.AddCell(new PdfPCell(new Phrase("Present Year: Inflow (MC ft)", headerFont))
            {
                Colspan = 3,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor = BaseColor.LIGHT_GRAY
            });

            table.AddCell(new PdfPCell(new Phrase("Last Year: Inflow (MC ft)", headerFont))
            {
                Colspan = 3,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor = BaseColor.LIGHT_GRAY
            });

            table.AddCell(new PdfPCell(new Phrase("Present Year: Discharge (MC ft)", headerFont))
            {
                Colspan = 3,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor = BaseColor.LIGHT_GRAY
            });

            table.AddCell(new PdfPCell(new Phrase("Last Year: Discharge (MC ft)", headerFont))
            {
                Colspan = 3,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor = BaseColor.LIGHT_GRAY
            });

            table.AddCell(new PdfPCell(new Phrase("Inflow in Cusecs", headerFont))
            {
                Colspan = 2,
                HorizontalAlignment = Element.ALIGN_CENTER,
                VerticalAlignment = Element.ALIGN_MIDDLE,
                BackgroundColor = BaseColor.LIGHT_GRAY
            });

            // --- Second Header Row ---
            string[] subHeaders = {
            "Day", "Month", "WY",
            "Day", "Month", "WY",
            "Day", "Month", "WY",
            "Day", "Month", "WY",
            "Day", "LY-Day"
        };

            foreach (string hdr in subHeaders)
            {
                table.AddCell(new PdfPCell(new Phrase(hdr, headerFont))
                {
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    VerticalAlignment = Element.ALIGN_MIDDLE,
                    BackgroundColor = BaseColor.LIGHT_GRAY
                });
            }

            // --- Data Rows ---
            int rowIndex = 1;
            foreach (DataRow dr in finaldt.Rows)
            {
                table.AddCell(new Phrase(rowIndex.ToString(), cellFont));
                table.AddCell(new Phrase(dr["STATION_NAME"].ToString() ?? "", cellFont));

                string[] keys = {
                "PRESENTDATEINFLOW", "PRESENMONTINFLOW", "PresentYearinflowWY",
                "PREVIOUSDATEINFLOW", "PREVIOUSMONTINFLOW", "LasrYeainflowrWY",
                "PRESENTDATEDISCHARGE", "PRESENMONTHDISCHARGE", "PresentYearDischargeYearWY",
                "PREVIOUSDATEDISCHARGE", "PREVIOUSMONTHDISCHARGE", "LastYearDischargeYearWY",
                "PRESENTDAYCUSECS", "PREVIOSDAYCUSECS"
            };

                foreach (var key in keys)
                {
                    string value = dr.Table.Columns.Contains(key) && dr[key] != DBNull.Value
                        ? dr[key].ToString()
                        : "0";

                    table.AddCell(new Phrase(value, cellFont));
                }

                rowIndex++;
            }
            document.Add(header);
            document.Add(new Paragraph("\n"));
            document.Add(table);
            document.Close();

            // Return PDF as base64 string
            byte[] pdfBytes = ms.ToArray();
            return Convert.ToBase64String(pdfBytes);
        }
    }
    static string conovrtdate(string date,string inputFormat, string outputFormat)
    {
        DateTime parsedDate = DateTime.ParseExact(date, inputFormat, CultureInfo.InvariantCulture);
       return parsedDate.ToString(outputFormat);
    }
}