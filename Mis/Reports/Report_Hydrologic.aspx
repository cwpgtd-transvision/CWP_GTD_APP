<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Report_Hydrologic.aspx.cs" Inherits="Report_Hydrologic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            DataViewRoles();
            $('#txtdate').on('change', function () {
                DataViewRoles();
            });
            $("#btnPDF").on("click", async function () {
                const datepicker = document.getElementById('txtdate');
                await downloadPdf(datepicker.value) 
            });
            document.getElementById('btnexcel').addEventListener('click', async () => {
                const datepicker = document.getElementById('txtdate');
                try {
                    const response = await fetch('/Mis/Reports/Report_Hydrologic.aspx/GenerateExcel', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json; charset=utf-8'
                        },
                        body: JSON.stringify({ date: datepicker.value })
                    });
                    if (!response.ok) {
                        throw new Error(`HTTP error! Status: ${response.status}`);
                    }
                    const data = await response.json();
                    if (data.d[0] === "dataNotFound") {
                        showWarningmessage("No data available to export.");
                        return;
                    }
                    if (data.d && data.d.length === 2) {
                        const base64Data = data.d[0];
                        const fileName = data.d[1];
                        const link = document.createElement('a');
                        link.href = 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,' + base64Data;
                        link.download = fileName;
                        document.body.appendChild(link); // Required for Firefox
                        link.click();
                        link.remove();
                    } else {
                        showWarningmessage("Failed to generate Excel.");
                    }
                } catch (error) {
                    showErrorMessage("Fetch error: " + error.message);
                }
            });
        });
        async function DataViewRoles() {
            const datepicker = document.getElementById('txtdate');
            if (!datepicker || !datepicker.value) {
                showWarningmessage("Please select a valid date.");
                return;
            }
            try {
                const parsedData = await callingbinddata(datepicker.value);
                if (parsedData && parsedData.length > 0) {
                    binddata(parsedData);
                } else {
                    showWarningmessage("No data returned for the selected date.");
                }
            } catch (error) {
                console.error("Error in DataViewRoles:", error);
                showErrorMessage("Something went wrong while fetching data.");
            }
        }
        async function callingbinddata(date) {
            try {
                const response = await fetch('/Mis/Reports/Report_Hydrologic.aspx/GetData', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                    },
                    body: JSON.stringify({ date: date })
                });
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const result = await response.json();
                const parsedData = JSON.parse(result.d);
                console.log("Data received:", parsedData);
                return parsedData;

            } catch (error) {
                console.error("Error in callingbinddata:", error);
                throw error; // Rethrow so it can be handled by caller
            }
        }
        let lastDamLevelData = [];
        async function binddata(data) {
            lastDamLevelData = data; // store for PDF export

            // Destroy previous instance if exists
            if ($.fn.DataTable.isDataTable('#DamLevelTable')) {
                $('#DamLevelTable').DataTable().clear().destroy();
                $('#DamLevelTable thead tr').remove();
                $('#DamLevelTable thead').append('<tr id="DamLevelHeadRow"></tr><tr id="DamLevelHeadRow2"></tr>');
            }

            if (data.length > 0) {
                // ===== Header Rows =====
                $('#DamLevelHeadRow').append('<th rowspan="2" class="table-active">SLNO</th>');
                $('#DamLevelHeadRow').append('<th rowspan="2" class="table-active">Reservoir</th>');
                $('#DamLevelHeadRow').append('<th colspan="3" class="table-active">Present Year : Inflow (MC ft)</th>');
                $('#DamLevelHeadRow').append('<th colspan="3" class="table-active">Last Year: Inflow (MC ft)</th>');
                $('#DamLevelHeadRow').append('<th colspan="3" class="table-active">Present Year: Discharge (MC ft)</th>');
                $('#DamLevelHeadRow').append('<th colspan="3" class="table-active">Last Year: Discharge (MC ft)</th>');
                $('#DamLevelHeadRow').append('<th colspan="2" class="table-active">Inflow in Cusecs</th>');

                $('#DamLevelHeadRow2').append('<th class="table-active">Day</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">Month</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">WY</th>');

                $('#DamLevelHeadRow2').append('<th class="table-active">Day</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">Month</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">WY</th>');

                $('#DamLevelHeadRow2').append('<th class="table-active">Day</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">Month</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">WY</th>');

                $('#DamLevelHeadRow2').append('<th class="table-active">Day</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">Month</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">WY</th>');

                $('#DamLevelHeadRow2').append('<th class="table-active">Day</th>');
                $('#DamLevelHeadRow2').append('<th class="table-active">LY-Day</th>');

                // ===== Data Rows =====
                let tbody = '';
                data.forEach((item, index) => {
                    tbody += `<tr>
                <td>${index + 1}</td>
                <td>${item.STATION_NAME}</td>
                <td>${item.PRESENTDATEINFLOW ?? 0}</td>
                <td>${item.PRESENMONTINFLOW ?? 0}</td>
                <td>${item.PresentYearinflowWY ?? 0}</td>

                <td>${item.PREVIOUSDATEINFLOW ?? 0}</td>
                <td>${item.PREVIOUSMONTINFLOW ?? 0}</td>
                <td>${item.LasrYeainflowrWY ?? 0}</td>

                <td>${item.PRESENTDATEDISCHARGE ?? 0}</td>
                <td>${item.PRESENMONTHDISCHARGE ?? 0}</td>
                <td>${item.PresentYearDischargeYearWY ?? 0}</td>

                <td>${item.PREVIOUSDATEDISCHARGE ?? 0}</td>
                <td>${item.PREVIOUSMONTHDISCHARGE ?? 0}</td>
                <td>${item.LastYearDischargeYearWY ?? 0}</td>

                <td>${item.PRESENTDAYCUSECS?.toFixed(2) ?? 0}</td>
                <td>${item.PREVIOSDAYCUSECS?.toFixed(2) ?? 0}</td>
            </tr>`;
                });

                $('#DamLevelTable tbody').html(tbody);

                // ===== Initialize DataTable =====
                $('#DamLevelTable').DataTable({
                    destroy: true,
                    scrollX: true,
                    scrollY: '400px',
                    scrollCollapse: true,
                    autoWidth: false,
                    responsive: false,
                    paging: false,
                    info: false,
                    fixedHeader: true,
                    language: {
                        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                        searchPlaceholder: 'Type to filter...',
                        lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                        paginate: {
                            'first': 'First',
                            'last': 'Last',
                            'next': document.dir == "rtl" ? '&larr;' : '&rarr;',
                            'previous': document.dir == "rtl" ? '&rarr;' : '&larr;'
                        }
                    },
                    dom: '<"datatable-header"f><"datatable-scroll"tS><"datatable-footer"i>' // Removed B
                });
            }
        }
        async function exportToPDF(data) {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF('l', 'mm', 'a4'); // Landscape for wide table

            doc.setFontSize(14);
            doc.text("Dam Level Report", 14, 10);

            // Complex headers for autoTable
            const head = [
                [
                    { content: "SLNO", rowSpan: 2 },
                    { content: "Reservoir", rowSpan: 2 },
                    { content: "Present Year : Inflow (MC ft)", colSpan: 3 },
                    { content: "Last Year: Inflow (MC ft)", colSpan: 3 },
                    { content: "Present Year: Discharge (MC ft)", colSpan: 3 },
                    { content: "Last Year: Discharge (MC ft)", colSpan: 3 },
                    { content: "Inflow in Cusecs", colSpan: 2 }
                ],
                [
                    "Day", "Month", "Wy",
                    "Day", "Month", "Wy",
                    "Day", "Month", "Wy",
                    "Day", "Month", "Wy",
                    "Day", "LY-Day"
                ]
            ];

            // Table body
            const body = data.map((item, index) => [
                index + 1,
                item.STATION_NAME,
                item.PRESENTDATEINFLOW ?? 0,
                item.PRESENMONTINFLOW ?? 0,
                item.PresentYearinflowWY ?? 0,
                item.PREVIOUSDATEINFLOW ?? 0,
                item.PREVIOUSMONTINFLOW ?? 0,
                item.LasrYeainflowrWY ?? 0,
                item.PRESENTDATEDISCHARGE ?? 0,
                item.PRESENMONTHDISCHARGE ?? 0,
                item.PresentYearDischargeYearWY ?? 0,
                item.PREVIOUSDATEDISCHARGE ?? 0,
                item.PREVIOUSMONTHDISCHARGE ?? 0,
                item.LastYearDischargeYearWY ?? 0,
                (item.PRESENTDAYCUSECS ?? 0).toFixed(2),
                (item.PREVIOSDAYCUSECS ?? 0).toFixed(2)
            ]);

            doc.autoTable({
                head: head,
                body: body,
                startY: 20,
                theme: 'grid',
                styles: { fontSize: 8, cellPadding: 2, valign: 'middle', halign: 'center' },
                headStyles: { fillColor: [1, 41, 112], textColor: 255 },
            });

            doc.save("DamLevelReport.pdf");
        }
        async function downloadPdf(date) {
            try {
                const response = await fetch('/Mis/Reports/Report_Hydrologic.aspx/GeneratePdf', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json; charset=utf-8' },
                    body: JSON.stringify({ date: date })
                });

                const json = await response.json();

                if (!json.d) {
                    showWarningmessage('No PDF data found for the selected date.');
                    return;
                }

                // Clean base64 string
                const base64Pdf = json.d.trim().replace(/\r?\n|\r/g, '');

                console.log('Base64 PDF string:', json.d);
                console.log('Cleaned base64:', base64Pdf);

                function base64ToUint8Array(base64) {
                    const raw = atob(base64);
                    const uint8Array = new Uint8Array(raw.length);
                    for (let i = 0; i < raw.length; i++) {
                        uint8Array[i] = raw.charCodeAt(i);
                    }
                    return uint8Array;
                }

                const pdfData = base64ToUint8Array(base64Pdf);

                const blob = new Blob([pdfData], { type: 'application/pdf' });
                const url = URL.createObjectURL(blob);

                const a = document.createElement('a');
                a.href = url;
                a.download = `DamLevelsReport_${date}.pdf`;
                document.body.appendChild(a);
                a.click();

                setTimeout(() => {
                    document.body.removeChild(a);
                    URL.revokeObjectURL(url);
                }, 100);

            } catch (err) {
                console.error('Error downloading PDF:', err);
                showWarningmessage('Failed to download PDF. See console for details.');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header">
                Hydrologic Data
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <label class="form-label">Date : </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="ph-calendar"></i>
                            </span>
                            <input type="text" id="txtdate" class="form-control datepicker-date-format_default" placeholder="Pick a date">
                        </div>

<%--                        <label>Date</label>
                        <input type="text" id="txtdate" class="form-control datepicker-date-format_default" placeholder="Pick a date" />--%>
                    </div>
                </div>
                <div class="row">
                    <div class="text-end">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="downloadDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="ph-download-simple me-1"></i>
                                Download Report
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="downloadDropdown">
                                <li>
                                    <a href="#" id="btnPDF" class="dropdown-item">
                                        <i class="ph-file-pdf me-1"></i>PDF
                                    </a>
                                </li>
                                <li>
                                    <a href="#" id="btnexcel" class="dropdown-item">
                                        <i class="ph-file-xls me-1"></i>Excel
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <table id="DamLevelTable" class="table table-striped table-bordered">
                    <thead>
                        <tr id="DamLevelHeadRow"></tr>
                        <tr id="DamLevelHeadRow2"></tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

