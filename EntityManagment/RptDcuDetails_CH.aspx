<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="RptDcuDetails_CH.aspx.cs" Inherits="RptDcuDetails_CH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        $(document).ready(function () {

            BindConsumer();
            BindZone();
            BindEHT()
            BindGeneration();
            BindGenName();


            $('#btnShow').click(function () {
                debugger;
                GetData2();
            });


            function GetData2() {
                debugger;
                var con = $('#ddlTypeCons').val();
                var zid = $('#ddlZone').val();
                var cid = $('#ddlCir').val();
                var did = $('#ddlDivision').val();
                var sis = $('#txtSubStnName').val();
                var gid = $('#ddlGenName').val();
                var gtid = $('#ddltypegen').val();
                var gsid = $('#ddlSubstation1').val();




                if (zid == null) {
                    zid = "";
                }
                if (cid == null) {
                    cid = "";
                }
                if (did == null) {
                    did = "";
                }
                if (sis == null) {
                    sis = "";
                }
                if (gid == undefined) {
                    gid = "";
                    sis = "";
                }
                if (gtid == undefined) {
                    gtid = "";
                }
                if (gsid == undefined) {
                    gsid = "";
                }
                $.ajax({

                    type: 'post',
                    dataType: 'json',
                    contentType: "application/json;charset=utf-8",
                    url: "/EntityManagment/RptDcuDetails_CH.aspx/GetDataReport",
                    data: JSON.stringify({ con: con, zid: zid, cid: cid, did: did, sis: sis, gid: gid, gtid: gtid, gsid: gsid }),
                    async: true,
                    success: function (data) {
                        //  alert(data.d);


                        $("#divEntityDetails").show();
                        $("#divData").show();
                        if (data.d == 0) {
                            alert("No Data Found..!");
                            $("#divData").hide();
                            $("#divEntityDetails").hide();

                        }
                        else {
                            $('#divData').removeClass('hide');
                            $("#ENTITYY").show();
                            $("#divData").show();
                            $("#divEntityDetails").show();

                            BindHandsOnTable(data.d);

                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("An error occurred: " + textStatus + "_" + errorThrown + "_" + jqXHR);
                    }

                });



            }


            function BindHandsOnTable(data) {
                debugger;


                var cid = $('#ddlTypeCons.ClientID').val();

                rowtop = 1;
                var head;
                if (cid == '7') {
                    head = ['SLNO', 'GENERATION', 'GENERATION TYPE', 'GENERATION STATION', 'UNITS',
                        'UNITTYPE', 'CONSUMER TYPE', 'MTRSRLNO', 'DCU TYPE', 'DCU IP/STATION NAME', '	DCUFILEPATH', '	DCUADDEDON', 'DCUADDEDBY']
                } else {
                    head = ['SLNO', 'ESCOM', 'ZONE', 'CIRCLE', 'DIVISION', 'STATION', 'ENTITY/IFPOINT NAME', 'INDIVIDUAL GENERATOR NAME', 'CONSUMER', 'BULK METER', 'CHILD METER', 'MAIN/CHECK'
                        , 'DCU IP', 'DCU TYPE', 'DCUFILEPATH', 'DCUADDEDON', 'DCUADDEDBY']
                }

                const container = document.querySelector('#divData');

                const hot = new Handsontable(container, {
                    data: data,
                    colHeaders: head,
                    contextMenu: false,
                    height: 450,
                    //fixedRowsTop: rowtop,
                    fixedColumnsLeft: 0,
                    readOnly: true,
                    columnSorting: true,
                    dragToScroll: true,
                    filters: true,
                    // dropdownMenu: true,
                    dropdownMenu: ['alignment', 'filter_by_condition', 'filter_action_bar', 'filter_by_value'],
                    licenseKey: 'non-commercial-and-evaluation',
                    manualColumnResize: true,
                });

                //$('#exportExcel').click(function () {
                //    const headers = hot.getColHeader();
                //    const exportData = hot.getData();
                //    const fullData = [headers, ...exportData];

                //    const ws = XLSX.utils.aoa_to_sheet(fullData);
                //    const wb = XLSX.utils.book_new();
                //    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
                //    XLSX.writeFile(wb, 'HandsontableData.xlsx');
                //});

                $('#exportExcel').click(function () {
                    const headers = hot.getColHeader();
                    const exportData = hot.getData();

                    // Insert Title row
                    const title = ["KPCL Generation Report"];
                    const fullData = [title, headers, ...exportData];

                    const ws = XLSX.utils.aoa_to_sheet(fullData);

                    // Merge title row across all columns
                    const mergeRef = { s: { r: 0, c: 0 }, e: { r: 0, c: headers.length - 1 } };
                    if (!ws['!merges']) ws['!merges'] = [];
                    ws['!merges'].push(mergeRef);

                    // Style for Title
                    ws["A1"].s = {
                        font: { bold: true, sz: 16, color: { rgb: "FFFFFF" } },
                        fill: { fgColor: { rgb: "4472C4" } }, // Blue background
                        alignment: { horizontal: "center", vertical: "center" }
                    };

                    // Style for Headers (Row 2 in Excel, so r=1)
                    headers.forEach((header, i) => {
                        const cellRef = XLSX.utils.encode_cell({ r: 1, c: i });
                        if (!ws[cellRef]) return;
                        ws[cellRef].s = {
                            font: { bold: true, color: { rgb: "FFFFFF" } },
                            fill: { fgColor: { rgb: "305496" } }, // Dark blue
                            alignment: { horizontal: "center" }
                        };
                    });

                    const wb = XLSX.utils.book_new();
                    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

                    // Format datetime as dd_MM_yyyy_hh_mm_ss
                    const now = new Date();
                    const formattedDate =
                        String(now.getDate()).padStart(2, '0') + "_" +
                        String(now.getMonth() + 1).padStart(2, '0') + "_" +
                        now.getFullYear() + "_" +
                        String(now.getHours()).padStart(2, '0') + "_" +
                        String(now.getMinutes()).padStart(2, '0') + "_" +
                        String(now.getSeconds()).padStart(2, '0');

                    const fileName = `DCU_DETAILS_${formattedDate}.xlsx`;

                    XLSX.writeFile(wb, fileName);
                });
            }

            $('#ddlTypeCons').on('change', function () {
                debugger;
                $("#divEntityDetails").hide();
                var typeconsss = $('#ddlTypeCons').val();
                if (typeconsss == "3") {
                    $('#ddlsubstation').show();
                    $('#divsubgen').hide();
                    $('#divZone').show();
                    $('#divCir').show();
                    $('#divDivision').show();
                }
                else if (typeconsss == "-1") {
                    $('#ddlsubstation').show();
                    $('#divsubgen').hide();
                    $('#divZone').show();
                    $('#divCir').show();
                    $('#divDivision').show();
                }
                else if (typeconsss == "7") {
                    $('#divZone').hide();
                    $('#divCir').hide();
                    $('#divDivision').hide();
                    $('#ddlsubstation').hide();
                    $('#divsubgen').show();
                    $('#divvolt').hide();
                }
                else {
                    $('#ddlsubstation').hide();
                    $('#divZone').show();
                    $('#divCir').show();
                    $('#divDivision').show();
                    $('#divsubgen').hide();
                }
                if (typeconsss == "1") {
                    /*   $('#DIVTypGen').show();*/
                    $('#DIVEHT').hide();
                }
                else if (typeconsss == "2") {
                    $('#DIVTypGen').hide();
                    /*  $('#DIVEHT').show();*/
                }
                else {
                    $('#DIVTypGen').hide();
                    $('#DIVEHT').hide();
                }
                BindVoltage();
            });
            $('#ddlZone').on('change', function () {
                $("#divEntityDetails").hide();
                //var val = $(this).val();

                //if (val == '0') {
                $('#ddlCir').empty();
                $('#ddlDivision').empty();
                $('#txtSubStnName').empty();
                //}

                BindCircle();


            });


            $('#ddlCir').on('change', function () {
                $("#divEntityDetails").hide();
                $('#ddlDivision').empty();
                $('#txtSubStnName').empty();
                BindDivision();
            });
            $('#ddlDivision').on('change', function () {
                $("#divEntityDetails").hide();
                $('#txtSubStnName').empty();
                BindSubStationName();
            });
            $('#ddlGenName').on('change', function () {
                $("#divEntityDetails").hide();
                $('#ddlGenType').empty();
                BindGENERATION_TYPE();
            });
            $('#ddlGenType').on('change', function () {
                $("#divEntityDetails").hide();
                /* $('#ddlSubstation1').empty();*/

                BindSubStation();
            });




        });

        function BindConsumer() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindConsumer",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlTypeCons');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.CONSUMERID,
                            text: item.CONSUMERNAME
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindZone() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindZone",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlZone');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL Zones' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ZONEID,
                            text: item.ZNAME
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindCircle() {
            var zoneid = $('#ddlZone').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindCircle",
                data: JSON.stringify({ zoneid: zoneid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlCir');
                    var data = JSON.parse(response.d);

                    ddl.empty(); // clear all options first

                    if (data && data.length > 0) {
                        // Only add default option if data exists
                        ddl.append($('<option>', { value: 0, text: 'ALL Circles' }));

                        $.each(data, function (i, item) {
                            ddl.append($('<option>', {
                                value: item.CIRCLEID,
                                text: item.CNAME
                            }));
                        });
                    }
                    else {
                        // Optional: add a "No data" option
                        // ddl.append($('<option>', { value: '', text: 'No Circles Available' }));
                    }
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindDivision() {
            var zoneid = $('#ddlZone').val();
            var circleid = $('#ddlCir').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindDivision",
                data: JSON.stringify({ zoneid: zoneid, circleid: circleid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlDivision');
                    debugger;
                    ddl.empty();
                    var data = JSON.parse(response.d);

                    if (data && data.length > 0) {

                        ddl.empty().append($('<option>', { value: 0, text: 'ALL Division' }));

                        $.each(data, function (i, item) {
                            ddl.append($('<option>', {
                                value: item.DIVID,
                                text: item.DNAME
                            }));
                        });
                    }
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindSubStationName() {
            var zoneid = $('#ddlZone').val();
            var circleid = $('#ddlCir').val();
            var Divisionid = $('#ddlDivision').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindSubStationName",
                data: JSON.stringify({ zoneid: zoneid, circleid: circleid, Divisionid: Divisionid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#txtSubStnName');
                    ddl.empty();
                    var data = JSON.parse(response.d);

                    if (data && data.length > 0) {

                        ddl.empty().append($('<option>', { value: 0, text: 'ALL SUB-STATION' }));

                        $.each(data, function (i, item) {
                            ddl.append($('<option>', {
                                value: item.SUBID,
                                text: item.SNAME
                            }));
                        });
                    }
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindVoltage() {
            var ddlTypeCons = $('#ddlTypeCons').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindVoltage",
                data: JSON.stringify({ ddlTypeCons: ddlTypeCons }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlvoltageclas');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ID,
                            text: item.Voltname
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindGeneration() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindGeneration",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddltypegen');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.GID,
                            text: item.GNAME
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindEHT() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindEHT",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddltypeht');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.slno,
                            text: item.type
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindGenName() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindGenName",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlGenName');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.MGID,
                            text: item.MGNAME
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindGENERATION_TYPE() {
            var GenName = $('#ddlGenName').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindGENERATION_TYPE",
                data: JSON.stringify({ GenName: GenName }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlGenType');

                    ddl.empty();
                    var data = JSON.parse(response.d);

                    if (data && data.length > 0) {

                        ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                        $.each(data, function (i, item) {
                            ddl.append($('<option>', {
                                value: item.GID,
                                text: item.GNAME
                            }));
                        });
                    }
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindSubStation() {
            debugger;
            var GenName = $('#ddlGenName').val();
            var Gen_Type = $('#ddlGenType').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/RptDcuDetails_CH.aspx/BindSubStations",
                data: JSON.stringify({ GenName: GenName, Gen_Type: Gen_Type }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlSubstation1');

                    ddl.empty();
                    var data = JSON.parse(response.d);

                    if (data && data.length > 0) {

                        ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                        $.each(data, function (i, item) {
                            ddl.append($('<option>', {
                                value: item.GSTN_ID,
                                text: item.GENSTN
                            }));
                        });
                    }
                },
                error: function (xhr, status, error) {

                }
            });
        }





        //function GetData1() {
        //    debugger;
        //    var cid = $('#ddlTypeCons').val();
        //    var zid = $('#ddlZone').val();
        //    var crid = $('#ddlCir').val();
        //    var did = $('#ddlDivision').val();
        //    var sid = $('#txtSubStnName').val();
        //    var vid = $('#ddlvoltageclas').val();
        //    var gname = $('#ddlGenName').val();
        //    var gtype = $('#ddlGenType').val();
        //    var gsid = $('#ddlSubstation1').val();
        //    var gid = $('#ddltypegen').val();

        //    if (crid == undefined) {
        //        crid = "";
        //    }
        //    if (did == undefined) {
        //        did = "";
        //    }
        //    if (sid == undefined) {
        //        sid = "";
        //    }
        //    if (vid == undefined) {
        //        vid = "";
        //    }
        //    if (gname == undefined) {
        //        gname = "";
        //    }
        //    if (gtype == undefined) {
        //        gtype = "";
        //    }
        //    if (gsid == undefined) {
        //        gsid = "";
        //    }
        //    if (gid == undefined) {
        //        gid = "";
        //    }
        //    if (zid == undefined) {
        //        zid = "";
        //    }
        //    if (crid == undefined) {
        //        crid = "";
        //    }
        //    if (did == undefined) {
        //        did = "";
        //    }
        //    if (sid == undefined) {
        //        sid = "";
        //    }
        //    if (vid == undefined) {
        //        vid = "";
        //    }
        //    if (gname == undefined) {
        //        gname = "";
        //    }
        //    if (gtype == undefined) {
        //        gtype = "";
        //    }
        //    if (gsid == undefined) {
        //        gsid = "";
        //    }
        //    if (gid == undefined) {
        //        gid = "";
        //    }
        //    if (zid == undefined) {
        //        zid = "";
        //    }
        //    $.ajax({
        //        type: 'post',
        //        dataType: 'json',
        //        contentType: "application/json;charset=utf-8",
        //        url: "/EntityManagment/RptDcuDetails_CH.aspx/GetDataReportkpcl",
        //        data: JSON.stringify({ cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname, gtype: gtype, gsid: gsid, gid: gid }),
        //        async: true,
        //        success: function (data) {
        //            //  alert(data.d);
        //            debugger;
        //            $("#divDatakpcl").show();
        //            $("#divEntityDetailsKpcl").show();
        //            if (data.d == 0) {
        //                /// alert("No Data Found..!");
        //                $("#divDatakpcl").hide();
        //                $("#divEntityDetailsKpcl").hide();
        //            }
        //            else {
        //                $('#divDatakpcl').removeClass('hide');
        //                $("#KPCLL").show();
        //                $("#divDatakpcl").show();
        //                $("#divEntityDetailsKpcl").show();
        //                $('html, body').animate({
        //                    scrollTop: 1500
        //                }, '1');
        //                BindHandsOnTable1(data.d);
        //            }
        //        },
        //        error: function (jqXHR, textStatus, errorThrown) {
        //            alert("An error occurred: " + textStatus + "_" + errorThrown + "_" + jqXHR);
        //        },
        //        complete: function (jqXHR, textStatus) {
        //            //UnBlock($("#dvToolbox"));
        //            //UnBlock($("#dvToolbox1"));
        //        },
        //        beforeSend: function (jqXHR, settings) {
        //            //Block($("#dvToolbox"));
        //            //Block($("#dvToolbox1"));
        //        }
        //    });
        //}

        //function BindHandsOnTable1(data) {

        //    const container = document.querySelector('#divDatakpcl');

        //    const hot = new Handsontable(container, {
        //        data: data,
        //        colHeaders: ['SLNO', 'GENERATION', 'GENERATION TYPE', 'GENERATION STATION', 'UNITS', 'VOLTAGE (kV)'],
        //        contextMenu: false,
        //        height: 450,
        //        fixedColumnsLeft: 0,
        //        readOnly: true,
        //        stretchH: 'all',
        //        columnSorting: true,
        //        dragToScroll: true,
        //        filters: true,
        //        dropdownMenu: ['alignment', 'filter_by_condition', 'filter_action_bar', 'filter_by_value'],
        //        licenseKey: 'non-commercial-and-evaluation',
        //        manualColumnResize: true,
        //    });





        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header ">
                <div class="card-title">INDIVIDUAL GENERATOR DCU DETAILS</div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <label class="form-label">Type Of Entities <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlTypeCons" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divZone">
                        <label class="form-label"> Zone <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlZone" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divCir">
                        <label class="form-label"> Circle <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlCir" class="form-select ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divDivision">
                        <label class="form-label"> Division <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlDivision" class="form-select ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="ddlsubstation">
                        <label class="form-label"> Sub-Station Name <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="txtSubStnName" class="form-select ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="DIVEHT" style="display: none">
                        <label class="form-label">Type Of EHT <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddltypeht" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="DIVTypGen" style="display: none">
                        <label class="form-label">Type Of Generation <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddltypegen" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divvolt" style="display: none">
                        <label class="form-label">Voltage <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlvoltageclas" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-9 row" id="divsubgen" style="display: none">
                        <div class="col-md-4">
                            <label class="form-label">Generation Name 's <span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select id="ddlGenName" class="form-select ">
                                    <option value="0">ALL</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Generation Type <span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select id="ddlGenType" class="form-select ">
                                    <%--<option value="0">ALL</option>--%>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Generation station <span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select id="ddlSubstation1" class="form-select ">
                                    <%--<option value="0">ALL</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="text-end mt-2">
                    <button id="btnShow" type="button" class="btn btn-primary">View</button>
                </div>

                <div class="card" id="divEntityDetails" style="display: none">
                    <div class="card-header d-flex align-items-center py-0">
                        <h6 class="py-3 mb-0">DCU DETAILS </h6>
                        <div class="ms-auto my-auto">
                            <button id="exportExcel" type="button" class="btn btn-success btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>Excel
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="divData" style="min-height: 480px; text-align: center;"></div>
                    </div>
                </div>

                <div class="card" id="divEntityDetailsKpcl" style="display: none">
                    <div class="card-header d-flex align-items-center py-0">
                        <h6 class="py-3 mb-0">DCU DETAILS - KPCL</h6>
                        <div class="ms-auto my-auto">
                            <button id="exportExcel1" type="button" class="btn btn-success btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>Excel
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="divDatakpcl"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


