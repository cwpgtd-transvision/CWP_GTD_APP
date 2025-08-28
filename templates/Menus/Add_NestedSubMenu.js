$(document).ready(function () {
    $("#btnclear2").on('click', function () {
        clr2();
    });

    $('#btnNestedOrder').on('click', function () {
        debugger;
        $('#nestedSubMenuOrderModal').modal('show');

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetAllNested",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var menus = response.d;
                var list = $('#nestedSubMenuOrder');
                list.empty();

                $.each(menus, function (i, menu) {
                    list.append($('<li>', {
                        class: 'list-group-item d-flex align-items-center',
                        'data-id': menu.ID,
                        html: '<i class="fa-solid fa-circle small text-primary me-2"></i>' + menu.Name
                    }));
                });

                list.sortable({
                    placeholder: "ui-state-highlight"
                }).disableSelection();
            },
            error: function (xhr, status, error) {
                showWarningmessage("Error: " + error);
            }
        });
    });




    loadMainSubMenuDropdown();
    $("#btnadd2").on('click', function () {
        debugger;
        $("#divrow2").hide();
        $("#divadd2").show();
        $("#btnback2").show();
        $("#btnadd2").hide();
    });

    $("#btnback2").on('click', function () {
        debugger;
        $("#divrow2").show();
        $("#divadd2").hide();
        $("#btnback2").hide();
        $("#btnadd2").show();
    });

    function loadMainSubMenuDropdown() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetMainSubMenuList",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var ddl = $('#ddlmainSubMenu');
                ddl.empty();
                ddl.append($('<option>', {
                    value: 0,
                    text: 'Select Main Sub Menu'
                }));

                $.each(response.d, function (i, item) {
                    ddl.append($('<option>', {
                        value: item.ID,
                        text: item.Name
                    }));
                });
            },
            error: function (xhr, status, error) {
                alert("Error: " + error);
            }
        });
    }

    BindNestedSubMenuOrder();
    dataView2();

    $('#ddlNestedSubMenutype').on('change', function () {
        var selectedValue = $(this).val();
        if (selectedValue == "1") {
            $('#txtnestedSubUrl').closest('.col-md-3').show();
        }
        else {
            $('#txtnestedSubUrl').closest('.col-md-3').hide();
        }
    });
    var initialVal = $('#ddlNestedSubMenutype').val();
    if (initialVal == "1") {
        $('#txtnestedSubUrl').closest('.col-md-3').show();
    } else {
        $('#txtnestedSubUrl').closest('.col-md-3').hide();
    }

    $('#txtNestedSubMenuorder').on('input', function () {
        var val = parseInt($(this).val());
        if (isNaN(val) || val <= 0) {
            $(this).val(1);
        }
    });
    function BindNestedSubMenuOrder() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetNestedSubMenuOrdertype",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var nextOrder = JSON.parse(response.d);
                $('#txtNestedSubMenuorder').val(nextOrder);
            },
            error: function (xhr, status, error) {
                alert("Error: " + error);
            }
        });
    }
    $('#btnNestedSubMenuLogview').on('click', function (e) {
        ViewData_LogNestedSub();
    });

    $('#btnNestedSubMenuSave').on('click', function (e) {
        var MainSubMenu = $('#ddlmainSubMenu').val();
        var NestedMenuName = $('#txtnestedsubmenuname').val();
        var NestedUrl = $('#txtnestedSubUrl').val();
        var NestedClasses = $('#txtNestedSubClass').val();
        var NestedStyle = $('#txtNestedSubStyle').val();
        var NestedStatus = $("input[name='dr_li2']:checked").val();
        var NestedMenuOrder = $('#txtNestedSubMenuorder').val();
        var NestedRemrks = $('#txtNestedSubremarks').val();
        var NestedSubMenuType1 = $('#ddlNestedSubMenutype').val();
        var NestedSubMenuType = $('#ddlNestedSubMenutype option:selected').text();
        if (MainSubMenu == '0') {
            showWarningmessage("Please Select the Main Sub menu name.!");
            return false;
        }
        if (NestedMenuName == '') {
            showWarningmessage("Please enter the Nested Sub menu name.!");
            return false;
        }
        if (NestedSubMenuType1 == '0') {
            showWarningmessage("Please enter the Nested Sub menu type.!");
            return false;
        }
        if (NestedSubMenuType1 == '1' && NestedUrl == '') {
            showWarningmessage("Please enter the Nested Sub URL.!");
            return false;
        }
        if (NestedSubMenuType1 == '2') {
            NestedUrl = '#';
        }
        if (NestedClasses == '') {
            showWarningmessage("Please enter the class.!");
            return false;
        }
        if (NestedStatus == '') {
            showWarningmessage("Please enter the status.!");
            return false;
        }
        if (NestedMenuOrder == '' || parseInt(NestedMenuOrder) <= 0) {
            showWarningmessage("Please enter a valid Nested Sub menu module Order greater than 0.!");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveNestedSubMenuDetails",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ MainSubMenu: MainSubMenu, NestedMenuName: NestedMenuName, NestedUrl: NestedUrl, NestedClasses: NestedClasses, NestedStyle: NestedStyle, NestedStatus: NestedStatus, NestedMenuOrder: NestedMenuOrder, NestedRemrks: NestedRemrks, NestedSubMenuType: NestedSubMenuType }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Save') {
                    var mes = "Nested Sub Menu Data Saved Successfully....! ";
                    showSuccessMessage(mes);
                }
                else if (data == 'Already Exits') {
                    var msg = "Same Nested Sub Menu Name Already Exits..!";
                    showInfoMessage(msg);
                }
                else {
                    var mes = "Nested Sub Menu data Not Saved...!";
                    showWarningmessage(mes);
                }
                $("#divrow2").show();
                $("#btnadd2").show();
                $("#divadd2").hide();
                $("#btnback2").hide();
                clr2();
                dataView2();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    $('#btnNestedSubMenuUpdate').on('click', function (e) {
        var MainSubMenuId = $('#' + SubMenuHiddenIdClientID).val();
        var MainSubMenu = $('#ddlmainSubMenu').val();
        var NestSubMenuName = $('#txtnestedsubmenuname').val();
        var NestedUrl = $('#txtnestedSubUrl').val();
        var NestedClasses = $('#txtNestedSubClass').val();
        var NestedStyle = $('#txtNestedSubStyle').val();
        var NestedStatus = $("input[name='dr_li2']:checked").val();
        var NestedMenuOrder = $('#txtNestedSubMenuorder').val();
        var NestedRemrks = $('#txtNestedSubremarks').val();
        var NestedSubMenuType1 = $('#ddlNestedSubMenutype').val();
        var NestedSubMenuType = $('#ddlNestedSubMenutype option:selected').text();
        if (MainSubMenu == '0') {
            showWarningmessage("Please Select the Main Sub menu name.!");
            return false;
        }
        if (NestSubMenuName == '') {
            showWarningmessage("Please enter the Nested Sub menu name.!");
            return false;
        }
        if (NestedSubMenuType1 == '0') {
            showWarningmessage("Please enter the Nested Sub menu type.!");
            return false;
        }
        if (NestedSubMenuType1 == '1' && NestedUrl == '') {
            showWarningmessage("Please enter the Nested  Sub URL.!");
            return false;
        }
        if (NestedSubMenuType1 == '2') {
            NestedUrl = '#';
        }
        if (NestedClasses == '') {
            showWarningmessage("Please enter the class.!");
            return false;
        }
        if (NestedStatus == '') {
            showWarningmessage("Please enter the status.!");
            return false;
        }
        if (NestedMenuOrder == '' || parseInt(NestedMenuOrder) <= 0) {
            showWarningmessage("Please enter a valid Nested Sub menu module Order greater than 0.!");
            return false;
        }

        var ID = $('#' + NestedMenuHiddenIdClient).val();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/UpdateNestedSubMenu",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                MainSubMenuId: MainSubMenuId,
                NestSubMenuName: NestSubMenuName,
                NestedUrl: NestedUrl,
                NestedClasses: NestedClasses,
                NestedStyle: NestedStyle,
                NestedStatus: NestedStatus,
                NestedMenuOrder: NestedMenuOrder,
                NestedRemrks: NestedRemrks,
                NestedSubMenuType: NestedSubMenuType,
                ID: ID
            }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Update') {
                    showSuccessMessage("Nested Sub Menu Data Updated Successfully....! ");
                }
                else if (data == 'Already Exits') {
                    showInfoMessage("Same Nested Sub Menu Name Already Exits..!");
                }
                else {
                    showWarningmessage("Nested Sub Menu data Not Updated...!");
                }
                $('#btnNestedSubMenuUpdate').hide();
                $('#btnNestedSubMenuSave').show();
                $("#divrow2").show();
                $("#btnadd2").show();
                $("#divadd2").hide();
                $("#btnback2").hide();
                clr2();
                dataView2();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    function dataView2() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewTable2",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    var msg = "No Data Found....!";
                    showInfoMessage(msg);
                }

                var data1 = JSON.parse(rawData);

                jquerydatatableNestedMenu(data1);

            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatableNestedMenu(data1) {
        if ($.fn.DataTable.isDataTable('#NestedSubMenuTable')) {
            $('#NestedSubMenuTable').DataTable().clear().destroy();
            $('#NestedSubMenuTable thead tr').empty();
        }
        if (data1.length > 0) {
            $('#tableHeadRow2').append('<th>Action</th>');
            $('#tableHeadRow2').append('<th>SlNo</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu ID</th>');
            $('#tableHeadRow2').append('<th>Sub Menu ID</th>');
            $('#tableHeadRow2').append('<th>Sub Menu</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Name</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Type</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Value</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu URL</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Class</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Style</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Status</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Order</th>');
            $('#tableHeadRow2').append('<th>Nested Sub Menu Remarks</th>');
            $('#tableHeadRow2').append('<th>AddBy</th>');
            $('#tableHeadRow2').append('<th>Addon</th>');


            var columns1 = [
                {
                    data: null,
                    orderable: false,
                    render: function (data, type, row, meta) {
                        return `<button type="button" class="btnEdit btn btn-secondary btn-sm">Edit</button>`;
                    }
                },
                {
                    data: null,
                    title: 'SlNo',
                    render: function (data1, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                { data: 'NESTSUBMENUID', visible: false },
                { data: 'SUBMENUID', visible: false },
                { data: 'MAIN_SUBMENU' },
                { data: 'NESTSUBMENU_NAME' },
                { data: 'NESTEDSUBMENU_TYPE' },
                { data: 'NESTSUBMENU_VALUE', visible: false },
                { data: 'NESTSUBMENU_URL' },
                { data: 'NESTSUBCLASSES' },
                { data: 'NESTSUBSTYLES' },
                { data: 'NESTSUBSTATUS' },
                { data: 'NESTSUBMENU_ORDER', visible: false },
                { data: 'NESTREMARK' },
                { data: 'NESTADDBY' },
                { data: 'ADDEDON' }

            ];
            var col = columns1.length;
            var table = $('#NestedSubMenuTable').DataTable({
                data: data1,
                columns: columns1,
                destroy: true,
                scrollX: true,
                scrollY: '400px',
                scrollCollapse: true,
                autoWidth: true,
                responsive: false,
                paging: false,
                info: false,
                fixedHeader: true,
                dom: '<"datatable-header pt-0 justify-content-start"f<"ms-sm-auto"l><"ms-sm-3"B>><"datatable-scroll-wrap"t><"datatable-footer"ip>',
                language: {
                    search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                    searchPlaceholder: 'Type to filter...',
                    lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                    paginate: { 'first': 'First', 'last': 'Last', 'next': document.dir == "rtl" ? '&larr;' : '&rarr;', 'previous': document.dir == "rtl" ? '&rarr;' : '&larr;' }
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
                            filename: 'NestedSubmenu',
                            autoFilter: true,
                            title: 'Nested Sub Menu',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            exportOptions: {
                                columns: [1, 4, 5, 7, 8, 9, 10, 12, 13, 14]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            filename: 'NestedSubmenu',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'Nested Sub Menu',
                            orientation: 'landscape',
                            pageSize: 'A4',
                            exportOptions: {
                                columns: [1, 4, 5, 7, 8, 9, 10, 12, 13, 14]
                            },
                            customize: function (doc) {
                                doc.defaultStyle.fontSize = 9;
                                doc.styles.tableHeader.fontSize = 10;
                                doc.styles.title.fontSize = 12;

                                const table = doc.content.find(c => c.table);
                            }

                        }
                    ]

                }
            });
            //setTimeout(() => table.columns.adjust().draw(), 4000);
            $('#NestedSubMenuTable tbody').on('click', '.btnEdit2', function () {
                var table = $('#NestedSubMenuTable').DataTable();
                var rowData = table.row($(this).closest('tr')).data();

                var IDS = rowData['NESTSUBMENUID'];
                $("#divrow2").hide();
                $("#btnadd2").hide();
                $("#divadd2").show();
                $("#btnback2").show();
                var MainSubMenu = rowData['MAIN_SUBMENU'];
                var SubId = rowData['SUBMENUID'];
                var NestSubMenuName = rowData['NESTSUBMENU_NAME'];
                var NestSubMenuType = rowData['NESTEDSUBMENU_TYPE'];
                var NestSubMenuUrl = rowData['NESTSUBMENU_URL'];
                var NestSubclases = rowData['NESTSUBCLASSES'];
                var NestSubstyle = rowData['NESTSUBSTYLES'];
                var NestSubStatus = rowData['NESTSUBSTATUS'];
                var NestedSubmenuOrder = rowData['NESTSUBMENU_ORDER'];
                var Nestremark = rowData['NESTREMARK'];

                $('#btnNestedSubMenuUpdate').show();
                $('#btnNestedSubMenuSave').hide();

                $('#ddlmainSubMenu').empty().append(`<option value="${SubId}" selected="selected">${MainSubMenu}</option>`);

                $('#' + SubMenuHiddenIdClientID).val(SubId);

                $('#txtnestedsubmenuname').val(NestSubMenuName);
                $('#ddlNestedSubMenutype option').each(function () {
                    if ($(this).text().trim() === NestSubMenuType.trim()) {
                        $('#ddlNestedSubMenutype').val($(this).val()).trigger("change");
                        return false;
                    }
                });
                $('#txtnestedSubUrl').val(NestSubMenuUrl);
                $('#txtNestedSubClass').val(NestSubclases);
                $('#txtNestedSubStyle').val(NestSubstyle);
                $('#rdlNestedSubStatus input[value="' + NestSubStatus + '"]').prop("checked", true);
                $('#txtNestedSubMenuorder').val(NestedSubmenuOrder);
                $('#txtNestedSubremarks').val(Nestremark);
                $('#' + NestedMenuHiddenIdClient).val(IDS);

                $('#<%= hdnActiveTab.ClientID %>').val('#js-tab3');
                localStorage.setItem("activeTab", "#js-tab3");
            });
        }

        else {
            var mes = "No Data";
            showInfoMessage(mes);
        }
    }

    function ViewData_LogNestedSub() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewDataLogNestedSub",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    swal({ title: "No data found", icon: 'info', timer: 2000 });
                    return;
                }

                var datas = JSON.parse(rawData);

                jquerydatatable_logNestedSub(datas);
                $('#modal_scrollable2').modal('show');
            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatable_logNestedSub(datas) {
        if ($.fn.DataTable.isDataTable('#Nested_LogTable')) {
            $('#Nested_LogTable').DataTable().clear().destroy();
            $('#Nested_LogTable thead tr').empty();
        }
        if (datas.length > 0) {
            var columns = [
                {
                    data: null,
                    title: 'SlNo',
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                { data: 'NESTSUBMENUID', title: 'Nested Sub Menu Id', visible: false },
                { data: 'MAIN_SUBMENU', title: 'Sub Menu' },
                { data: 'NESTSUBMENU_NAME', title: 'Nested Sub Menu Name' },
                { data: 'NESTEDSUBMENU_TYPE', title: 'Nested Sub Menu Type' },
                { data: 'NESTSUBMENU_VALUE', title: 'Nested Sub Menu Value', visible: false },
                { data: 'NESTSUBMENU_URL', title: 'Url' },
                { data: 'NESTSUBCLASSES', title: 'Class' },
                { data: 'NESTSUBSTYLES', title: 'Style' },
                { data: 'NESTSUBSTATUS', title: 'Status' },
                { data: 'NESTSUBMENU_ORDER', title: 'Nested Sub Menu Order', visible: false },
                { data: 'NESTREMARK', title: 'Remarks' },
                { data: 'ADDBY', title: 'AddBy' },
                { data: 'ADDEDON', title: 'AddOn' }
            ];
            var table = $('#Nested_LogTable').DataTable({
                data: datas,
                columns: columns,
                destroy: true,
                pageLength: 10,
                scrollCollapse: true,
                paging: false,
                info: false,
                autoWidth: true,
                responsive: true,
                dom: '<"datatable-header pt-0 justify-content-start"f<"ms-sm-auto"l><"ms-sm-3"B>><"datatable-scroll-wrap"t><"datatable-footer"ip>',
                language: {
                    search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                    searchPlaceholder: 'Type to filter...',
                    lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                    paginate: { 'first': 'First', 'last': 'Last', 'next': document.dir == "rtl" ? '&larr;' : '&rarr;', 'previous': document.dir == "rtl" ? '&rarr;' : '&larr;' }
                },
                buttons: [
                    {
                        extend: 'excelHtml5',
                        text: 'Excel <i class="ph-file-xls ms-2"></i>',
                        filename: 'NestedSubMenuLogData',
                        autoFilter: true,
                        title: 'Nested Sub Menu Log',
                        className: 'btn btn-success bg-success-subtle text-dark me-2',
                        exportOptions: {
                            columns: [0, 2, 3, 5, 6, 7, 8, 10, 11, 12]
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                        filename: 'NestedSubMenuLogData',
                        title: 'Nested Sub Menu Log',
                        orientation: 'landscape',
                        pageSize: 'A3',
                        className: 'btn btn-danger',
                        exportOptions: {
                            columns: [0, 2, 3, 5, 6, 7, 8, 10, 11, 12]
                        }
                    }
                ]
            });
        } else {
            swal({ title: "Empty data!", icon: 'info', timer: 2000 });
        }
    }
    function clr2() {
        $('#ddlmainSubMenu').val("0").trigger("change");
        loadMainSubMenuDropdown();
        $('#txtnestedsubmenuname').val('');
        $('#ddlNestedSubMenutype').val("0").trigger("change");
        $('#txtnestedSubUrl').val('');

        $('#txtNestedSubClass').val('');

        $('#txtNestedSubStyle').val('');
        $('#txtNestedSubMenuorder').val(1);
        $('#txtNestedSubremarks').val('');

        $("input[name='dr_li2']").prop("checked", false);
        $("input[name='dr_li2'][value='Active']").prop("checked", true);
        $('#' + NestedMenuHiddenIdClient).val('');
        $('#btnNestedSubMenuUpdate').hide();
        $('#btnNestedSubMenuSave').show();
        BindNestedSubMenuOrder();

    }

    

    $('#btnSaveNestedSubMenuOrder').on('click', function () {
        var orderedIds = $('#nestedSubMenuOrder li').map(function () {
            return $(this).data('id');
        }).get();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveNestedOrder",
            data: JSON.stringify({ orderedNestedIds: orderedIds }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (resp) {
                var result = resp.d;
                if (result === 'Success') {
                    showSuccessMessage('Nested Menu Order saved successfully.......!');
                    $('#nestedSubMenuOrderModal').modal('hide');
                } else {
                    showWarningmessage('Failed to save Nested Menu order.');
                }
            },
            error: function (err) {
                console.error("Error saving order:", err);
            }
        });
    });
});