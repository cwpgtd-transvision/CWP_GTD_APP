<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Rpt_DamLevel.aspx.cs" Inherits="Rpt_DamLevel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(function () {
            debugger;
            DataViewRoles();
            $('#scheduleDate').on('change', function () {
                alert();
                DataViewRoles();
            });
            $('#btnpdf').click(function () {
                var selectedDate = $("#scheduleDate").val();

                $.ajax({
                    type: "POST",
                    url: "/Mis/Reports/Rpt_DamLevel.aspx/GeneratePDF",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ date: selectedDate }),
                    dataType: "json",
                    success: function (response) {
                        if (response.d === 'dataNotFound') {
                            showWarningmessage("No data available to export.");
                            return;
                        }
                        if (response.d) {
                            var link = document.createElement('a');
                            link.href = 'data:application/pdf;base64,' + response.d;
                            link.download = 'DamLevelsReport_' + new Date().toISOString().slice(0, 19).replace(/:/g, "-") + '_.pdf';
                            link.click();
                        } else {
                            showWarningmessage("Failed to generate PDF.");
                        }
                    },
                    error: function (xhr, status, error) {
                        showErrorMessage("AJAX Error: " + error);
                    }
                });
            });
            $('#btnexcel').click(function () {
                var selectedDate = $("#scheduleDate").val();
                $.ajax({
                    type: "POST",
                    url: "/Mis/Reports/Rpt_DamLevel.aspx/GenerateExcel",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ date: selectedDate }),
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
            });
        });
        function DataViewRoles() {
            var date = $("#scheduleDate").val();
            $.ajax({
                type: "POST",
                url: "/Mis/Reports/Rpt_DamLevel.aspx/BindReservoirData",
                data: JSON.stringify({ date: date }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var rawData = response.d;
                    if (response.d != "" && response.d != "No data found") {
                        var data = JSON.parse(rawData);
                        BindReservoirData(data);
                    } else if (response.d == "No data found") {
                        alert("No Does Not Exist...!");
                    }
                },
                error: function (xhr, status, error) {
                    showErrorMessage("AJAX Error: " + error);
                }
            });
        }
        function BindReservoirData(data) {
            if ($.fn.DataTable.isDataTable('#DamLevelTable')) {
                $('#DamLevelTable').DataTable().clear().destroy();
                $('#DamLevelTable thead tr').empty();
            }
            if (data.length > 0) {
                // First row (group headers)
                $('#DamLevelHeadRow').append('<th rowspan="2">SLNO</th>');
                $('#DamLevelHeadRow').append('<th rowspan="2">Reservoir</th>');
                $('#DamLevelHeadRow').append('<th rowspan="2">Gross Capacity (MCft)</th>');
                $('#DamLevelHeadRow').append('<th rowspan="2">Live Capacity (MCft)</th>');
                $('#DamLevelHeadRow').append('<th rowspan="2">FRL</th>');
                $('#DamLevelHeadRow').append('<th rowspan="2">MDDL</th>');
                $('#DamLevelHeadRow').append('<th colspan="4">Present Year : Capacity</th>');
                $('#DamLevelHeadRow').append('<th colspan="4">Last Year : Capacity</th>');

                // Second row (sub-headers)
                $('#DamLevelHeadRow2').append('<th>Level</th>');
                $('#DamLevelHeadRow2').append('<th>Cap(MCft)</th>');
                $('#DamLevelHeadRow2').append('<th>Cap(%)</th>');
                $('#DamLevelHeadRow2').append('<th>Eq.Energy(MU)</th>');
                $('#DamLevelHeadRow2').append('<th>Level</th>');
                $('#DamLevelHeadRow2').append('<th>Cap(MCft)</th>');
                $('#DamLevelHeadRow2').append('<th>Cap(%)</th>');
                $('#DamLevelHeadRow2').append('<th>Eq.Energy(MU)</th>');

                var columns = [
                    {
                        data: null,
                        title: 'SlNo',
                        render: function (data, type, row, meta) {
                            return meta.row + 1;
                        }
                    },
                    { data: 'GENSTN' },
                    { data: 'GROSS_CAPACITY_C' },
                    { data: 'LIVE_CAPACITY_C' },
                    { data: 'FULLRESERVOIRLEVEL_C' },
                    { data: 'MINIMUMDRAWDOWNLEVEL_C' },
                    { data: 'LEVEL_C' },
                    { data: 'MINCAPACITY_C' },
                    { data: 'CAPACITY_C' },
                    { data: 'percentage_to_calculate_mu_C' },
                    { data: 'LEVEL_P' },
                    { data: 'MINCAPACITY_P' },
                    { data: 'CAPACITY_P' },
                    { data: 'percentage_to_calculate_mu_P' },
                ];
                var col = columns.length;
                var table = $('#DamLevelTable').DataTable({
                    data: data,
                    columns: columns,
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header">
                <h6 class="mb-0">Dam level details</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <label class="form-label">Date<span class="text-danger">*</span> : </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="ph-calendar"></i>
                            </span>
                            <input type="text" id="scheduleDate" class="form-control datepicker-date-format_default" />
                        </div>
                    </div>
                </div> 
                <div class="text-end">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="downloadDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Download Report
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="downloadDropdown">
                            <li>
                                <a href="#" id="btnpdf" class="dropdown-item">
                                    <i class="ph-file-pdf me-1"></i>PDF
                                </a>
                            </li>
                            <li>
                                <a href="#" id="btnexcel" class="dropdown-item">
                                    <i class="ph-file-xls me-1"></i>EXCEL
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <table id="DamLevelTable" class="table table-striped table-bordered">
                    <thead class="bg-info text-white">
                        <tr id="DamLevelHeadRow"></tr>
                        <tr id="DamLevelHeadRow2"></tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

