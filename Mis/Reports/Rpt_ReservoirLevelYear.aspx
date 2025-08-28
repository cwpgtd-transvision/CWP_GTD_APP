<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Rpt_ReservoirLevelYear.aspx.cs" Inherits="ReservoirLevelYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            const datePicker = document.querySelector('.date-picker');
            const datePicker1 = document.querySelector('.date-picker1');
            let fromDatePicker, toDatePicker;
            if (datePicker) {
                fromDatePicker = new Datepicker(datePicker, {
                    container: '.content-inner',
                    buttonClass: 'btn',
                    prevArrow: document.dir == 'rtl' ? '&rarr;' : '&larr;',
                    nextArrow: document.dir == 'rtl' ? '&larr;' : '&rarr;',
                    format: 'dd-mm-yyyy',
                    autohide: true
                });
                fromDatePicker.setDate(new Date());

                datePicker.addEventListener('changeDate', function () {
                    validateDates();
                    triggerLoad();
                });
            }

            if (datePicker1) {
                toDatePicker = new Datepicker(datePicker1, {
                    container: '.content-inner',
                    buttonClass: 'btn',
                    prevArrow: document.dir == 'rtl' ? '&rarr;' : '&larr;',
                    nextArrow: document.dir == 'rtl' ? '&larr;' : '&rarr;',
                    format: 'dd-mm-yyyy',
                    autohide: true
                });
                toDatePicker.setDate(new Date());

                datePicker1.addEventListener('changeDate', function () {
                    validateDates();
                    triggerLoad();
                });
            }

            function validateDates() {
                const fromDate = datePicker.value.split('-').reverse().join('-'); // yyyy-mm-dd
                const toDate = datePicker1.value.split('-').reverse().join('-');   // yyyy-mm-dd

                if (new Date(fromDate) > new Date(toDate)) {
                    showWarningmessage('From date cannot be greater than To date!');
                    // Reset To date to From date
                    datePicker1.value = datePicker.value;
                }
            }
            triggerLoad();
            $('#btnExcel').click(function () {
                var fromDate = $("#txtDate").val();
                var toDate = $("#txttoDate").val();

                if (!fromDate || !toDate) {
                    showWarningmessage("Please select both From Date and To Date.");
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: "/Mis/Reports/Rpt_ReservoirLevelYear.aspx/GenerateReservoirExcel",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ fromDateStr: fromDate, toDateStr: toDate }),
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

            $('#btnPDF').click(function () {
                var fromDate = $("#txtDate").val();
                var toDate = $("#txttoDate").val();

                $.ajax({
                    type: "POST",
                    url: "/Mis/Reports/Rpt_ReservoirLevelYear.aspx/GenerateReservoirPDF",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ fromDate: fromDate, toDate: toDate }),
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
                            link.href = 'data:application/pdf;base64,' + base64Data;
                            link.download = fileName;
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
        });
        function triggerLoad() {
            let fromDate = $("#txtDate").val();
            let toDate = $("#txttoDate").val();
            if (fromDate && toDate) {
                loadReservoirData(fromDate, toDate);
            }
        }
        function loadReservoirData(selectedDate, selectedDate1) {
            $.ajax({
                type: "POST",
                url: "/Mis/Reports/Rpt_ReservoirLevelYear.aspx/GetReservoirData",
                data: JSON.stringify({ selectedDate: selectedDate, selectedDate1: selectedDate1 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var rawData = response.d;
                    var data = JSON.parse(rawData);
                    BindReservoirData(data);
                },
                error: function (xhr, status, error) {
                    showErrorMessage("AJAX Error: " + error);
                }
            });
        }
        function BindReservoirData(data) {
            if (!data || data.length === 0) return;
            // Clear previous table headers
            $('#DamLevelHeadRow').empty();
            $('#DamLevelHeadRow2').empty();

            // Main headers
            $('#DamLevelHeadRow').append('<th rowspan="2">Date</th>');
            const dams = ['LINGANAMAKKI DAM', 'MANI DAM', 'SUPA DAM'];
            const years = ['Present Year', 'Last Year'];

            dams.forEach(dam => {
                years.forEach(year => {
                    $('#DamLevelHeadRow').append(`<th colspan="3">${dam} (${year})</th>`);
                });
            });

            // Sub headers
            for (let i = 0; i < 6; i++) { // 6 dam-year combinations
                $('#DamLevelHeadRow2').append('<th>Level</th><th>%Cap</th><th>Inflow</th>');
            }

            // Define columns mapping
            var columns = [
                { data: 'Date' },

                // LINGANAMAKKI DAM (Present + Last Year)
                { data: 'L_CUR_Level', defaultContent: '' },
                { data: 'L_CUR_Cap', defaultContent: '' },
                { data: 'L_CUR_Inflow', defaultContent: '' },
                { data: 'L_CUR_Level1', defaultContent: '' },
                { data: 'L_CUR_Cap1', defaultContent: '' },
                { data: 'L_CUR_Inflow1', defaultContent: '' },

                // MANI DAM (Present + Last Year)
                { data: 'MANI_CUR_Level', defaultContent: '' },
                { data: 'MANI_CUR_Cap', defaultContent: '' },
                { data: 'MANI_CUR_Inflow', defaultContent: '' },
                { data: 'MANI_Level1', defaultContent: '' },
                { data: 'MANI_Cap1', defaultContent: '' },
                { data: 'MANI_Inflow1', defaultContent: '' },

                // SUPA DAM (Present + Last Year)
                { data: 'S_CUR_Level', defaultContent: '' },
                { data: 'S_CUR_Cap', defaultContent: '' },
                { data: 'S_CUR_Inflow', defaultContent: '' },
                { data: 'SUPA_Level', defaultContent: '' },
                { data: 'SUPA_Cap', defaultContent: '' },
                { data: 'SUPA_Inflow', defaultContent: '' }
            ];

            // Destroy previous table instance if exists
            if ($.fn.DataTable.isDataTable('#DamLevelTable')) {
                $('#DamLevelTable').DataTable().clear().destroy();
            }

            // Initialize DataTable
            $('#DamLevelTable').DataTable({
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
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header">
                <h6 class="mb-0">Reservoir Level details</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3 mb-3"> 
                        <label class="form-label">From Date<span class="text-danger">*</span> : </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="ph-calendar"></i>
                            </span>
                            <input type="text" id="txtDate" class="form-control date-picker" autocomplete="off" placeholder="From date">
                        </div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">To Date<span class="text-danger">*</span> : </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="ph-calendar"></i>
                            </span>
                            <input type="text" id="txttoDate" class="form-control date-picker1" autocomplete="off" placeholder="To date">
                        </div>
                    </div>
                </div>
                <div class="text-end d-flex justify-content-end gap-2">

                    <div class="dropdown">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            Download Report
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <a href="#" id="btnPDF" class="dropdown-item text-danger">
                                <i class="bi bi-file-earmark-pdf-fill me-2"></i>PDF
                            </a>

                            <!-- Excel Link -->
                            <a href="#" id="btnExcel" class="dropdown-item text-success">
                                <i class="bi bi-file-earmark-excel-fill me-2"></i>EXCEL
                            </a>
                        </ul>
                    </div>
                </div>

                -<table id="ReservoirTable" class="table table-striped table-bordered">
                    <thead>
                        <tr id="ReservoirHeadRow"></tr>
                        <tr id="ReservoirHeadRow2"></tr>
                    </thead>
                    <tbody></tbody>
                </table>
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
