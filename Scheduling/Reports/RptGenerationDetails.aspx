<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="RptGenerationDetails.aspx.cs" Inherits="RptGenerationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            var dValue = $('#txtDate').val();
            getRptData(dValue);
            $('#txtDate').on('changeDate', function (event) {
                var dValue = $('#txtDate').val();
                getRptData(dValue);
            });
            $('#btnPDF').on('click', function (event) {
                var dValue = $('#txtDate').val();
                downloadPdf(dValue);
            });
            $('#btnExcel').on('click', function (event) {
                var dValue = $('#txtDate').val();
                downloadExcelHtml(dValue);
            });
        });
        function getRptData(dValue) {
            $.ajax({
                type: "POST",
                url: "/Scheduling/Reports/RptGenerationDetails.aspx/GetGenerationData",
                data: JSON.stringify({ dValue: dValue }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = JSON.parse(response.d);

                    const colHeaders = [
                        'Slno', 'Project', 'Unit MW/Mu', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                        'Daily Gen', 'PLF in(%)', 'Gross', 'Net', 'Monthly Genration', 'Monthly Target',
                        'FY Target', 'FY Generation', 'Last FY Generation', 'WY Gen', 'Last WY Gen'
                    ];

                    const totalsRow = [];
                    let numeratorSum = 0;
                    let denominatorSum = 0;

                    for (let col = 0; col < colHeaders.length; col++) {
                        if (col === 0) {
                            totalsRow.push('');
                        } else if (col === 1) {
                            totalsRow.push('Total:');
                        } else if (col === 2) {
                            for (let row = 0; row < data.length; row++) {
                                const val = data[row][col];
                                if (typeof val === 'string' && val.includes('/')) {
                                    const parts = val.split('/');
                                    const num = parseFloat(parts[0].trim());
                                    const den = parseFloat(parts[1].trim());
                                    if (!isNaN(num)) numeratorSum += num;
                                    if (!isNaN(den)) denominatorSum += den;
                                }
                            }
                            totalsRow.push(`${numeratorSum.toFixed(2)}/${denominatorSum.toFixed(2)}`);
                        } else {
                            let sum = 0;
                            for (let row = 0; row < data.length; row++) {
                                const val = data[row][col];
                                const num = parseFloat(val);
                                if (!isNaN(num)) sum += num;
                            }
                            totalsRow.push(sum.toFixed(3));
                        }
                    }

                    data.push(totalsRow);

                    const tableId = '#ColumnAndRowFreezeDatatable';
                    const $table = $(tableId);

                    if ($.fn.DataTable.isDataTable($table)) {
                        $table.DataTable().clear().destroy();
                    }

                    // Set table headers
                    let thead = '<tr>';
                    colHeaders.forEach(header => {
                        thead += `<th>${header}</th>`;
                    });
                    thead += '</tr>';
                    $(`${tableId} thead`).html(thead);

                    // Set body rows
                    const rowsHtml = data.map(row =>
                        `<tr>${row.map(cell => `<td>${cell}</td>`).join('')}</tr>`
                    ).join('');
                    $(`${tableId} tbody`).html(rowsHtml);

                    // Initialize DataTable with FixedColumns
                    const dt = $table.DataTable({
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
                        dom: '<"datatable-header"f><"datatable-scroll"tS><"datatable-footer"i>', // Removed B
                        fixedColumns: {
                            leftColumns: 13
                        }
                    });

                    // Fix alignment issues after init
                    setTimeout(() => {
                        dt.columns.adjust();
                        if (dt.fixedColumns) {
                            dt.fixedColumns().relayout();
                        }
                    }, 50);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                    showErrorMessage("AJAX Error: " + error);
                }
            });
        }
        function downloadExcelHtml(dValue) {
            $.ajax({
                type: "POST",
                url: "/Scheduling/Reports/RptGenerationDetails.aspx/DownloadGenerationDataExcelHtml",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ dValue: dValue }),
                dataType: "json",
                success: function (response) {
                    if (response.d[0] === "dataNotFound") {
                        showWarningmessage("No data available to export.");
                        return;
                    }
                    if (response.d && response.d.length === 2) {
                        var base64Data = response.d[0];
                        var fileName = response.d[1];

                        var link = document.createElement('a');
                        link.href = 'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,' + base64Data;
                        link.download = fileName;
                        link.click();
                    } else {
                        showWarningmessage("Failed to generate Excel.");
                    }
                },
                error: function (xhr, status, error) {
                    showErrorMessage("AJAX Error: " + error);
                }
            });
        }
        function downloadPdf(dValue) {
            $.ajax({
                type: "POST",
                url: "/Scheduling/Reports/RptGenerationDetails.aspx/DownloadGenerationDataPdf",
                data: JSON.stringify({ dValue: dValue }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const base64 = response.d;
                    const byteCharacters = atob(base64);
                    const byteNumbers = new Array(byteCharacters.length);
                    for (let i = 0; i < byteCharacters.length; i++) {
                        byteNumbers[i] = byteCharacters.charCodeAt(i);
                    }
                    const byteArray = new Uint8Array(byteNumbers);
                    const blob = new Blob([byteArray], { type: 'application/pdf' });

                    // Trigger download
                    const link = document.createElement('a');
                    link.href = URL.createObjectURL(blob);
                    link.download = 'RptGeneration.pdf';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                },
                error: function (xhr, status, error) {
                    console.error("PDF Download Error:", error);
                    showErrorMessage("AJAX Error: " + error);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header">
                <div class="row justify-content-between align-items-center">
                    <h5 class="mb-0 col-xs-12 col-sm-12 col-lg-8 col-xl-8">Generation Details</h5>
                    <div class="col-xs-12 col-sm-12 col-lg-4 col-xl-4">
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <label>Select Date  <span class="imp">*</span></label>
                        <input type="text" class="form-control datepicker-date-format_default" autocomplete="off" id="txtDate" />
                    </div>
                    <div class="text-end">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="downloadDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                Download Report
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="downloadDropdown">
                                <li>
                                    <a href="#" id="btnPDF" class="dropdown-item text-danger">
                                        <i class="bi bi-file-earmark-pdf-fill me-2"></i>PDF
                                    </a>
                                </li>
                                <li>
                                    <a href="#" id="btnExcel" class="dropdown-item text-success">
                                        <i class="bi bi-file-earmark-excel-fill me-2"></i>EXCEL
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <table id="ColumnAndRowFreezeDatatable" class="table table-striped table-bordered">
                        <thead></thead>
                        <tbody></tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

