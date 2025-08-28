<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Rpt_Mst_ChildMeter.aspx.cs" Inherits="Rpt_Mst_ChildMeter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        var isAutoBinding = false;
        $(document).ready(function () {

            BindConsumer();
            BindEHT();
            BindGeneration();
            BindGenName();

            $('#ddlTypeCons').on('change', function () {

                $('#divEntityDetailsKpcl').hide();
                $('#divEntityDetails').hide();

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
                    $('#DIVTypGen').show();
                    $('#DIVEHT').hide();
                    $('#divTypeof').show();
                }
                else if (typeconsss == "2") {
                    $('#DIVTypGen').hide();
                    $('#DIVEHT').show();
                    $('#divTypeof').show();

                }
                else {
                    $('#DIVTypGen').hide();
                    $('#DIVEHT').hide();
                    $('#divTypeof').hide();

                }
                BindVoltage();
            });



            $('#ddlZone').on('change', function () {

                //$('#ddlCir').empty();
                //$('#ddlDivision').empty();
                //$('#txtSubStnName').empty();

                if (!isAutoBinding) {
                    BindCircle();
                }
            });

            $('#ddlCir').on('change', function () {
                if (!isAutoBinding) {
                    BindDivision();
                }
            });

            $('#ddlDivision').on('change', function () {
                if (!isAutoBinding) {
                    BindSubStationName();
                }
            });

            $('#ddlGenName').on('change', function () {
                $('#ddlGenType').empty();
                BindGENERATION_TYPE();
            });
            $('#ddlGenType').on('change', function () {
                $('#ddlSubstation1').empty();

                BindSubStation();
            });

            $('#btnShow').click(function () {
                debugger;
                var cid = $('#ddlTypeCons').val();


                if (cid = '-1' || cid == '7') {
                    var cid = $('#ddlTypeCons').val();
                    if (cid == '-1' || cid == '7') {
                        GetData1();
                        $('html, body').animate({
                            scrollTop: 1500
                        }, '1');
                    }
                    if (cid != '7') {
                        $("#divDatakpcl").hide();
                    }
                }

                if (cid != '7') {
                    var cid = $('#ddlTypeCons').val();
                    if (cid != '7') {
                        GetData2();

                    }
                    $("#divData").hide();
                }
                if (cid == '7') {
                    $("#divData").hide();
                }
            });

            LoginwiseFreeze();
        });
        function LoginwiseFreeze() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/LoginwiseFreeze",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    debugger;
                    var data = response.d;

                    var Depid = data.DEPTid;
                    var COMPID = data.COMPID;
                    var zoneid = data.zoneid;
                    var cirid = data.cirid;
                    var divid = data.divid;

                    if (Depid == 0) {
                        BindZone();
                    }
                    else if (Depid == 1)//company
                    {
                        BindZone_1(COMPID);
                        //  $('#ddlZone').val(zoneid);
                        // BindCircle()
                    }
                    else if (Depid == 2) { // zone
                        isAutoBinding = true;
                        BindZone().then(function () {
                            $('#ddlZone').val(zoneid).trigger('change');
                            $('#ddlZone').prop('disabled', true);
                            return BindCircle();
                        }).then(function () {
                            isAutoBinding = false;
                        }).catch(function (err) {
                            console.error("Error while binding:", err);
                            isAutoBinding = false;
                        });
                    }
                    else if (Depid == 3) { // circle
                        isAutoBinding = true;
                        BindZone().then(function () {
                            $('#ddlZone').val(zoneid).trigger('change');
                            $('#ddlZone').prop('disabled', true);
                            return BindCircle();
                        }).then(function () {
                            $('#ddlCir').val(cirid).trigger('change');
                            $('#ddlCir').prop('disabled', true);
                            return BindDivision();
                        }).then(function () {
                            isAutoBinding = false;
                        }).catch(function (err) {
                            console.error("Error while binding:", err);
                            isAutoBinding = false;
                        });
                    }

                    else if (Depid == 4) // division
                    {
                        isAutoBinding = true;
                        BindZone().then(function () {
                            $('#ddlZone').val(zoneid).trigger('change');
                            $('#ddlZone').prop('disabled', true);
                            return BindCircle();
                        }).then(function () {
                            $('#ddlCir').val(cirid).trigger('change');
                            $('#ddlCir').prop('disabled', true);
                            return BindDivision();
                        }).then(function () {
                            $('#ddlDivision').val(divid).trigger('change');
                            $('#ddlDivision').prop('disabled', true);
                            return BindSubStationName();
                        }).then(function () {
                            isAutoBinding = false; // ✅ allow manual changes again
                        }).catch(function (err) {
                            console.error("Error while binding:", err);
                            isAutoBinding = false;
                        });
                    }
                },
                error: function (xhr, status, error) {

                }
            });
        }

        function BindConsumer() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindConsumer",
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

        function BindZone_1(COMPID) {
            return $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindZone_1",
                data: JSON.stringify({ COMPID: COMPID }),
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

        function BindZone() {
            return $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindZone",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).then(function (response) {
                var ddl = $('#ddlZone');
                ddl.empty().append($('<option>', { value: 0, text: 'ALL Zones' }));

                var data = JSON.parse(response.d);
                $.each(data, function (i, item) {
                    ddl.append($('<option>', {
                        value: item.ZONEID,
                        text: item.ZNAME
                    }));
                });
            });
        }

        function BindCircle() {
            var zoneid = $('#ddlZone').val();
            return $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindCircle",
                data: JSON.stringify({ zoneid: zoneid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).then(function (response) {
                var ddl = $('#ddlCir');
                var data = JSON.parse(response.d);

                ddl.empty();

                if (data && data.length > 0) {
                    ddl.append($('<option>', { value: 0, text: 'ALL Circles' }));
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.CIRCLEID,
                            text: item.CNAME
                        }));
                    });
                }
            });
        }

        function BindDivision() {
            var zoneid = $('#ddlZone').val();
            var circleid = $('#ddlCir').val();
            return $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindDivision",
                data: JSON.stringify({ zoneid: zoneid, circleid: circleid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).then(function (response) {
                var ddl = $('#ddlDivision');
                ddl.empty();
                var data = JSON.parse(response.d);

                if (data && data.length > 0) {
                    ddl.append($('<option>', { value: 0, text: 'ALL Division' }));
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.DIVID,
                            text: item.DNAME
                        }));
                    });
                }
            });
        }

        function BindSubStationName() {
            var zoneid = $('#ddlZone').val();
            var circleid = $('#ddlCir').val();
            var Divisionid = $('#ddlDivision').val();
            return $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindSubStationName",
                data: JSON.stringify({ zoneid: zoneid, circleid: circleid, Divisionid: Divisionid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).then(function (response) {
                var ddl = $('#txtSubStnName');
                ddl.empty();
                var data = JSON.parse(response.d);

                if (data && data.length > 0) {
                    ddl.append($('<option>', { value: 0, text: 'ALL SUB-STATION' }));
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.SUBID,
                            text: item.SNAME
                        }));
                    });
                }
            });
        }

        function BindVoltage() {
            var ddlTypeCons = $('#ddlTypeCons').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindVoltage",
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
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindGeneration",
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
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindEHT",
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
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindGenName",
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
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindGENERATION_TYPE",
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
            var GenName = $('#ddlGenName').val();
            var Gen_Type = $('#ddlGenType').val();
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/BindSubStation",
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

        function GetData2() {

            var cid = $('#ddlTypeCons').val();
            var zid = $('#ddlZone').val();
            var crid = $('#ddlCir').val();
            var did = $('#ddlDivision').val();
            var sid = $('#txtSubStnName').find("option:selected").text();
            var vid = $('#ddlvoltageclas').val();
            var gname = $('#ddlGenName').val();
            var gtype = $('#ddlGenType').val();
            var gsid = $('#ddlSubstation1').val();
            var gid = $('#ddltypegen').val();

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
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/GetDataReport",
                data: JSON.stringify({ cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname, gtype: gtype, gsid: gsid, gid: gid }),
                async: true,
                success: function (data) {
                    debugger;
                    $("#divData").show();
                    $("#divEntityDetails").show();
                    if (data.d == 0) {
                        showWarningmessage("No Data Found..!");
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
                    // alert("An error occurred: " + textStatus + "_" + errorThrown + "_" + jqXHR);
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

        function BindHandsOnTable(data) {

            const container = document.querySelector('#divData');

            //$("#divData").handsontable({


            const hot = new Handsontable(container, {
                data: data,
                colHeaders: ['SLNO', 'ESCOM', 'ZONE', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'INDIVIDUAL GENERATOR NAME', 'INDIVIDUAL GENERATOR METER SL NO', 'MAIN/CHECK'
                    , 'CONSUMER TYPE', 'RRNO', '	CTRATIO', 'PTRATIO', ' CAPACITY (MW)', 'MF', 'GENERATION TYPE', 'ADDED ON', '	ADDED BY', 'DCU IP'],

                //colHeaders: head,
                contextMenu: false,
                height: 450,
                fixedColumnsLeft: 0,
                readOnly: true,
                columnSorting: true,
                dragToScroll: true,
                filters: true,
                dropdownMenu: ['alignment', 'filter_by_condition', 'filter_action_bar', 'filter_by_value'],
                //height: 'auto',
                licenseKey: 'non-commercial-and-evaluation',
                manualColumnResize: true,
            });


            $('#exportExcel').click(function () {
                const headers = hot.getColHeader();
                const exportData = hot.getData();

                // Insert Title row
                const title = ["INDIVIDUAL GENERATOR METER DETAILS"];
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

                const fileName = `INDIVIDUAL_GENERATOR_METER_DETAILS_${formattedDate}.xlsx`;

                XLSX.writeFile(wb, fileName);
            });
        }

        function GetData1() {

            var cid = $('#ddlTypeCons').val();
            var zid = $('#ddlZone').val();
            var crid = $('#ddlCir').val();
            var did = $('#ddlDivision').val();
            var sid = $('#txtSubStnName').val();
            var vid = $('#ddlvoltageclas').val();
            var gname = $('#ddlGenName').val();
            var gtype = $('#ddlGenType').val();
            var gsid = $('#ddlSubstation1').val();
            var gid = $('#ddltypegen').val();

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
                url: "/EntityManagment/Rpt_Mst_ChildMeter.aspx/GetDataReportkpcl",
                data: JSON.stringify({ cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname, gtype: gtype, gsid: gsid, gid: gid }),
                async: true,
                success: function (data) {
                    debugger;
                    $("#divDatakpcl").show();
                    $("#divEntityDetailsKpcl").show();
                    if (data.d == 0) {
                        showWarningmessage("No Data Found..!");
                        $("#divDatakpcl").hide();
                        $("#divEntityDetailsKpcl").hide();
                    }
                    else {
                        $('#divDatakpcl').removeClass('hide');
                        $("#KPCLL").show();
                        $("#divDatakpcl").show();
                        $("#divEntityDetailsKpcl").show();

                        BindHandsOnTable1(data.d);
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    // alert("An error occurred: " + textStatus + "_" + errorThrown + "_" + jqXHR);
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

        function BindHandsOnTable1(data) {

            $("#divDatakpcl").handsontable({

                data: data,
                colHeaders: ['SLNO', 'GENERATION', 'GENERATION TYPE', 'GENERATION STATION', 'METER NO', 'MF ', 'DOC', '	CTRATIO', '	PTRATIO', '	METERMAKE', 'REMARKS', 'UNITS', 'CAPACITY', 'VOLTAGE (kV)', 'ABT/Non-ABT/DLMS'
                    , 'DCU IP'],

                //colHeaders: head,
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
                //height: 'auto',
                licenseKey: 'non-commercial-and-evaluation',
                manualColumnResize: true,
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header ">
                <div class="card-title">INDIVIDUAL GENERATOR METER DETAILS </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <label class="form-label">Type Of Consumer <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlTypeCons" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divZone">
                        <label class="form-label">KPTCL Zone <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlZone" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divCir">
                        <label class="form-label">KPTCL Circle <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlCir" class="form-select ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divDivision">
                        <label class="form-label">KPTCL Division <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlDivision" class="form-select  ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="ddlsubstation">
                        <label class="form-label">KPTCL Sub-Station Name <span class="text-danger">*</span> </label>
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
                    <div class="col-md-3" id="divTypeof" style="display: none">
                        <label class="form-label">Type of <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlTypeof" class="form-select ">
                                <option value="0">ALL</option>
                                <option value="OA">Openaccess</option>
                                <option value="WB">Wheeling & Banking</option>
                                <option value="PPA">PPA</option>
                                <option value="REMC">REMC</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="text-end mt-2">
                    <button id="btnShow" type="button" class="btn btn-primary">View</button>
                </div>


                <div class="card" id="divEntityDetails" style="display: none">
                    <div class="card-header d-flex align-items-center py-0">
                        <h6 class="py-3 mb-0">CHILD METER DETAILS</h6>
                        <div class="ms-auto my-auto">
                            <button id="exportExcel" type="button" class="btn btn-success btn-sm me-2">
                                <i class="ph ph-file-xls me-1 fs-lg"></i>Excel
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="divData"></div>
                    </div>
                </div>

                <div class="card" id="divEntityDetailsKpcl" style="display: none">
                    <div class="card-header d-flex align-items-center py-0">
                        <h6 class="py-3 mb-0">ENTITY DETAILS - KPCL</h6>
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

