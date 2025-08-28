<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="RptLoadSMtrs_kpcl.aspx.cs" Inherits="RptLoadSMtrs_kpcl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function renderDynamicDataTable(data, tableID, hiddenColumns = [], linkColumns = []) {

            if ($.fn.DataTable.isDataTable(`#${tableID}`)) {
                $(`#${tableID}`).DataTable().clear().destroy();
            }

            if (typeof data === "string") {
                try {
                    data = JSON.parse(data);
                } catch (e) {
                    showInfoMessage("No Data");
                    return;
                }
            }

            if (!Array.isArray(data) || data.length === 0) {
                showInfoMessage("No Data");
                return;
            }


            const keys = Object.keys(data[0]);
            const exportableColumns = keys.filter(k => !hiddenColumns.includes(k));

            let columns = [];

            // Serial number column
            columns.push({
                data: null,
                render: function (data, type, row, meta) {
                    return meta.row + 1;
                }
            });

            // Dynamic columns from data keys
            keys.forEach(key => {
                columns.push({
                    data: key,
                    visible: !hiddenColumns.includes(key),
                    render: function (data, type, row, meta) {
                        if (linkColumns.includes(key)) {
                            return `<button type="button" id="${key}" class="btn btn-link text-decoration-none p-0">${data}</button>`;

                        }
                        return data;
                    }
                });
            });

            const table = $(`#${tableID}`).DataTable({
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
                //deferRender: true,
                dom: '<"datatable-header justify-content-start"f<"ms-sm-auto"l><"ms-sm-3"B>><"datatable-scroll-wrap"t><"datatable-footer"ip>',
                language: {
                    search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                    searchPlaceholder: 'Type to filter...',
                    lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                    paginate: {
                        'first': 'First',
                        'last': 'Last',
                        'next': document.dir === "rtl" ? '&larr;' : '&rarr;',
                        'previous': document.dir === "rtl" ? '&rarr;' : '&larr;'
                    }
                },
                buttons: {
                    dom: {
                        button: {
                            className: 'btn btn-light'
                        }
                    },
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                            filename: 'ExportedData',
                            autoFilter: true,
                            title: 'Data',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            exportOptions: {
                                columns: function (idx, data, node) {
                                    const colData = table.settings()[0].aoColumns[idx].data;
                                    return exportableColumns.includes(colData);
                                }
                            }
                        }
                    ]
                }
            });
        }

        $(document).ready(function () {

            $(`#tblGenration tbody`).on('click', '#RECEIVED', function () {
                var table = $(`#tblGenration`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = "";
                var cir1 = "";
                var did1 = "";

                Recivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenrationType tbody`).on('click', '#RECEIVED', function () {
                var table = $(`#tblGenrationType`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = rowData.GID;
                var cir1 = "";
                var did1 = "";

                Recivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenrationStation tbody`).on('click', '#RECEIVED', function () {
                var table = $(`#tblGenrationStation`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = rowData.GID;
                var cir1 = rowData.GSTN_ID;
                var did1 = "";

                Recivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenration tbody`).on('click', '#PARTIAL', function () {
                debugger;
                var table = $(`#tblGenration`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = "";
                var cir1 = "";
                var did1 = "";

                Particalpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenrationType tbody`).on('click', '#PARTIAL', function () {
                var table = $(`#tblGenrationType`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = rowData.GID;
                var cir1 = "";
                var did1 = "";

                Particalpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenrationStation tbody`).on('click', '#PARTIAL', function () {
                var table = $(`#tblGenrationStation`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = rowData.GID;
                var cir1 = rowData.GSTN_ID;
                var did1 = "";

                Particalpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenration tbody`).on('click', '#NOT_RECEIVED', function () {
                debugger;
                var table = $(`#tblGenration`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = "";
                var cir1 = "";
                var did1 = "";

                NotRecivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenrationType tbody`).on('click', '#NOT_RECEIVED', function () {
                var table = $(`#tblGenrationType`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = rowData.GID;
                var cir1 = "";
                var did1 = "";

                NotRecivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });
            $(`#tblGenrationStation tbody`).on('click', '#NOT_RECEIVED', function () {
                var table = $(`#tblGenrationStation`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var ddlType = $("#ddlType option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var compid1 = rowData.MGID;
                var zid1 = rowData.GID;
                var cir1 = rowData.GSTN_ID;
                var did1 = "";

                NotRecivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1);
            });



            $(`#tblDetailsOfmeter tbody`).on('click', '#MTR_NO', function () {
                debugger;
                var table = $(`#tblDetailsOfmeter`).DataTable();
                var rowData = table.row($(this).closest('tr')).data();
                var rdbslot = $("#rdbslot option:selected").val();
                var txtmonth = $("#txtmonth").val();
                var meter = rowData.MTR_NO;

                MeterdataPOP(rdbslot, txtmonth, meter);
            });


            $("#btnview").on('click', function () {
                debugger;
                View();
            });
        });

        function Recivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1) {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/RptLoadSMtrs_kpcl.aspx/RecivedPop',
                //data: JSON.stringify({ }),
                data: JSON.stringify({
                    ddlType: ddlType,
                    rdbslot: rdbslot,
                    txtmonth: txtmonth,
                    compid1: compid1,
                    zid1: zid1,
                    cir1: cir1,
                    did1: did1
                }),
                async: true,
                success: function (response) {
                    renderDynamicDataTable(response.d, 'tblDetailsOfmeter', [], ['MTR_NO']);
                    $('#modal_DetailsOfmeter').modal('show');

                },
                error: function (error) {

                }

            });
        }


        function Particalpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1) {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/RptLoadSMtrs_kpcl.aspx/partialPop',
                //data: JSON.stringify({ }),
                data: JSON.stringify({
                    ddlType: ddlType,
                    rdbslot: rdbslot,
                    txtmonth: txtmonth,
                    compid1: compid1,
                    zid1: zid1,
                    cir1: cir1,
                    did1: did1
                }),
                async: true,
                success: function (response) {
                    renderDynamicDataTable(response.d, 'tblDetailsOfmeter', [], ['MTR_NO']);
                    $('#modal_DetailsOfmeter').modal('show');

                },
                error: function (error) {

                }

            });
        }

        function NotRecivedpops(rdbslot, ddlType, txtmonth, compid1, zid1, cir1, did1) {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/RptLoadSMtrs_kpcl.aspx/notreceivedPop',
                //data: JSON.stringify({ }),
                data: JSON.stringify({
                    ddlType: ddlType,
                    rdbslot: rdbslot,
                    txtmonth: txtmonth,
                    compid1: compid1,
                    zid1: zid1,
                    cir1: cir1,
                    did1: did1
                }),
                async: true,
                success: function (response) {
                    renderDynamicDataTable(response.d, 'tblDetailsOfmeter', [], []);
                    $('#modal_DetailsOfmeter').modal('show');

                },
                error: function (error) {

                }

            });
        }

        function MeterdataPOP(rdbslot, txtmonth, meter) {
            debugger;
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/RptLoadSMtrs_kpcl.aspx/meternum_POP',
                //data: JSON.stringify({ }),
                data: JSON.stringify({
                    rdbslot: rdbslot,
                    txtmonth: txtmonth,
                    meter: meter
                }),
                async: true,
                success: function (response) {
                    renderDynamicDataTable(response.d, 'tblMeter_data', [], []);
                    $('#modal_Meter_data').modal('show');
                },
                error: function (error) {

                }

            });
        }

        function View() {
            var rdbslot = $("#rdbslot option:selected").val();
            var rdbtype = $("#rdbtype option:selected").val();
            var ddlType = $("#ddlType option:selected").val();
            var txtmonth = $("#txtmonth").val();
            var ddlmeter = $("input[name='ddlmeter']:checked").val();


            if (rdbslot == '0' || rdbslot == undefined || rdbslot == '') {
                showWarningmessage('Please Select Data Type...!');
                return
            }
            if (rdbtype == '0' || rdbtype == undefined || rdbtype == '') {
                showWarningmessage('Please Select Input Type...!');
                return
            }
            if (ddlType == '0' || ddlType == undefined || ddlType == '') {
                showWarningmessage('Please Select Consumer Type...!');
                return
            }
            if (txtmonth == undefined || txtmonth == '') {
                showWarningmessage('Please Select Month Year...!');
                return
            }



            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/RptLoadSMtrs_kpcl.aspx/ViewData',
                data: JSON.stringify({
                    rdbslot: rdbslot,
                    rdbtype: rdbtype,
                    ddlType: ddlType,
                    ddlmeter: ddlmeter,
                    txtmonth: txtmonth
                }),
                async: true,
                success: function (response) {
                    debugger;
                    if (ddlType == '1') {
                        $('#divtblGenration').show();
                        $('#divtblGenrationType').hide();
                        $('#divtblGenrationStation').hide();
                        renderDynamicDataTable(response.d, 'tblGenration', ['MGID'], ['RECEIVED', 'PARTIAL', 'NOT_RECEIVED']);
                    }
                    else if (ddlType == '2') {
                        $('#divtblGenration').hide();
                        $('#divtblGenrationType').show();
                        $('#divtblGenrationStation').hide();
                        renderDynamicDataTable(response.d, 'tblGenrationType', ['MGID', 'GID',], ['RECEIVED', 'PARTIAL', 'NOT_RECEIVED']);
                    }
                    else if (ddlType == '3') {
                        $('#divtblGenration').hide();
                        $('#divtblGenrationType').hide();
                        $('#divtblGenrationStation').show();
                        renderDynamicDataTable(response.d, 'tblGenrationStation', ['MGID', 'GID', 'GSTN_ID'], ['RECEIVED', 'PARTIAL', 'NOT_RECEIVED']);
                    }
                },
                error: function (error) {

                }

            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header ">
                <div class="card-title">INPUT SOURCE</div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Select Input Type:<span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select class="form-select select" id="rdbtype">
                                    <%--      <option value="0" style="display:none">SELECT TYPE</option>
                                    <option value="1" style="display:none">Web Upload</option>
                                    <option value="2" style="display:none">Mail</option>--%>
                                    <option value="3" selected="selected">DCU</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Select Data Type:<span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select class="form-select select" id="rdbslot">
                                    <option value="0">SELECT TYPE</option>
                                    <option value="load">Load Survey</option>
                                    <option value="mid">Mid Night</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label class="form-label">Select Consumer Type:<span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select class="form-select select" id="ddlType">
                                    <option value="0">SELECT TYPE</option>
                                    <option value="1">Generation</option>
                                    <option value="2">Generation Type</option>
                                    <option value="3">Generation Station</option>
                                    <%--<option value="4" style="display: none">Division</option>--%>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label class="form-label">Select Month-Year:<span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <input type="text" id="txtmonth" onkeydown="return false" class="form-control datepicker-pick-level" />
                            </div>
                        </div>


                        <div class="col-md-4 mb-3" style="display:none">
                            <label class="form-label">Select Type:<span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <div class="p-2 ">
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" name="ddlmeter" value="1" checked>
                                        <label class="form-check-label">ACTIVE METERS</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input type="radio" class="form-check-input" name="ddlmeter" value="2">
                                        <label class="form-check-label">REPLACEMENT METERS</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="text-end mt-3">
                        <button id="btnview" type="button" class="btn btn-primary">View</button>

                    </div>
                </div>
                <div class="row" id="divtblGenration" style="display: none">
                    <table id="tblGenration" width="100%" class="table table-striped table-bordered align-middle text-nowrap">
                        <thead>
                            <tr>
                                <th class="table-active">SLNO</th>
                                <th class="table-active">GENERATION</th>
                                <th class="table-active">ACTUAL</th>
                                <th class="table-active">RECEIVED</th>
                                <th class="table-active">PARTIAL</th>
                                <th class="table-active">NOT RECEIVED</th>
                                <th class="table-active">MGID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dynamic table rows go here -->

                        </tbody>
                    </table>
                </div>
                <div class="row" id="divtblGenrationType" style="display: none">
                    <table id="tblGenrationType" width="100%" class="table table-striped table-bordered align-middle text-nowrap">
                        <thead>
                            <tr>
                                <th class="table-active">SLNO</th>
                                <th class="table-active">GENERATION</th>
                                <th class="table-active">GENERATION TYPE</th>
                                <th class="table-active">ACTUAL</th>
                                <th class="table-active">RECEIVED</th>
                                <th class="table-active">PARTIAL</th>
                                <th class="table-active">NOT RECEIVED</th>
                                <th class="table-active">MGID</th>
                                <th class="table-active">GID</th>
                                <%--  <th class="table-active">GSTN_ID</th>
                                <th class="table-active">GSTN_ID11</th>--%>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dynamic table rows go here -->

                        </tbody>
                    </table>
                </div>

                <div class="row" id="divtblGenrationStation" style="display: none">
                    <table id="tblGenrationStation" width="100%" class="table table-striped table-bordered align-middle text-nowrap">
                        <thead>
                            <tr>
                                <th class="table-active">SLNO</th>
                                <th class="table-active">GENERATION</th>
                                <th class="table-active">GENERATION TYPE</th>
                                <th class="table-active">GENERATION STATION</th>
                                <th class="table-active">ACTUAL</th>
                                <th class="table-active">RECEIVED</th>
                                <th class="table-active">PARTIAL</th>
                                <th class="table-active">NOT RECEIVED</th>
                                <th class="table-active">MGID</th>
                                <th class="table-active">GID</th>
                                <th class="table-active">GSTN_ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dynamic table rows go here -->

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="modal_DetailsOfmeter" class="modal fade" tabindex="-1">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">METER DETAILS</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">

                        <table id="tblDetailsOfmeter" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th class="table-active">SLNO</th>
                                    <th class="table-active">GENERATION</th>
                                    <th class="table-active">GENERATION TYPE</th>
                                    <th class="table-active">GENERATION STATION</th>
                                    <th class="table-active">GENERATION UNITS</th>
                                    <th class="table-active">METER SLNO</th>
                                    <th class="table-active">MAIN/CHECK METER</th>
                                    <th class="table-active">DCU IP</th>
                                    <th class="table-active">DCUFILEPATH</th>
                                    <th class="table-active">DCU TYPE</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="modal_Meter_data" class="modal fade" tabindex="-1">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">METER DETAILS</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">

                        <table id="tblMeter_data" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th class="table-active">SLNO</th>
                                    <th class="table-active">GENERATION</th>
                                    <th class="table-active">GENERATION TYPE</th>
                                    <th class="table-active">GENERATION STATION</th>
                                    <th class="table-active">GENERATION UNITS</th>
                                    <th class="table-active">METER SLNO</th>
                                    <th class="table-active">MAIN/CHECK METER</th>
                                    <th class="table-active">Date</th>
                                    <th class="table-active">BLOCK</th>
                                    <th class="table-active">ACTIVEIMPORT (kWh)</th>
                                    <th class="table-active">ACTIVEEXPORT (kWh)</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

