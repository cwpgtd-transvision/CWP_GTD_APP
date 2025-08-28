<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Report_Log.aspx.cs" Inherits="Report_Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {
            loadRole();
        });

        function loadRole() {
            $.ajax({
                type: "POST",
                url: "Report_Log.aspx/GetRoleList",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlRole');
                    ddl.empty();
                    ddl.append($('<option>', { value: 0, text: 'All' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ROLEID,
                            text: item.NAME
                        }));
                    });
                },
                error: function (xhr, status, error) {
                    alert("Error: " + error);
                }

            });
        }

        function loadUser() {
            var roleId = $('#ddlRole').val();
            $.ajax({
                type: "POST",
                url: "Report_Log.aspx/GetUserList",
                data: JSON.stringify({ roleId: roleId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    try {
                        var ddl = $('#ddlUser');
                        ddl.empty();
                        ddl.append($('<option>', { value: 0, text: 'All' }));

                        var data = JSON.parse(response.d);

                        if (data.length === 0) {
                            ddl.append($('<option>', { value: 0, text: 'No users found' }));
                            return;
                        }

                        $.each(data, function (i, item) {
                            ddl.append($('<option>', {
                                value: item.ID,
                                text: item.User_NAME
                            }));
                        });
                    } catch (e) {
                        showWarningmessage("Invalid server response: " + response.d);
                        console.error("JSON parse error:", e);
                    }
                },
                error: function (xhr, status, error) {
                    alert("AJAX error: " + error);
                }
            });
        }
    </script>
    <script>
        $(document).ready(function () {
            var roleId = $('#<%= hdnRoleId.ClientID %>').val();
            if (roleId !== "1") {
                $('#ddlRole').closest('.col-md-3').hide();
                $('#ddlUser').closest('.col-md-3').hide();
            } else {
                $('#ddlRole').closest('.col-md-3').show();
                $('#ddlUser').closest('.col-md-3').show();
            }



            toggleCalendarFields();
            $('#ddlRole').on('change', function (e) {
                loadUser();
                $('#divtable').hide();
            });

            $('#ddlCalenderType').change(function () {
                toggleCalendarFields();
                $('#divtable').hide();
            });


            function toggleCalendarFields() {
                var calendarType = $('#ddlCalenderType').val();

                if (calendarType === '1') {
                    $('#divdate').show();
                    $('#divmonth').hide();
                    var now = new Date();
                    var d = String(now.getDate()).padStart(2, '0');
                    var mont = String(now.getMonth() + 1).padStart(2, '0');
                    var y = now.getFullYear();
                    var today = d + '-' + mont + '-' + y;
                    $('#fromDate').val(today);
                    $('#toDate').val(today);
                }
                else {
                    $('#divdate').hide();
                    $('#divmonth').show();
                    var now = new Date();
                    var m = now.toLocaleDateString('default', { month: 'short' });
                    var y = now.getFullYear();
                    $('#inputMonthYear').val(m + '-' + y);
                }

            }
            debugger;
            $('#btnView').click(function () {
                var fromDate = $('#fromDate').val();
                var toDate = $('#toDate').val();
                var roleId = $('#ddlRole').val();
                var userId = $('#ddlUser').val();
                var monthYear = $('#inputMonthYear').val();
                var calendarType = $('#ddlCalenderType').val();
                $.ajax({
                    type: "POST",
                    url: "Report_Log.aspx/ViewTable",
                    data: JSON.stringify({ fromDate: fromDate, toDate: toDate, userId: userId, roleId: roleId, monthYear: monthYear, calendarType: calendarType }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                    success: function (response) {
                        var rawData = response.d;
                        if (rawData == "NoData") {
                            $('#divtable').hide();
                            var msg = "No Data Found...!";
                            showWarningmessage(msg);
                            return;
                        }
                        debugger;
                        $('#divtable').show();
                        var data = JSON.parse(rawData);
                        jquerydatatable(data);
                    },
                    error: function (error) {
                        console.error("Error fetching  data:", error);
                    }

                });
            });
            $('#fromDate, #toDate, #inputMonthYear').change(function () {
                $('#ddlRole').val('0');
                $('#divtable').hide();
            });
            function jquerydatatable(data) {

                if (typeof $.fn.DataTable === "undefined") {
                    alert('fff');
                    return;
                }

                if ($.fn.DataTable.isDataTable('#jqtable')) {
                    $('#jqtable').DataTable().clear().destroy();
                    $('#jqtable thead tr').empty();
                }
                if (data.length > 0) {
                    $('#jqtable thead tr').append('<th>SLNO</th>');
                    $('#jqtable thead tr').append('<th>User Name</th>');
                    $('#jqtable thead tr').append('<th>Role Name</th>');
                    $('#jqtable thead tr').append('<th>Device Info</th>');
                    $('#jqtable thead tr').append('<th>Login Time</th>');
                    $('#jqtable thead tr').append('<th>Logout Time</th>');
                    $('#jqtable thead tr').append('<th>IsActive</th>');
                    $('#jqtable thead tr').append('<th>LOCTION</th>');
                }

                var columns = [
                    { data: 'SLNO' },
                    { data: 'User_NAME' },
                    { data: 'NAME' },
                    { data: 'DeviceInfo' },
                    { data: 'LoginTime' },
                    { data: 'LogoutTime' },
                    { data: 'IsActive' },
                    { data: 'LOCTION' },
                ];

                $('#jqtable').DataTable({
                    data: data,
                    columns: columns,
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
                        paginate: { 'first': 'First', 'last': 'Last', 'next': document.dir == "rtl" ? '&larr;' : '&rarr;', 'previous': document.dir == "rtl" ? '&rarr;' : '&larr;' }
                    },
                    dom: '<"datatable-header dt-buttons-right"fB><"datatable-scroll"tS><"datatable-footer"i>',
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            title: 'Session Table Report',
                            filename: 'Session_Log_export'
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            pageSize: 'A4',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'Session Table Report',
                            filename: 'Session_Log_export'
                        }
                    ]
                });
            }
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnRoleId" runat="server" />
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h6 class="mb-0">Report Log</h6>
            </div>
            <div class="card-body">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Calendar Type<span class="spcolor">*</span> :</label>
                            <select class="form-select" id="ddlCalenderType">
                                <option value="0" selected="selected">Monthly</option>
                                <option value="1" data-text="Direct Link">Custome Date</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3" id="divdate">
                            <label class="form-label">Select Date Range :</label>
                            <div class="input-group datepicker-range-one-side">
                                <input type="text" id="fromDate" onkeydown="return false" class="form-control" placeholder="From" />
                                <input type="text" id="toDate" onkeydown="return false" class="form-control" placeholder="To" />
                            </div>
                        </div>

                        <div class="col-md-3 mb-3" id="divmonth">
                            <label class="form-label">Month Year :</label>
                            <input type="text" id="inputMonthYear" onkeydown="return false" class="form-control datepicker-pick-level" />
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Role :</label>
                            <select class="form-select" id="ddlRole">
                                <option value="0">All</option>
                            </select>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">User :</label>
                            <select class="form-select" id="ddlUser">
                                <option value="0">All</option>
                            </select>
                        </div>

                    </div>
                    <div class="row">
                        <div class="text-end">
                            <button type="button" id="btnView" class="btn btn-primary">View</button>
                        </div>
                    </div>
                    <div class="col-mt-3"></div>
                    <div id="divtable" class="mt-3" style="display: none;">
                        <div class="card">
                            <div class="card-body">
                                <table id="jqtable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr id="tablefirstRow"></tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

