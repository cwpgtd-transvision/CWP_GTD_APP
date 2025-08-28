<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Rpt_PLFandPAF.aspx.cs" Inherits="PLFandPAF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function showError(containerId, message) {
            $('#' + containerId).html(`
        <div class="alert alert-danger d-flex align-items-center" role="alert">
          <i class="fas fa-exclamation-triangle me-3"></i>
          <div><strong>Error:</strong> ${message}</div>
        </div>
    `).show();
        }

        $(document).ready(function () {
            const datePicker = document.querySelector('.date-picker');
            const $stationDropdown = $("#stationDropdown");
            const $table = $("#PLFPAFTable");
            const $tableHead = $("#tableHead");
            const $tableBody = $("#tableBody");
            const $loadingIndicator = $("#loadingIndicator");
            const $errorMessage = $("#errorMessage");
            const $pdfButton = $("#exportPdfBtn");
            const $excelButton = $("#exportExcelBtn");

            let selectedDate;

            $("#PLFPAFTable tbody").html("<tr><td colspan='13' class='text-center p-4'>No records found.</td></tr>");
            $table.removeClass("hidden");

            function getTodayDateFormatted() {
                const today = new Date();
                const day = String(today.getDate()).padStart(2, '0');
                const month = String(today.getMonth() + 1).padStart(2, '0');
                const year = today.getFullYear();
                return `${day}-${month}-${year}`;
            }

            if (datePicker) {
                const DateFormat = new Datepicker(datePicker, {
                    container: '.content-inner',
                    buttonClass: 'btn',
                    prevArrow: document.dir == 'rtl' ? '&rarr;' : '&larr;',
                    nextArrow: document.dir == 'rtl' ? '&larr;' : '&rarr;',
                    format: 'dd-mm-yyyy',
                    autohide: true
                });

                selectedDate = getTodayDateFormatted();
                DateFormat.setDate(new Date());
                datePicker.value = selectedDate;

                datePicker.addEventListener('changeDate', function () {
                    selectedDate = $(".date-picker").val();
                      /*generateTableHeaders();*/
                    DataViewRole(selectedDate, $stationDropdown.val());
                });
            }

            $.ajax({
                type: "POST",
                url: "/Mis/Reports/Rpt_PLFandPAF.aspx/GetStations",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $stationDropdown.empty().append('<option value="All">All Stations</option>');
                    if (response.d && Array.isArray(response.d)) {
                        response.d.forEach(station => {
                            $stationDropdown.append(`<option value="${station}">${station}</option>`);
                        });
                    }

                    selectedDate = $(".date-picker").val();
                     /*generateTableHeaders();*/
                    DataViewRole(selectedDate, $stationDropdown.val());
                }
            });

            $stationDropdown.on("change", function () {
                selectedDate = $(".date-picker").val();
               
                DataViewRole(selectedDate, $(this).val());
            });
            function generateTableHeaders() {
               
                if ($("#PLFPAFTable thead").length === 0) {
                    let theadHtml = `
            <thead>
                <tr>
                    <th rowspan="3">Unit Name</th>
                    <th colspan="6">Present FY</th>
                    <th colspan="6">Previous FY</th>
                </tr>
                <tr>
                    <th colspan="2">Daily</th>
                    <th colspan="2">Monthly</th>
                    <th colspan="2">Yearly</th>
                    <th colspan="2">Daily</th>
                    <th colspan="2">Monthly</th>
                    <th colspan="2">Yearly</th>
                </tr>
                <tr>
                    ${'<th>PLF%</th><th>PAF%</th>'.repeat(6)}
                </tr>
            </thead>
            <tbody id='tableBody'></tbody>
        `;
                    $("#PLFPAFTable").html(theadHtml);
                }
            }

            function Bindplfpafdata(data) {
                generateTableHeaders();

                
                if ($.fn.DataTable.isDataTable('#PLFPAFTable')) {
                    $('#PLFPAFTable').DataTable().destroy();
                    $('#PLFPAFTable tbody').empty();
                }

                $('#PLFPAFTable').DataTable({
                    data: data,
                    columns: [
                        { data: 'UnitName' },
                        { data: 'PresentFY_Daily_PLF' },
                        { data: 'PresentFY_Daily_PAF' },
                        { data: 'PresentFY_Monthly_PLF' },
                        { data: 'PresentFY_Monthly_PAF' },
                        { data: 'PresentFY_Yearly_PLF' },
                        { data: 'PresentFY_Yearly_PAF' },
                        { data: 'PreviousFY_Daily_PLF' },
                        { data: 'PreviousFY_Daily_PAF' },
                        { data: 'PreviousFY_Monthly_PLF' },
                        { data: 'PreviousFY_Monthly_PAF' },
                        { data: 'PreviousFY_Yearly_PLF' },
                        { data: 'PreviousFY_Yearly_PAF' }
                    ],
                    scrollX: true,
                    scrollY: '400px',
                    scrollCollapse: true,
                    paging: false,
                    info: false,
                    autoWidth: false,
                    responsive: false,
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



            function DataViewRole(date, station) {
                if (!date) {
                    $errorMessage.text("Please select a date.").show();
                    $table.addClass("hidden");
                     $tableBody.empty();


                    return;
                }

                $errorMessage.hide();
                $table.addClass("hidden");
                $loadingIndicator.show();

                let url, data;

                if (station === "All") {
                    url = "/Mis/Reports/Rpt_PLFandPAF.aspx/GetAllData";
                    data = JSON.stringify({ Date: date });
                } else {
                    url = "/Mis/Reports/Rpt_PLFandPAF.aspx/GetPLFPAFData";
                    data = JSON.stringify({ Date: date, StationName: station });
                }

                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        debugger;
                        $loadingIndicator.hide();
                        $tableBody.empty();


                        const data = response.d;
                        if (data && data.length > 0) {
                            Bindplfpafdata(data);
                        } else {
                            Bindplfpafdata(data);
                            var mes = "No data available for the selected date.";
                            showInfoMessage(mes);
                           
                        }

                        $table.removeClass("hidden");
                    },
                    error: function (xhr, status, error) {
                        $loadingIndicator.hide();
                        $errorMessage.text("Error loading data: " + error).show();
                    }
                });
            }

      

            function downloadPDF(stationName, selectedDate) {
                const $pdfButton = $("#exportPdfBtn");
                $pdfButton.prop('disabled', true).text("Preparing PDF...");

                $.ajax({
                    type: "POST",
                    url: "/Mis/Reports/Rpt_PLFandPAF.aspx/DownloadPDF",
                    data: JSON.stringify({ StationName: stationName, Date: selectedDate }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        const result = response.d;
                        if (result.error) {
                            alert(result.error);
                        } else if (result.message) {
                            alert(result.message);
                        } else if (result.fileData) {
                            const linkSource = `data:application/pdf;base64,${result.fileData}`;
                            const downloadLink = document.createElement("a");
                            const fileName = result.fileName || `PLF_PAF_Report_${stationName}_${selectedDate}.pdf`;

                            downloadLink.href = linkSource;
                            downloadLink.download = fileName;
                            document.body.appendChild(downloadLink);
                            downloadLink.click();
                            document.body.removeChild(downloadLink);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("An error occurred while generating the PDF: " + error);
                    },
                    complete: function () {
                        $pdfButton.prop('disabled', false).text("Export PDF");
                    }
                });
            }
            function downloadExcel(stationName, selectedDate) {
                const $excelButton = $("#exportExcelBtn");
                $excelButton.prop('disabled', true).text("Preparing Excel...");

                $.ajax({
                    type: "POST",
                    url: "/Mis/Reports/Rpt_PLFandPAF.aspx/DownloadExcel",
                    data: JSON.stringify({ StationName: stationName, Date: selectedDate }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        const result = response.d;
                        if (result.error) {
                            alert(result.error);
                        } else if (result.message) {
                            alert(result.message);
                        } else if (result.fileData) {
                            const linkSource = `data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${result.fileData}`;
                            const downloadLink = document.createElement("a");
                            const fileName = result.fileName || `PLF_PAF_Report_${stationName}_${selectedDate}.xlsx`;

                            downloadLink.href = linkSource;
                            downloadLink.download = fileName;
                            document.body.appendChild(downloadLink);
                            downloadLink.click();
                            document.body.removeChild(downloadLink);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("An error occurred while generating the Excel file: " + error);
                    },
                    complete: function () {
                        $excelButton.prop('disabled', false).text("Export Excel");
                    }
                });
            }

            $pdfButton.on("click", function (e) {
                e.preventDefault();
                downloadPDF($stationDropdown.val(), $(".date-picker").val());
            });

            $excelButton.on("click", function (e) {
                e.preventDefault();
                downloadExcel($stationDropdown.val(), $(".date-picker").val());
            });
        });
    </script>


    <script>

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid p-3 bg-gray-100 min-h-screen">
        <div class="card bg-white rounded-lg shadow-lg">
            <div class="card-header p-3 border-b border-gray-200">
                <h6 class="mb-0 text-xl font-semibold text-white-800">PLF AND PAF REPORT</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3 mb-3"> 
                        <label class="form-label">Date<span class="text-danger">*</span> : </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="ph-calendar"></i>
                            </span>
                            <input type="text" id="txtDate" class="form-control date-picker" placeholder="Pick a date">
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Station<span class="text-danger">*</span> : </label>
                        <select id="stationDropdown" class="form-select form-select-sm" aria-label="Select Station">
                        </select>
                    </div>
                    <%--<div class="col-md-6 mb-3 text-end">
                    <button id="btnView" class="btn btn-primary" type="button">
                        <i class="fas fa-eye"></i> View
                    </button>
                </div>--%>
                </div>
                <div class="text-end">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="exportDropdownButton" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="ph-export me-2"></i>Export
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="exportDropdownButton">
                        <li><a class="dropdown-item" href="#" id="exportPdfBtn"><i class="ph-file-pdf me-1"></i>PDF</a></li>
                        <li><a class="dropdown-item" href="#" id="exportExcelBtn"><i class="ph-file-xls me-1"></i>Excel</a></li>
                    </ul>
                </div>
                <div class="overflow-x-auto">
                    <table id="PLFPAFTable" class="table table-striped table-bordered w-full">
                       <%-- <thead id="tableHead" class="bg-gray-200 text-gray-700 uppercase text-sm"></thead>
                        <tbody></tbody>--%>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

