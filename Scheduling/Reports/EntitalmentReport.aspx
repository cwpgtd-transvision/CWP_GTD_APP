<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="EntitalmentReport.aspx.cs" Inherits="EntitalmentReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(function () {
            var OnbarOffbarBool = "";
            BindBuyer();
            BindSeller();
            BindRevisions();
            $('#ddlSeller').on('change', function () {
                BindSellerUnits();
                BindRevisions();
                $("#divTable").hide();
            });
            $('#btnShow').on('click', function () {
                $("#divTable").hide();
                BindData();
                // 
            });
            $('#scheduleDate').on('change', function () {
                $("#divTable").hide();
                BindSeller();
                BindRevisions();
                //   alert();
            });
            //$('#SwitchOnbarOffbar').on('change', function () {
            //$("#divTable").hide();
            //    OnbarOffbarBool = $(this).prop('checked') ? true : false;
            //   // alert(OnbarOffbarBool);
            //});
        });
        function BindData() {
            var date = $('#scheduleDate').val();
            OnbarOffbarBool = $('#SwitchOnbarOffbar').prop('checked') ? true : false;
            //alert(OnbarOffbarBool);
            //return;
            var Genid = $('#ddlSeller').val();
            var Buyerid = $('#ddlBuyer').val();
            var GenUnitid = $('#ddlSellerUnits').val();
            var Revision = $('#ddlRevision').val();
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=uts-8',
                url: '/Scheduling/Reports/EntitalmentReport.aspx/BindData',
                data: JSON.stringify({ date: date, Buyerid: Buyerid, Genid: Genid, GenUnitid: GenUnitid, Revision: Revision, OnbarOffbarBool: OnbarOffbarBool }),
                async: true,
                success: function (data, textStatus, jqXHR) {

                    if (data.d != "") {
                        BindDataTable(data.d);
                        $("#divTable").show();
                    } else if (data.d == "") {
                        alert("No Does Not Exist...!");
                        $("#divTable").hide();
                    }
                },
                error(jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus);
                    $("#divTable").hide();
                }
            });

        }
        function BindDataTable(data) {

            const container = document.querySelector('#DivTableData');
            // Destroy existing table if it exists

            var hot1 = new Handsontable(document.getElementById('DivTableData'));
            hot1.destroy();
            const hot = new Handsontable(container, {
                data: data.slice(1), // remove first row from data (we'll use it as header)
                colHeaders: data[0], // first row becomes the column header
                //fixedRowsTop: 1,     // freeze the top row
                height: 410,         // FIXED height
                width: '100%',
                fixedColumnsLeft: 2,
                filters: true,
                //dropdownMenu: ['filter_by_condition', 'filter_by_value', 'filter_action_bar'],
                contextMenu: false,
                //rowHeaders: true,
                licenseKey: 'non-commercial-and-evaluation',
                stretchH: 'all',
                cells: function (row, col, TH) {
                    const cellProperties = {
                        readOnly: true,
                        border: true
                    };
                    //if (col < 2) { // only first 2 fixed columns
                    //    cellProperties.renderer = function (instance, td, row, col, prop, value, cellProps) {
                    //        Handsontable.renderers.TextRenderer.apply(this, arguments);
                    //        td.style.backgroundColor = '#e4ecf7'; // light blue-ish smokewhite
                    //        td.style.color = '#000000'; // text color black
                    //        td.style.fontWeight = '600'; // semi-bold
                    //    };
                    //}
                    return cellProperties;
                },
                afterGetColHeader: function (col, TH) {
                    TH.style.backgroundColor = '#e4ecf7';
                    TH.style.color = '#000000';
                    TH.style.fontWeight = '600';
                    TH.style.fontSize = "14px";
                }
            });

            // Export to Excel
            // Export to Excel with borders and header styling
            $('#exportExcel6').click(async function () {
                const headers = hot.getColHeader();
                const data = hot.getData();

                const workbook = new ExcelJS.Workbook();
                const worksheet = workbook.addWorksheet("User Report");

                // Title row
                const title = worksheet.addRow(["User Account Report"]);
                title.font = { size: 16, bold: true };
                worksheet.mergeCells('A1:I1');
                worksheet.getCell('A1').alignment = { horizontal: 'center' };

                worksheet.addRow([]); // empty row

                // Header row
                const headerRow = worksheet.addRow(headers);
                headerRow.eachCell(cell => {
                    cell.font = { bold: true };
                    cell.fill = {
                        type: 'pattern',
                        pattern: 'solid',
                        fgColor: { argb: 'DCE6F1' }
                    };
                    cell.border = {
                        top: { style: 'thin' },
                        left: { style: 'thin' },
                        bottom: { style: 'thin' },
                        right: { style: 'thin' }
                    };
                    cell.alignment = { vertical: 'middle', horizontal: 'center' };
                });

                // Data rows
                data.forEach(rowData => {
                    const row = worksheet.addRow(rowData);
                    row.eachCell(cell => {
                        cell.border = {
                            top: { style: 'thin' },
                            left: { style: 'thin' },
                            bottom: { style: 'thin' },
                            right: { style: 'thin' }
                        };
                    });
                });

                // Auto-width columns
                worksheet.columns.forEach(col => {
                    let maxLength = 10;
                    col.eachCell({ includeEmpty: true }, cell => {
                        const val = cell.value ? cell.value.toString() : '';
                        maxLength = Math.max(maxLength, val.length);
                    });
                    col.width = maxLength + 2;
                });

                // Save file
                const buffer = await workbook.xlsx.writeBuffer();
                const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
                saveAs(blob, "HandsontableData_Bordered.xlsx");
            });
            // Export to CSV
            $('#exportCsv6').click(function () {
                const headers = hot.getColHeader();
                const exportData = hot.getData();
                const fullData = [headers, ...exportData];
                const ws = XLSX.utils.aoa_to_sheet(fullData);
                const csv = XLSX.utils.sheet_to_csv(ws);
                const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
                saveAs(blob, 'HandsontableData.csv');
            });

            // Export to PDF with header background and table borders
            $('#exportPdf6').click(function () {
                const headers = ['Sl.No', ...hot.getColHeader()];
                const exportData = hot.getData().map((row, index) => [index + 1, ...row]);

                const { jsPDF } = window.jspdf;
                const doc = new jsPDF('l', 'mm', 'a4'); // Landscape A4

                const pageWidth = doc.internal.pageSize.getWidth();
                const pageHeight = doc.internal.pageSize.getHeight();
                const margin = 10;
                const colPadding = 1.5;
                const fontSize = 10;
                const rowLineHeight = fontSize * 0.35 + 1.5;

                doc.setFontSize(fontSize);
                doc.setFont('helvetica', 'normal');

                const fullData = [headers, ...exportData];
                const colCount = headers.length;

                // Step 1: Calculate max width per column
                const colWidths = Array(colCount).fill(0);
                for (let c = 0; c < colCount; c++) {
                    for (let r = 0; r < fullData.length; r++) {
                        const cellText = String(fullData[r][c] ?? '');
                        const cellLines = doc.splitTextToSize(cellText, 1000); // large limit
                        const maxLine = Math.max(...cellLines.map(line => doc.getTextWidth(line)));
                        if (maxLine + 2 * colPadding > colWidths[c]) {
                            colWidths[c] = maxLine + 2 * colPadding;
                        }
                    }
                }

                // Step 2: Normalize widths to fit page
                const totalWidth = colWidths.reduce((sum, w) => sum + w, 0);
                const scale = (pageWidth - 2 * margin) / totalWidth;
                const scaledColWidths = colWidths.map(w => w * scale);

                let y = 20;

                function formatDateTime(date) {
                    const pad = n => n.toString().padStart(2, '0');
                    const dd = pad(date.getDate());
                    const MM = pad(date.getMonth() + 1);
                    const yyyy = date.getFullYear();
                    const hh = date.getHours();
                    const mm = pad(date.getMinutes());
                    const ss = pad(date.getSeconds());
                    const ampm = hh >= 12 ? 'PM' : 'AM';
                    const hh12 = pad(hh % 12 === 0 ? 12 : hh % 12);
                    return `${dd}-${MM}-${yyyy} ${hh12}:${mm}:${ss} ${ampm}`;
                }

                function drawTitle() {
                    doc.setFont('helvetica', 'bold');
                    doc.setFontSize(16);
                    doc.setTextColor(0);
                    doc.text('User Account Report', pageWidth / 2, 12, { align: 'center' });
                    doc.setFontSize(fontSize);
                }

                const centerAlignedColumns = ['Sl.No', 'Age', 'Active', 'Login date', 'Login time'];

                function drawHeaderRow(startY) {
                    let x = margin;
                    let maxHeight = 0;

                    const headerLines = headers.map((header, i) =>
                        doc.splitTextToSize(header, scaledColWidths[i] - 2 * colPadding)
                    );

                    headerLines.forEach(lines => {
                        const height = lines.length * rowLineHeight + 2 * colPadding;
                        if (height > maxHeight) maxHeight = height;
                    });

                    headers.forEach((header, i) => {
                        const lines = headerLines[i];
                        const cellWidth = scaledColWidths[i];

                        doc.setFillColor(220, 230, 241); // Light blue
                        doc.setDrawColor(0);
                        doc.setTextColor(0);
                        doc.setFont('helvetica', 'normal'); // no bold

                        doc.rect(x, startY, cellWidth, maxHeight, 'FD');

                        const verticalOffset = (maxHeight - lines.length * rowLineHeight) / 2;

                        lines.forEach((line, j) => {
                            const textY = startY + verticalOffset + (j + 1) * rowLineHeight - 1;
                            const textX = x + cellWidth / 2;
                            doc.text(line, textX, textY, { align: 'center' });
                        });

                        x += cellWidth;
                    });

                    return startY + maxHeight;
                }

                drawTitle();
                y = drawHeaderRow(y);

                exportData.forEach(row => {
                    let x = margin;

                    const cellHeights = row.map((cell, i) => {
                        const text = String(cell ?? '');
                        const lines = doc.splitTextToSize(text, scaledColWidths[i] - 2 * colPadding);
                        return lines.length * rowLineHeight + 2 * colPadding;
                    });

                    const maxCellHeight = Math.max(...cellHeights);

                    if (y + maxCellHeight > pageHeight - 20) {
                        doc.addPage();
                        y = 20;
                        drawTitle();
                        y = drawHeaderRow(y);
                    }

                    row.forEach((cell, i) => {
                        const text = String(cell ?? '');
                        const lines = doc.splitTextToSize(text, scaledColWidths[i] - 2 * colPadding);
                        const cellX = x;
                        const cellY = y;

                        doc.setFont('helvetica', 'normal');
                        doc.setTextColor(0);
                        doc.rect(cellX, cellY, scaledColWidths[i], maxCellHeight);

                        const verticalOffset = (maxCellHeight - lines.length * rowLineHeight) / 2;

                        lines.forEach((line, j) => {
                            const textY = cellY + verticalOffset + (j + 1) * rowLineHeight - 1;

                            if (centerAlignedColumns.includes(headers[i])) {
                                const textX = cellX + scaledColWidths[i] / 2;
                                doc.text(line, textX, textY, { align: 'center' });
                            } else {
                                doc.text(line, cellX + colPadding, textY);
                            }
                        });

                        x += scaledColWidths[i];
                    });

                    y += maxCellHeight;
                });

                doc.setFontSize(10);
                doc.setFont('helvetica', 'normal');
                doc.setTextColor(0);
                doc.text(`Generated on: ${formatDateTime(new Date())}`, margin, pageHeight - 10);

                doc.save('HandsontableData_AutoWidth.pdf');
            });
        }
        function BindBuyer() {
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=uts-8',
                url: '/Scheduling/Reports/EntitalmentReport.aspx/BindBuyer',
                data: JSON.stringify({}),
                async: true,
                success: function (data, textStatus, jqXHR) {
                    $("#ddlBuyer").empty();
                    $("#ddlBuyer").append($("<option value=0 selected='selected'>All</option>"));
                    $("#ddlBuyer.chosen-select").trigger("chosen:updated");
                    if (data.d != "") {
                        $.each(data.d, function (key, value) {
                            $('#ddlBuyer').append($("<option value=" + value.BuyerId + " selected='selected'>" + value.BuyerName + "</option>"));
                        });
                        $('#ddlBuyer').val("0");
                        $('#ddlBuyer.chosen-select').val($("#ddlBuyer option:first").val()).trigger("chosen:updated");
                    }
                },
                error(jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus);
                }
            });
        }
        function BindSeller() {
            var date = $('#scheduleDate').val();
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/Scheduling/Reports/EntitalmentReport.aspx/BindSeller',
                data: JSON.stringify({ date: date }),
                async: true,
                success: function (data, textStatus, jqXHR) {
                    $('#ddlSeller').empty();
                    $('#ddlSeller').append($("<option value=0 selected='selected'>All</option>"));
                    $('#ddlSeller.chosen-select').trigger("chosen:updated");
                    if (data.d != "") {
                        $.each(data.d, function (key, value) {
                            $('#ddlSeller').append($("<option value=" + value.GenId + " selected='selected'>" + value.GenName + "</option>"));
                        });
                        $('#ddlSeller').val("0");
                        $('#ddlSeller.chosen-select').val($("#ddlSeller option:first").val()).trigger("chosen:updated");

                    }
                    else {

                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus);
                }
            });
        }
        function BindSellerUnits() {
            var Genid = $('#ddlSeller').val();
            if (Genid == "" || Genid == null || Genid == "0") {
                $('#ddlSellerUnits').empty();
                $('#ddlSellerUnits').append($("<option value=0 selected='selected'>All</option>"));
                return;
            }
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/Scheduling/Reports/EntitalmentReport.aspx/BindSellerUnits',
                data: JSON.stringify({ Genid: Genid }),
                async: true,
                success: function (data, textStatus, jqXHR) {
                    $('#ddlSellerUnits').empty();
                    $('#ddlSellerUnits').append($("<option value=0 selected='selected'>All</option>"));
                    $('#ddlSellerUnits.chosen-select').trigger("chosen:updated");
                    if (data.d != "") {
                        $.each(data.d, function (key, value) {
                            $('#ddlSellerUnits').append($("<option value=" + value.unitId + " selected='selected'>" + value.unitName + "</option>"));
                        });
                        $('#ddlSellerUnits').val("0");
                        $('#ddlSellerUnits.chosen-select').val($("#ddlSellerUnits option:first").val()).trigger("chosen:updated");

                    }
                    else {

                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus);
                }
            });
        }
        function BindRevisions() {
            var date = $('#scheduleDate').val();
            var Genid = $('#ddlSeller').val();
            if (Genid == null && Genid == "") {
                alert("No Data...!");
                return
            }
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/Scheduling/Reports/EntitalmentReport.aspx/BindRevisions',
                data: JSON.stringify({ date: date, Genid, Genid }),
                async: true,
                success: function (data, textStatus, jqXHR) {
                    $('#ddlRevision').empty();
                    $('#ddlRevision.chosen-select').trigger("chosen:updated");
                    if (data.d != "") {
                        $.each(data.d, function (key, value) {
                            $('#ddlRevision').append($("<option value=" + value.Revisions + " selected='selected'>" + value.Revisions + "</option>"));
                        });
                        $('#ddlRevision.chosen-select').val($("#ddlRevision option:first").val()).trigger("chosen:updated");

                    }
                    else {
                        $('#ddlRevision').append($("<option value=-1 selected='selected'>-1</option>"));
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="card mt-2">
            <div class="card-header card-hearder-custom d-flex align-items-center py-0">
                <h6 class="mb-0 py-2">Entitalment Report</h6>
                
         <div class="ms-auto my-auto d-inline-flex align-items-center gap-3">
    View Type:
    <label class="custom-switch mb-0">
        <input type="checkbox" id="togBtn">
        <div class="slider round">
            <span class="on">Buyers</span>
            <span class="off">Sellers</span>
        </div>
    </label>

    <label class="form-check form-switch form-check-reverse mb-0">
        <input type="checkbox" id="SwitchOnbarOffbar" class="form-check-input">
        <span class="form-check-label">OnBar/OffBar :</span>
    </label>
</div>

            </div>
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-md-3">
                        <label class="form-label">Date<span class="text-danger">*</span> : </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="ph-calendar"></i>
                            </span>
                            <input type="text" id="scheduleDate" class="form-control datepicker-date-format_default" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Buyer<span class="text-danger">*</span> :  </label>
                        <div class="input-group">
                            <select id="ddlBuyer" class="form-select select">
                                <option value="0">All</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Seller<span class="text-danger">*</span> :  </label>
                        <div class="input-group">
                            <select id="ddlSeller" class="form-select select">
                                <option value="0">All</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Units<span class="text-danger">*</span> :  </label>
                        <div class="input-group">
                            <select id="ddlSellerUnits" class="form-select select">
                                <option value="0">All</option>
                            </select>
                        </div>
                    </div>
                    </div>
                <div class="row mb-2">
                    <div class="col-md-3">
                        <label class="form-label">Revision<span class="text-danger">*</span> :  </label>
                        <div class="input-group">
                            <select id="ddlRevision" class="form-select select">
                                <option value="-1">-1</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6 text-end mt-4">

                        <button id="btnShow" class="btn btn-primary" type="button">Show Data</button>
                    </div>

                </div>
                <%--    <div class="row">
                    
                </div>--%>

                <div class="row p-0">
                    <div id="divTable" class="table-responsive">
                        <div id="DivTableData"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

