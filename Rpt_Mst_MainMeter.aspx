<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Rpt_Mst_MainMeter.aspx.cs" Inherits="templates_Masterdata_Rpt_Mst_MainMeter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        const swalInit = swal.mixin({
            buttonsStyling: false,
            customClass: {
                confirmButton: 'btn btn-primary',
                cancelButton: 'btn btn-light',
                denyButton: 'btn btn-light',
                input: 'form-control'
            }
        });
        $(document).ready(function () {
            debugger;
            $("#loaderShow").show();
            $("#divkpcl").hide();
            $("#divkpclheader").hide();
            $("#diventity").hide();
            $("#diventityheader").hide();
            $('#btnView').click(function () {
                debugger;
                var cid = $("#<%=ddlTypeCons.ClientID%>").val();
                if (cid == '0') {
                    swalInit.fire({
                        title: 'Please Select Consumer Type...!',
                        icon: 'warning',
                        confirmButtonText: 'Close',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-primary',
                        }
                    }).then(function (result) {

                    });
                    return;
                }

                if (cid = '-1' || cid == '7') {
                    var cid = $("#<%=ddlTypeCons.ClientID%>").val();
                    if (cid == '-1' || cid == '7') {
                        GetData1();
                        $('html, body').animate({
                            scrollTop: 1500
                        }, '1');
                    }
                    if (cid != '7') {
                    }
                }

                if (cid != '7') {
                    var cid = $("#<%=ddlTypeCons.ClientID%>").val();
                    if (cid != '7') {
                        GetData2();

                    }
                }
                if (cid == '7') {
                }
            });
        });
        function GetData1() {
            debugger;
            var cid = $("#<%=ddlTypeCons.ClientID%>").val();
            var zid = $("#<%=ddlZone.ClientID%>").val();
            var crid = $("#<%=ddlCir.ClientID%>").val();
            var did = $("#<%=ddlDivision.ClientID%>").val();
            var sid = $("#<%=txtSubStnName.ClientID%>").val();
            var vid = $("#<%=ddlvoltageclas.ClientID%>").val();
            var gname = $("#<%=ddlGenName.ClientID%>").val();
            var gtype = $("#<%=ddlGenType.ClientID%>").val();
            var gsid = $("#<%=ddlSubstation1.ClientID%>").val();
            var gid = $("#<%=ddltypegen.ClientID%>").val();

            if (crid == undefined) {
                crid = "";
            }
            if (did == undefined) {
                did = "";
            }
            if (sid == undefined) {
                sid = "";
            }
            if (vid == undefined) {
                vid = "";
            }
            if (gname == undefined) {
                gname = "";
            }
            if (gtype == undefined) {
                gtype = "";
            }
            if (gsid == undefined) {
                gsid = "";
            }
            if (gid == undefined) {
                gid = "";
            }
            if (zid == undefined) {
                zid = "";
            }
            if (crid == undefined) {
                crid = "";
            }
            if (did == undefined) {
                did = "";
            }
            if (sid == undefined) {
                sid = "";
            }
            if (vid == undefined) {
                vid = "";
            }
            if (gname == undefined) {
                gname = "";
            }
            if (gtype == undefined) {
                gtype = "";
            }
            if (gsid == undefined) {
                gsid = "";
            }
            if (gid == undefined) {
                gid = "";
            }
            if (zid == undefined) {
                zid = "";
            }
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                url: "Rpt_Mst_MainMeter.aspx/GetDataReportkpcl",
                data: JSON.stringify({ cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname, gtype: gtype, gsid: gsid, gid: gid }),
                async: true,
                success: function (response) {
                    //  alert(data.d);
                    debugger;
                    var rawData = response.d;

                    var data = JSON.parse(rawData);
                    if (data.length == 0) {
                        swalInit.fire({
                            title: 'No Data Found...!',
                            icon: 'warning',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: {
                                confirmButton: 'btn btn-primary',
                            }
                        }).then(function (result) {

                        });
                        $("#divkpcl").hide();
                        $("#divkpclheader").hide();
                    }
                    else {
                        $("#divkpcl").show();
                        $("#divkpclheader").show();
                        $('html, body').animate({
                            scrollTop: 1500
                        }, '1');
                        jquerydatatable(data);

                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus + "_" + errorThrown + "_" + jqXHR);
                },
                complete: function (jqXHR, textStatus) {
                    //UnBlock($("#dvToolbox"));
                    //UnBlock($("#dvToolbox1"));
                },
                beforeSend: function (jqXHR, settings) {
                    //Block($("#dvToolbox"));
                    //Block($("#dvToolbox1"));
                }
            });
        }

        function GetData2() {
            debugger;
            var cid = $("#<%=ddlTypeCons.ClientID%>").val();

            var zid = $("#<%=ddlZone.ClientID%>").val();

            var crid = $("#<%=ddlCir.ClientID%>").val();

            var did = $("#<%=ddlDivision.ClientID%>").val();

            var sid = $("#<%=txtSubStnName.ClientID%>").val();






            var vid = $("#<%=ddlvoltageclas.ClientID%>").val();



            var gname = $("#<%=ddlGenName.ClientID%>").val();
            var gtype = $("#<%=ddlGenType.ClientID%>").val();
            var gsid = $("#<%=ddlSubstation1.ClientID%>").val();


            var gid = $("#<%=ddltypegen.ClientID%>").val();

            if (crid == undefined) {
                crid = "";
            }
            if (did == undefined) {
                did = "";
            }
            if (sid == undefined) {
                sid = "";
            }
            if (vid == undefined) {
                vid = "";
            }
            if (gname == undefined) {
                gname = "";
            }
            if (gtype == undefined) {
                gtype = "";
            }
            if (gsid == undefined) {
                gsid = "";
            }
            if (gid == undefined) {
                gid = "";
            }
            if (zid == undefined) {
                zid = "";
            }
            if (crid == undefined) {
                crid = "";
            }
            if (did == undefined) {
                did = "";
            }
            if (sid == undefined) {
                sid = "";
            }
            if (vid == undefined) {
                vid = "";
            }
            if (gname == undefined) {
                gname = "";
            }
            if (gtype == undefined) {
                gtype = "";
            }
            if (gsid == undefined) {
                gsid = "";
            }
            if (gid == undefined) {
                gid = "";
            }
            if (zid == undefined) {
                zid = "";
            }
            $.ajax({
                type: 'post',
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                url: "Rpt_Mst_MainMeter.aspx/GetDataReport",
                data: JSON.stringify({ cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname, gtype: gtype, gsid: gsid, gid: gid }),
                async: true,
                success: function (response) {
                    //  alert(data.d);
                    var rawData = response.d;

                    var data = JSON.parse(rawData);
                    if (data.length == 0) {
                        swalInit.fire({
                            title: 'No Data Found...!',
                            icon: 'warning',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: {
                                confirmButton: 'btn btn-primary',
                            }
                        }).then(function (result) {

                        });
                        $("#diventity").hide();
                        $("#diventityheader").hide();
                    }
                    else {
                        $("#diventity").show();
                        $("#diventityheader").show();

                        jquerydatatablentity(data);
                        $('html, body').animate({
                            scrollTop: 800
                        }, '1');
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("An error occurred: " + textStatus + "_" + errorThrown + "_" + jqXHR);
                },
                complete: function (jqXHR, textStatus) {
                },
                beforeSend: function (jqXHR, settings) {
                }
            });
        }
        function jquerydatatablentity(data) {
            if ($.fn.DataTable.isDataTable('#UserTableentity')) {
                $('#UserTableentity').DataTable().clear().destroy();
            }

            if (data.length > 0) {
                var columns = [];

                // Add SlNo
                columns.push({
                    data: null,
                    title: 'SlNo',
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                });

                // Auto-create all other columns dynamically from first row
                Object.keys(data[0]).forEach(function (key) {
                    columns.push({ data: key, title: key });
                });

                //$('#UserTableentity').DataTable({

                //    //Datatable by surya
                //    data: data,
                //    columns: columns,
                //    destroy: true,
                //    paging: false,
                //    deferRender: true,
                //    scrollX: true,
                //    scrollY: 500,
                //    scrollCollapse: true,
                //    scroller: true,
                //    responsive: false,
                //    autoWidth: false,
                //    language: {
                //        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                //        searchPlaceholder: 'Type to filter...'
                //    },
                //    dom: '<"datatable-header dt-buttons-right"fB><"datatable-scroll"tS><"datatable-footer"ip>',
                //    buttons: [
                //        {
                //            extend: 'excelHtml5',
                //            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                //            className: 'btn btn-success bg-success text-white border-success me-2',
                //            title: 'Kpcl Master Data Report',
                //            filename: 'Kpcl_Masterdata_export',
                //            exportOptions: { columns: ':visible' }
                //        },
                //        {
                //            extend: 'pdfHtml5',
                //            orientation: 'landscape',
                //            pageSize: 'A3',
                //            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                //            className: 'btn btn-danger bg-danger text-white border-danger',
                //            title: 'Kpcl Master Data Report',
                //            filename: 'Kpcl_Masterdata_export',
                //            exportOptions: { columns: ':visible' }
                //        }
                //    ]
                //});

                // Initialize DataTable
                $('#UserTableentity').DataTable({

                    //pagenations by surya
                    data: data,
                    columns: columns,
                    destroy: true,
                    pageLength: 10,
                    paging: true,
                    deferRender: true,
                    scrollX: true,
                    scrollY: 419,
                    scrollCollapse: true,
                    responsive: false,
                    autoWidth: false,
                    language: {
                        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                        searchPlaceholder: 'Type to filter...',
                        lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                        paginate: {
                            first: 'First',
                            last: 'Last',
                            next: document.dir == "rtl" ? '&larr;' : '&rarr;',
                            previous: document.dir == "rtl" ? '&rarr;' : '&larr;'
                        }
                    },
                    dom: '<"datatable-header dt-buttons-right"fB><"datatable-scroll"tS><"datatable-footer"ip>',
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            title: 'Kpcl Master Data Report',
                            filename: 'Kpcl_Masterdata_export',
                            exportOptions: { columns: ':visible' }
                        },
                        {
                            extend: 'pdfHtml5',
                            orientation: 'landscape',
                            pageSize: 'A3',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'Kpcl Master Data Report',
                            filename: 'Kpcl_Masterdata_export',
                            exportOptions: { columns: ':visible' }
                        }
                    ]
                });
            }
        }


        







        function jquerydatatable(data) {
            if ($.fn.DataTable.isDataTable('#UserTable')) {
                $('#UserTable').DataTable().clear().destroy();
            }

            if (data.length > 0) {
                var columns = [
                    {
                        data: null,
                        title: 'SlNo',
                        render: function (data, type, row, meta) {
                            return meta.row + 1;
                        }
                    },
                    { data: 'GENERATION', title: 'GENERATION' },
                    { data: 'GENERATION TYPE', title: 'GENERATION TYPE' },
                    { data: 'GENERATION STATION', title: 'GENERATION STATION' },
                    { data: 'METER NO', title: 'METER NO' },
                    { data: 'Meter Type', title: 'Meter Type' },
                    { data: 'MF', title: 'MF' },
                    { data: 'DOC', title: 'DOC' },
                    { data: 'CTRATIO', title: 'CTRATIO' },
                    { data: 'PTRATIO', title: 'PTRATIO' },
                    { data: 'METERMAKE', title: 'METERMAKE' },
                    { data: 'UNITS', title: 'UNITS' },
                    { data: 'CAPACITY', title: 'CAPACITY' },
                    { data: 'VOLTAGE (kV)', title: 'VOLTAGE (kV)' }
		//,
                //    {
                 //       data: null,
                  //      title: 'JEMR Report',
                  //      orderable: false,
                   //     searchable: false,
                   //     render: function (data, type, row, meta) {
                   //         return `<button class="btn btn-sm btn-primary report-btn" data-id="${row['METER NO']}">JEMR Report</button>`;
                    //    }
                   // }
                ];

                //$('#UserTable').DataTable({

                //    //pagenation by surya
                //    data: data,
                //    columns: columns,
                //    destroy: true,
                //    pageLength: 10,
                //    paging: true,
                //    deferRender: true,
                //    scrollX: true,
                //    scrollY: 419,
                //    scrollCollapse: true,
                //    responsive: false,
                //    autoWidth: false,
                //    language: {
                //        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                //        searchPlaceholder: 'Type to filter...',
                //        lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                //        paginate: {
                //            first: 'First',
                //            last: 'Last',
                //            next: document.dir == "rtl" ? '&larr;' : '&rarr;',
                //            previous: document.dir == "rtl" ? '&rarr;' : '&larr;'
                //        }
                //    },
                //    dom: '<"datatable-header dt-buttons-right"fB><"datatable-scroll"tS><"datatable-footer"ip>',
                //    buttons: [
                //        {
                //            extend: 'excelHtml5',
                //            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                //            className: 'btn btn-success bg-success text-white border-success me-2',
                //            title: 'Kpcl Master Data Report',
                //            filename: 'Kpcl_Masterdata_export',
                //            exportOptions: { columns: ':visible' }
                //        },
                //        {
                //            extend: 'pdfHtml5',
                //            orientation: 'landscape',
                //            pageSize: 'A3',
                //            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                //            className: 'btn btn-danger bg-danger text-white border-danger',
                //            title: 'Kpcl Master Data Report',
                //            filename: 'Kpcl_Masterdata_export',
                //            exportOptions: { columns: ':visible' }
                //        }
                //    ]
                //});


                $('#UserTable').DataTable({
                    //Datatable by surya
                    data: data,
                    columns: columns,
                    destroy: true,
                    paging: false,        
                    searching: true,
                    ordering: true,
                    deferRender: true,    
                    scrollX: true,
                    scrollY: 419,
                    scrollCollapse: true,
                    responsive: false,
                    autoWidth: false,
                    language: {
                        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                        searchPlaceholder: 'Type to filter...'
                    },
                    dom: '<"datatable-header dt-buttons-right"fB><"datatable-scroll"tS><"datatable-footer"ip>',
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            title: 'Kpcl Master Data Report',
                            filename: 'Kpcl_Masterdata_export',
                            exportOptions: { columns: ':visible' }
                        },
                        {
                            extend: 'pdfHtml5',
                            orientation: 'landscape',
                            pageSize: 'A3',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'Kpcl Master Data Report',
                            filename: 'Kpcl_Masterdata_export',
                            exportOptions: { columns: ':visible' }
                        }
                    ]
                });





            }
        }
        $(document).ready(function () {
            $('#UserTable tbody').on('click', '.report-btn', function () {
                var meterNo = $(this).data('id');
                alert("Report button clicked for Meter No: " + meterNo);
            });


            $.ajax({
                url: 'Rpt_Mst_MainMeter.aspx/GetDataReport',   // your backend API URL
                type: 'POST',                        // or GET if API accepts GET
                contentType: 'application/json',
                data: JSON.stringify({ meterNo: meterNo }),
                success: function (response) {
                    console.log("Report data:", response);

                    // Example: Show response in a modal
                    alert("Got report for Meter No: " + meterNo + "\nResponse: " + JSON.stringify(response));
                },
                error: function (xhr, status, error) {
                    console.error("Error:", error);
                    alert("Something went wrong while fetching report.");
                }
            });
        });

    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <div class="content pt-3">
        <div class="card">
            <div class="card-header">
                <h6 class="mb-0">ENTITY DETAILS</h6>
            </div>
            <div class="card-body">
                <div class="tab-content">
                    <div id="loaderShow" class="app-loader" style="display: none">
                        <span class="spinner"></span>
                    </div>
                    <div class="tab-pane fade show active" id="js-tab1">
                        <div class="row">

                            <div class="col-md-3 mb-3">
                                <label class="form-label">Type Of Consumer<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlTypeCons" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlTypeCons_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3" id="divZone" runat="server">
                                <label class="form-label">KPTCL Zone:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlZone" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged" CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3" id="divCir" runat="server">
                                <label class="form-label">KPTCL Circle:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlCir" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCir_SelectedIndexChanged" CssClass="form-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3" id="divDivision" runat="server">
                                <label class="form-label">KPTCL Division:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlDivision" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged" CssClass="form-select"></asp:DropDownList>

                                </div>
                            </div>
                        <%--</div>
                        <div class="row">--%>
                            <div class="col-md-3 mb-3" id="ddlsubstation" runat="server">
                                <label class="form-label">KPTCL Sub-Station Name:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="txtSubStnName" runat="server" AutoPostBack="true" CssClass="form-select"></asp:DropDownList>

                                </div>
                            </div>
                            <div class="col-md-3 mb-3" visible="false" id="DIVEHT" runat="server">
                                <label class="form-label">Type Of EHT:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddltypeht" runat="server" AutoPostBack="true" CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3" visible="false" id="DIVTypGen" runat="server">
                                <label class="form-label">Type Of Generation:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddltypegen" runat="server" AutoPostBack="true" CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3" id="divvolt" runat="server">
                                <label class="form-label">Voltage:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlvoltageclas" runat="server" AutoPostBack="true" CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="divsubgen" runat="server" visible="false">
                            <div class="col-md-3 mb-3">
                                <label class="form-label">Generation Name:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlGenName" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlGenName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="form-label">Generation Type:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlGenType" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlGenType_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="form-label">Generation station:<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="ddlSubstation1" runat="server" CssClass="form-select" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-end">
                                <button type="button" id="btnView" class="btn btn-primary my-1 me-2">View</button>
                            </div>
                        </div>
                        <%-- <div class="card-header" id="diventityheader" style="display:none;">
                            <div class="row justify-content-between align-items-center">
                                <h5 class="mb-0 col-xs-12 col-sm-5 col-lg-6 col-xl-6">ENTITY DETAILS</h5>
                            </div>
                        </div>--%>
                        <div class="card-body " id="diventity" style="display: none;">
                            <div id="bindataentity">
                                <table id="UserTableentity" class="table table-striped table-bordered" style="width: 100%">
                                    <thead>
                                        <tr id="tableHeadRowentity"></tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>

                        <%-- <div class="card-header" id="divkpclheader" style="display:none;">
                            <div class="row justify-content-between align-items-center">
                                <h5 class="mb-0 col-xs-12 col-sm-5 col-lg-6 col-xl-6">ENTITY DETAILS - KPCL</h5>
                            </div>
                        </div>--%>
                        <div class="card-body " id="divkpcl" style="display: none;">
                            <div id="bindata">
                                <table id="UserTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr id="tableHeadRow"></tr>
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

