<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Rpt_Entity.aspx.cs" Inherits="Rpt_Entity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="/lib/handsontable/xlsx.bundle.js"></script>

    <script>
        var isAutoBinding = false;
        $(document).ready(function () {

            //Bindgenerators();
            BindConsumer();
            BindEHT();
            BindGeneration();
            BindGenName();

            $('#ddlTypeCons').on('change', function () {

                Bindgenerators();
                $('#divEntityDetailsKpcl').hide();
                $('#divEntityDetails').hide();

                var typeconsss = $('#ddlTypeCons').val();
                if (typeconsss == "3") {
                    $('#ddlsubstation').show();
                    $('#divsubgen').hide();
                    $('#divZone').show();
                    $('#divCir').show();
                    $('#divDivision').show();
                    $('#divAUXBANK').show();
                    //BindBankAux();

                }
                else if (typeconsss == "-1") {
                    $('#ddlsubstation').show();
                    $('#divsubgen').hide();
                    $('#divZone').show();
                    $('#divCir').show();
                    $('#divDivision').show();
                    $('#divAUXBANK').hide();

                }
                else if (typeconsss == "7") {
                    $('#divZone').hide();
                    $('#divCir').hide();
                    $('#divDivision').hide();
                    $('#ddlsubstation').hide();
                    $('#divsubgen').show();
                    $('#divvolt').hide();
                    $('#divAUXBANK').hide();

                }
                else {
                    $('#ddlsubstation').hide();
                    $('#divZone').show();
                    $('#divCir').show();
                    $('#divDivision').show();
                    $('#divsubgen').hide();
                    $('#divAUXBANK').hide();

                }

                if (typeconsss == "1") {
                    $('#DIVTypGen').show();
                    $('#DIVEHT').hide();
                    $('#divTypeof').show();
                    $('#divGenerators').show();
                }
                else if (typeconsss == "2") {
                    $('#DIVTypGen').hide();
                    $('#DIVEHT').show();
                    $('#divTypeof').show();
                    $('#divGenerators').show();
                }
                else {
                    $('#DIVTypGen').hide();
                    $('#DIVEHT').hide();
                    $('#divTypeof').hide();
                    $('#divGenerators').hide();

                }
                BindVoltage();
            });

            $('#ddlZone').on('change', function () {

                $('#ddlCir').empty();
                $('#ddlDivision').empty();
                $('#txtSubStnName').empty();
                var typecos = $('#ddlTypeCons').val();

                if (typecos == '0') {
                    $('#ddlZone').val('0');
                    showWarningmessage('Please Select Type Of Entities...!');
                    return;
                }
                Bindgenerators();

                if (!isAutoBinding) {
                    BindCircle();
                }
            });

            $('#ddlCir').on('change', function () {
                $('#ddlDivision').empty();
                $('#txtSubStnName').empty();
                Bindgenerators();

                if (!isAutoBinding) {
                    BindDivision();
                }
            });



            $('#ddlDivision').on('change', function () {
                $('#txtSubStnName').empty();
                Bindgenerators();

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


            $('#ddltypegen').on('change', function () {
                Bindgenerators();
            });
            $('#ddlTypeof').on('change', function () {
                Bindgenerators();
            });
            $('#ddltypeht').on('change', function () {
                Bindgenerators();
            });


            $('#btnShow').on('click', function () {
                var cid = $("#ddlTypeCons").val();

                if (cid == 0) {
                    GetData1();
                    GetData2();
                }

                if (cid == '-1' || cid == '7') {
                    var cid = $("#ddlTypeCons").val();
                    if (cid == '-1' || cid == '7') {
                        GetData1();
                    }
                    if (cid != '7') {
                        $("#divDatakpcl").hide();
                        $("#divEntityDetailsKpcl").hide();
                    }
                }

                if (cid != '7') {
                    var cid = $("#ddlTypeCons").val();
                    if (cid != '7') {
                        GetData2();
                    }
                    $("#divData").hide();
                    $("#divEntityDetails").hide();
                }
                if (cid == '7') {
                    GetData1();
                    $("#divData").hide();
                    $("#divEntityDetails").hide();
                }
            });

            LoginwiseFreeze();
        });

        function LoginwiseFreeze() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Entity.aspx/LoginwiseFreeze",
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

        function Bindgenerators() {
            var cid = $('#ddlTypeCons').val();
            var zoneid = $('#ddlZone').val();
            var circleid = $('#ddlCir').val();
            var Divisionid = $('#ddlDivision').val();
            var TypeOfGen = $('#ddltypegen').val();
            var typeofMode = $('#ddlTypeof').val();
            var EHT_ID = $('#ddltypeht').val();

            if (zoneid == undefined) {
                zoneid = "";
            }
            if (circleid == undefined) {
                circleid = "";
            }
            if (Divisionid == undefined) {
                Divisionid = "";
            }
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Entity.aspx/Bindgenerators",
                data: JSON.stringify({
                    cid: cid, zoneid: zoneid, circleid: circleid, Divisionid: Divisionid, TypeOfGen: TypeOfGen,
                    typeofMode: typeofMode, EHT_ID: EHT_ID
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlgenerators');
                    ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.IFID,
                            text: item.IFPOINTNAME
                        }));
                    });
                },
                error: function (xhr, status, error) {

                }
            });
        }

        //function BindBankAux() {
        //    debugger;
        //    var zoneid = $('#ddlZone').val();
        //    var circleid = $('#ddlCir').val();
        //    var Divisionid = $('#ddlDivision').val();
        //    var cid = $('#ddlTypeCons').val();
        //    var AUX = $('#ddlauxbank').val();

        //    if (zoneid == undefined) {
        //        zoneid = "0";
        //    }
        //    if (circleid == undefined) {
        //        circleid = "0";
        //    }
        //    if (Divisionid == undefined) {
        //        Divisionid = "0";
        //    }
        //    $.ajax({
        //        type: "POST",
        //        url: "/Rpt_Entity.aspx/BindBankAux",
        //        data: JSON.stringify({ zoneid: zoneid, circleid: circleid, Divisionid: Divisionid, cid: cid, AUX: AUX }),
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (response) {

        //            var ddl = $('#ddlauxbank1166kv');
        //            ddl.empty().append($('<option>', { value: 0, text: 'ALL' }));

        //            var data = JSON.parse(response.d);
        //            $.each(data, function (i, item) {
        //                ddl.append($('<option>', {
        //                    value: item.IFID,
        //                    text: item.IFPOINTNAME
        //                }));
        //            });
        //        },
        //        error: function (xhr, status, error) {

        //        }
        //    });
        //}

        function BindConsumer() {
            $.ajax({
                type: "POST",
                url: "/EntityManagment/Rpt_Entity.aspx/BindConsumer",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindZone_1",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindZone",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindCircle",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindDivision",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindSubStationName",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindVoltage",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindGeneration",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindEHT",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindGenName",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindGENERATION_TYPE",
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
                url: "/EntityManagment/Rpt_Entity.aspx/BindSubStation",
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
            var sid = $('#txtSubStnName').val();
            var vid = $('#ddlvoltageclas').val();
            var gname = $('#ddlGenName').val();
            var gtype = $('#ddlGenType').val();
            var gsid = $('#ddlSubstation1').val();
            var gid = $('#ddltypegen').val();
            var tid = $('#ddlTypeof').val();
            var genaratorid = $('#ddlgenerators').val();
            var auxbank = $('#ddlauxbank').val();


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
                url: "/EntityManagment/Rpt_Entity.aspx/GetDataReport",
                data: JSON.stringify({
                    cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname,
                    gtype: gtype, gsid: gsid, gid: gid, tid: tid, genaratorid: genaratorid, auxbank: auxbank
                }),
                async: true,
                success: function (data) {
                    $("#divEntityDetails").show();
                    $("#divData").show();
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
            debugger;
            var cid = $('#ddlTypeCons').val();
            var zid = $('#ddlZone').val();
            var cirid = $('#ddlCir').val();
            var divid = $('#ddlDivision').val();
            var staid = $('#txtSubStnName').val();


            var head;
            if (cid == '1') {

                head = ['SLNO', 'ZONE', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'GENERATION TYPE', 'Type of Mode']


                if (zid != '0') {

                    head = ['SLNO', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'GENERATION TYPE', 'Type of Mode']

                }
                if (cirid != '0' && cirid != null) {

                    head = ['SLNO', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'GENERATION TYPE', 'Type of Mode']

                }
                if (divid != '0' && divid != null) {

                    head = ['SLNO', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'GENERATION TYPE', 'Type of Mode']

                }
                if (staid != '0' && staid != null) {

                    head = ['SLNO', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'GENERATION TYPE', 'Type of Mode']

                }
            }
            else if (cid == '2') {


                head = ['SLNO', 'ZONE', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'EHT TYPE', 'Type of Mode']

                if (zid != '0') {

                    head = ['SLNO', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'EHT TYPE', 'Type of Mode']

                }
                if (cirid != '0' && cirid != null) {

                    head = ['SLNO', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'EHT TYPE', 'Type of Mode']

                }
                if (divid != '0' && divid != null) {

                    head = ['SLNO', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'EHT TYPE', 'Type of Mode']

                }
                if (staid != '0' && staid != null) {
                    head = ['SLNO', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE', 'EHT TYPE', 'Type of Mode']
                }




            }
            else {
                head = ['SLNO', 'ZONE', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE']

                if (zid != '0') {
                    head = ['SLNO', 'CIRCLE', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE']


                }
                if (cirid != '0' && cirid != null) {
                    head = ['SLNO', 'DIVISION', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE']


                }
                if (divid != '0' && divid != null) {
                    head = ['SLNO', 'STATION NAME ', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE']


                }
                if (staid != '0' && staid != null) {

                    head = ['SLNO', 'ENTITY/IFPOINT NAME', 'ENTITY TYPE', 'CAPACITY', 'DATE OF COMMISION', 'VOLTAGE']

                }

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

            //    // Insert Title row
            //    const title = ["KPCL Generation Report"];
            //    const fullData = [title, headers, ...exportData];

            //    const ws = XLSX.utils.aoa_to_sheet(fullData);

            //    // Merge title row across all columns
            //    const mergeRef = { s: { r: 0, c: 0 }, e: { r: 0, c: headers.length - 1 } };
            //    if (!ws['!merges']) ws['!merges'] = [];
            //    ws['!merges'].push(mergeRef);

            //    // Apply styles using xlsx-js-style
            //    const range = XLSX.utils.decode_range(ws['!ref']);

            //    // Title (row 0)
            //    const titleCell = ws['A1'];
            //    titleCell.s = {
            //        font: { bold: true, sz: 16, color: { rgb: "FFFFFF" } },
            //        fill: { fgColor: { rgb: "4472C4" } },
            //        alignment: { horizontal: "center", vertical: "center" }
            //    };

            //    // Headers (row 1)
            //    headers.forEach((header, i) => {
            //        const cellRef = XLSX.utils.encode_cell({ r: 1, c: i });
            //        const cell = ws[cellRef];
            //        if (cell) {
            //            cell.s = {
            //                font: { bold: true, color: { rgb: "FFFFFF" } },
            //                fill: { fgColor: { rgb: "305496" } }, // Dark blue
            //                alignment: { horizontal: "center" }
            //            };
            //        }
            //    });

            //    const wb = XLSX.utils.book_new();
            //    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

            //    // Format datetime as dd_MM_yyyy_hh_mm_ss
            //    const now = new Date();
            //    const formattedDate =
            //        String(now.getDate()).padStart(2, '0') + "_" +
            //        String(now.getMonth() + 1).padStart(2, '0') + "_" +
            //        now.getFullYear() + "_" +
            //        String(now.getHours()).padStart(2, '0') + "_" +
            //        String(now.getMinutes()).padStart(2, '0') + "_" +
            //        String(now.getSeconds()).padStart(2, '0');

            //    const fileName = `ENTITY_DETAILS_${formattedDate}.xlsx`;

            //    // Use writeFile with xlsx-js-style
            //    XLSX.writeFile(wb, fileName, { cellStyles: true });
            //});




            //$('#exportExcel').click(function () {
            $('#exportExcel').off('click').on('click', function () {
                debugger;
                const headers = hot.getColHeader();
                const exportData = hot.getData();

                // Get values from dropdowns/textbox (use selected option text for dropdowns)
                var zid = $('#ddlZone option:selected').text();
                var crid = $('#ddlCir option:selected').text();
                var did = $('#ddlDivision option:selected').text();
                var sid = $('#txtSubStnName option:selected').text();

                if (zid == "ALL Zones") {
                    zid = "ALL"
                }
                if (crid == "ALL Circles" || crid == "" || crid == null) {
                    crid = "ALL"
                }
                if (did == "ALL Division" || did == "" || did == null) {
                    did = "ALL"
                }
                if (sid == "ALL SUB-STATION" || sid == "" || sid == null) {
                    sid = "ALL"
                }

                const title = ["KPCL Generation Report"];
                const zoneRow = ["Zone :", zid];
                const circleRow = ["Circle :", crid];
                const divisionRow = ["Division :", did];
                const subStationRow = ["Sub Station :", sid];
                const emptyRow = [];


                const fullData = [
                    title,
                    zoneRow,
                    circleRow,
                    divisionRow,
                    subStationRow,
                    emptyRow,
                    headers,
                    ...exportData
                ];

                const ws = XLSX.utils.aoa_to_sheet(fullData);


                const mergeRef = { s: { r: 0, c: 0 }, e: { r: 0, c: headers.length - 1 } };
                if (!ws['!merges']) ws['!merges'] = [];
                ws['!merges'].push(mergeRef);


                ws["A1"].s = {
                    font: { bold: true, sz: 16, color: { rgb: "FFFFFF" } },
                    fill: { fgColor: { rgb: "4472C4" } },
                    alignment: { horizontal: "center", vertical: "center" }
                };


                ["A2", "A3", "A4", "A5"].forEach(ref => {
                    if (ws[ref]) {
                        ws[ref].s = {
                            font: { bold: true, sz: 12, color: { rgb: "000000" } },
                            alignment: { horizontal: "left" }
                        };
                    }
                });
                ["B2", "B3", "B4", "B5"].forEach(ref => {
                    if (ws[ref]) {
                        ws[ref].s = {
                            font: { sz: 12, color: { rgb: "000000" } },
                            alignment: { horizontal: "left" }
                        };
                    }
                });

                headers.forEach((header, i) => {
                    const cellRef = XLSX.utils.encode_cell({ r: 6, c: i });
                    if (ws[cellRef]) {
                        ws[cellRef].s = {
                            font: { bold: true, color: { rgb: "FFFFFF" } },
                            fill: { fgColor: { rgb: "305496" } },
                            alignment: { horizontal: "center" }
                        };
                    }
                });

                const wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

                const now = new Date();
                const formattedDate =
                    String(now.getDate()).padStart(2, '0') + "_" +
                    String(now.getMonth() + 1).padStart(2, '0') + "_" +
                    now.getFullYear() + "_" +
                    String(now.getHours()).padStart(2, '0') + "_" +
                    String(now.getMinutes()).padStart(2, '0') + "_" +
                    String(now.getSeconds()).padStart(2, '0');

                const fileName = `METER_DETAILS_${formattedDate}.xlsx`;

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
                url: "/EntityManagment/Rpt_Entity.aspx/GetDataReportkpcl",
                data: JSON.stringify({ cid: cid, zid: zid, crid: crid, did: did, sid: sid, vid: vid, gname: gname, gtype: gtype, gsid: gsid, gid: gid }),
                async: true,
                success: function (data) {
                    debugger;
                    $("#divDatakpcl").show();
                    $("#divEntityDetailsKpcl").show();
                    if (data.d == 0) {
                        $("#divDatakpcl").hide();
                        $("#divEntityDetailsKpcl").hide();
                        showWarningmessage("No Data Found..!");

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

            const container = document.querySelector('#divDatakpcl');

            const hot = new Handsontable(container, {
                data: data,
                colHeaders: ['SLNO', 'GENERATION', 'GENERATION TYPE', 'GENERATION STATION', 'UNITS', 'VOLTAGE (kV)'],
                contextMenu: false,
                height: 450,
                fixedColumnsLeft: 0,
                readOnly: true,
                stretchH: 'all',
                columnSorting: true,
                dragToScroll: true,
                filters: true,
                dropdownMenu: ['alignment', 'filter_by_condition', 'filter_action_bar', 'filter_by_value'],
                licenseKey: 'non-commercial-and-evaluation',
                manualColumnResize: true,
            });



            //$('#exportExcel1').click(function () {
            $('#exportExcel1').off('click').on('click', function () {
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

                const fileName = `ENTITY_DETAILS_KPCL_${formattedDate}.xlsx`;

                XLSX.writeFile(wb, fileName);
            });

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mt-2">
        <div class="card">
            <div class="card-header ">
                <div class="card-title">ENTITY DETAILS </div>
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
                        <label class="form-label">Zone <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlZone" class="form-select ">
                                <option value="0">ALL</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divCir">
                        <label class="form-label">Circle <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlCir" class="form-select ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="divDivision">
                        <label class="form-label">Division <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlDivision" class="form-select ">
                                <%--<option value="0">ALL</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3" id="ddlsubstation">
                        <label class="form-label">Sub-Station Name <span class="text-danger">*</span> </label>
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
                        <label class="form-label">Type of Mode <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlTypeof" class="form-select ">
                                <option value="0">ALL</option>
                                <option value="OA">Openaccess</option>
                                <option value="WB">Wheeling & Banking</option>
                                <option value="PPA">PPA</option>
                                <%--<option value="REMC">REMC</option>--%>
                            </select>
                        </div>
                    </div>



                    <div class="col-md-3" id="divGenerators" style="display: none">
                        <label class="form-label">Generators <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlgenerators" class="form-select select">
                            </select>
                        </div>
                    </div>


                    <div class="col-md-3" id="divAUXBANK" style="display: none">
                        <label class="form-label">Type of Bank/Aux <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlauxbank" class="form-select ">
                                <option value="0">ALL</option>
                                <option value="66">66kV</option>
                                <option value="11">11kV</option>
                                <option value="Aux">Aux</option>
                            </select>
                        </div>
                    </div>


                    <%--     
                        <div class="col-md-6">
                            <label class="form-label">Bank/Aux <span class="text-danger">*</span> </label>
                            <div class="input-group">
                                <select id="ddlauxbank1166kv" class="form-select select">
                                </select>
                            </div>
                        </div>--%>
                </div>

                <div class="text-end mt-2">
                    <button id="btnShow" type="button" class="btn btn-primary">View</button>
                </div>

                <div class="card" id="divEntityDetails" style="display: none">
                    <div class="card-header d-flex align-items-center py-0">
                        <h6 class="py-3 mb-0">ENTITY DETAILS </h6>
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

