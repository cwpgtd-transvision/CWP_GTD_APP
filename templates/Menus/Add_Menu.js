
$(document).ready(function () {
    $("#btnclear").on('click', function () {
        clr();
    });
    $("#btnadd").on('click', function () {
        $("#divrow").hide();
        $("#divadd").show();
        $("#btnback").show();
        $("#btnadd").hide();
    });

    $("#btnback").on('click', function () {
        $("#divrow").show();
        $("#divadd").hide();
        $("#btnback").hide();
        $("#btnadd").show();
    });
    $('.close').on('click', function (e) {
        $('#modal_scrollable').modal('hide');
    });
    BindMenuOrder();
    dataView();
    $('#ddlMenutype').on('change', function () {
        var selectedValue = $(this).val();
        if (selectedValue == "1") {
            $('#txtUrl').closest('.col-md-3').show();
        } else {
            $('#txtUrl').closest('.col-md-3').hide();
        }
    });
    var initialVal = $('#ddlMenutype').val();
    if (initialVal == "1") {
        $('#txtUrl').closest('.col-md-3').show();
    } else {
        $('#txtUrl').closest('.col-md-3').hide();
    }

    $('#txtMenuorder').on('input', function () {
        var val = parseInt($(this).val());
        if (isNaN(val) || val <= 0) {
            $(this).val(1);
        }
    });
    function BindMenuOrder() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetMenuOrdertype",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var nextOrder = JSON.parse(response.d);
                $('#txtMenuorder').val(nextOrder);
            },
            error: function (xhr, status, error) {
                alert("Error: " + error);
            }
        });
    }



    $('#btnUpdate').on('click', function (e) {
        var MenuName = $('#txtmenuname').val();
        var MenuType = $('#ddlMenutype option:selected').text();
        var MenuType1 = $('#ddlMenutype').val();
        var Url = $('#txtUrl').val();
        var Classes = $('#txtClass').val();
        var Style = $('#txtStyle').val();
        var Status = $("input[name='dr_li']:checked").val();
        var MenuOrder = $('#txtMenuorder').val();
        var Remrks = $('#txtremarks').val();

        if (MenuName == '') {
            showValidationWarning("Please enter the menu name.!");
            return false;
        }
        if (MenuType1 == '0') {
            showValidationWarning("Please enter the menu type.!");
            return false;
        }
        if (MenuType1 == '1' && Url == '') {
            showValidationWarning("Please enter the URL.!");
            return false;
        }
        if (MenuType1 == '2') {
            Url = '#';
        }
        if (Classes == '') {
            showValidationWarning("Please enter the class.!");
            return false;
        }
        if (Status == '') {
            showValidationWarning("Please enter the status.!");
            return false;
        }
        if (MenuOrder == '' || parseInt(MenuOrder) <= 0) {
            showValidationWarning("Please enter a valid menu module Order greater than 0.!");
            return false;
        }
        var ID = $('#' + menuHiddenIdClient).val();
        //var ID = $('#' + menuHiddenIdClient).val();
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/UpdateMenu",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                MenuName: MenuName, MenuType: MenuType, Url: Url, Classes: Classes,
                Style: Style, Status: Status, MenuOrder: MenuOrder, Remrks: Remrks, ID: ID
            }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Update') {
                    var mes = "Menu Data Updated Successfully....! ";
                    showSuccessMessage(mes);
                }
                else if (data == 'Already Exits') {
                    var msg = "Same Menu Name Already Exits..!";
                    showInfoMessage(msg);
                }
                else {
                    var mes = "Menu data Not Updated...!";
                    showValidationWarning(mes);
                }
                $('#btnUpdate').hide();
                $('#btnSave').show();
                $("#divrow").show();
                $("#btnadd").show();
                $("#divadd").hide();
                $("#btnback").hide();
                clr();
                dataView();
            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    });

    $('#btnLogview').on('click', function (e) {
        ViewData_Log();
    });

    $('#btnSave').on('click', function (e) {
        var MenuName = $('#txtmenuname').val();
        var MenuType1 = $('#ddlMenutype').val();
        var MenuType = $('#ddlMenutype option:selected').text();
        var Url = $('#txtUrl').val();
        var Classes = $('#txtClass').val();
        var Style = $('#txtStyle').val();
        var Status = $("input[name='dr_li']:checked").val();
        var MenuOrder = $('#txtMenuorder').val();
        var Remrks = $('#txtremarks').val();
        if (MenuName == '') {
            showValidationWarning("Please enter the menu name.!");
            return false;
        }
        if (MenuType1 == '0') {
            showValidationWarning("Please enter the menu type.!");
            return false;
        }
        if (MenuType1 == '1' && Url == '') {
            showValidationWarning("Please enter the URL.!");
            return false;
        }
        if (MenuType1 == '2') {
            Url = '#';
        }
        if (Classes == '') {
            showValidationWarning("Please enter the class.!");
            return false;
        }
        if (Status == '') {
            showValidationWarning("Please enter the status.!");
            return false;
        }
        if (MenuOrder == '' || parseInt(MenuOrder) <= 0) {
            showValidationWarning("Please enter a valid menu module Order greater than 0.!");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveMenuDetails",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ MenuName: MenuName, MenuType: MenuType, Url: Url, Classes: Classes, Style: Style, Status: Status, MenuOrder: MenuOrder, Remrks: Remrks }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Save') {
                    var mes = "Menu Data Saved Successfully....! ";
                    showSuccessMessage(mes);
                }
                else if (data == 'Already Exits') {
                    var msg = "Same Menu Name Already Exits..!";
                    showInfoMessage(msg);
                }
                else {
                    var mes = "Menu data Not Saved...!";
                    showValidationWarning(mes);
                }
                $("#divrow").show();
                $("#btnadd").show();
                $("#divadd").hide();
                $("#btnback").hide();
                clr();
                dataView();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    function dataView() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewTable",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    var msg = "No Data Found....!";
                    showInfoMessage(msg);
                }

                var data = JSON.parse(rawData);

                jquerydatatable(data);

            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatable(data) {
        if ($.fn.DataTable.isDataTable('#MenuTable')) {
            $('#MenuTable').DataTable().clear().destroy();
            $('#MenuTable thead tr').empty();
        }
        if (data.length > 0) {
            $('#tableHeadRow').append('<th>Action</th>');
            $('#tableHeadRow').append('<th>SlNo</th>');
            $('#tableHeadRow').append('<th>Menu ID</th>');
            $('#tableHeadRow').append('<th>Menu Name</th>');
            $('#tableHeadRow').append('<th>Menu Value</th>');
            $('#tableHeadRow').append('<th>Menu Type</th>');
            $('#tableHeadRow').append('<th>Menu URL</th>');
            $('#tableHeadRow').append('<th>Class</th>');
            $('#tableHeadRow').append('<th>Style</th>');
            $('#tableHeadRow').append('<th>Status</th>');
            $('#tableHeadRow').append('<th>Menu Order</th>');
            $('#tableHeadRow').append('<th>Sub Menu Id</th>');
            $('#tableHeadRow').append('<th>Remarks</th>');
            $('#tableHeadRow').append('<th>AddBy</th>');
            $('#tableHeadRow').append('<th>Addon</th>');


            var columns = [
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
                    render: function (data, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                { data: 'MENUID', visible: false },
                { data: 'MENU_NAME' },
                { data: 'MENU_VALUE', visible: false },
                { data: 'MENU_TYPE' },
                { data: 'MENU_URL' },
                { data: 'CLASSES' },
                { data: 'STYLES' },
                { data: 'STATUS' },
                { data: 'MENU_ORDER', visible: false },
                { data: 'SUB_MENUID', visible: false },
                { data: 'REMARK' },
                { data: 'ADDBY' },
                { data: 'ADDEDON' }

            ];
            var col = columns.length;
            var table = $('#MenuTable').DataTable({
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
                            filename: 'MenuData',
                            autoFilter: true,
                            title: 'Menu',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            exportOptions: {
                                columns: [1, 3, 5, 6, 7, 8, 9, 12, 13, 14]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            filename: 'MenuData',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'Menu',
                            orientation: 'landscape',
                            pageSize: 'A4',
                            exportOptions: {
                                columns: [1, 3, 5, 6, 7, 8, 9, 12, 13, 14]
                            },
                            customize: function (doc) {
                                doc.defaultStyle.fontSize = 9;
                                doc.styles.tableHeader.fontSize = 10;
                                doc.styles.title.fontSize = 12;

                                const table = doc.content.find(c => c.table);
                                if (table && table.table && table.table.body && table.table.body.length > 0) {
                                    const columnCount = table.table.body[0].length;
                                    table.table.widths = Array(columnCount).fill('*');
                                }
                            }
                        }
                    ]

                }
            });
            $('#MenuTable tbody').on('click', '.btnEdit', function () {

                var table = $('#MenuTable').DataTable();
                var rowData = table.row($(this).closest('tr')).data();

                var IDS = rowData['MENUID'];
                $("#divrow").hide();
                $("#btnadd").hide();
                $("#divadd").show();
                $("#btnback").show();
                var MenuName = rowData['MENU_NAME'];
                var MenuType = rowData['MENU_TYPE'];
                var MenuUrl = rowData['MENU_URL'];
                var clases = rowData['CLASSES'];
                var style = rowData['STYLES'];
                var status = rowData['STATUS'];
                var menuOrder = rowData['MENU_ORDER'];
                var remark = rowData['REMARK'];

                $('#btnUpdate').show();
                $('#btnSave').hide();
                $('#txtmenuname').val(MenuName);
                $('#ddlMenutype option').each(function () {
                    if ($(this).text().trim() === MenuType.trim()) {
                        $('#ddlMenutype').val($(this).val()).trigger("change");
                        return false;
                    }
                });
                $('#txtUrl').val(MenuUrl);
                $('#txtClass').val(clases);
                $('#txtStyle').val(style);
                $('#rdlStatus input[value="' + status + '"]').prop("checked", true);
                $('#txtMenuorder').val(menuOrder);
                $('#txtremarks').val(remark);
                $('#' + menuHiddenIdClient).val(IDS);
                $('#<%= hdnActiveTab.ClientID %>').val('#js-tab1');

            });
        }

        else {
            var mes = "No Data";
            showInfoMessage(mes);
        }
    }
    function ViewData_Log() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewDataLog",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    swal({ title: "No data found", icon: 'info', timer: 2000 });
                    return;
                }

                var data = JSON.parse(rawData);

                jquerydatatable_log(data);
                $('#modal_scrollable').modal('show');
            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatable_log(data) {
        console.log('hi');

        if ($.fn.DataTable.isDataTable('#Menu_LogTable')) {
            $('#Menu_LogTable').DataTable().clear().destroy();
            $('#Menu_LogTable thead tr').empty();
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
                { data: 'MENUID', title: 'Menu Id', visible: false },
                { data: 'MENU_NAME', title: 'Menu Name' },
                { data: 'MENU_VALUE', title: 'Menu Value', visible: false },
                { data: 'MENU_TYPE', title: 'Menu Type' },
                { data: 'MENU_URL', title: 'Url' },
                { data: 'CLASSES', title: 'Class' },
                { data: 'STYLES', title: 'Style' },
                { data: 'STATUS', title: 'Status' },
                { data: 'MENU_ORDER', title: 'Menu Order', visible: false },
                { data: 'SUB_MENUID', title: 'Sub Menu Id', visible: false },
                { data: 'REMARK', title: 'Remarks' },
                { data: 'ADDBY', title: 'AddBy' },
                { data: 'ADDEDON', title: 'AddOn' }
            ];
            var table = $('#Menu_LogTable').DataTable({
                data: data,
                columns: columns,
                destroy: true,
                pageLength: 10,
                scrollCollapse: true,
                paging: false,
                info: false,
                autoWidth: false,
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
                        filename: 'MenuLogData',
                        autoFilter: true,
                        title: 'Menu Log',
                        className: 'btn btn-success bg-success-subtle text-dark me-2',
                        exportOptions: {
                            columns: [0, 2, 4, 5, 6, 7, 8, 11, 12, 13]
                        }

                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                        filename: 'MenuLogData',
                        orientation: 'landscape',
                        pageSize: 'A4',
                        title: 'Menu Log',
                        className: 'btn btn-danger',
                        exportOptions: {
                            columns: [0, 2, 4, 5, 6, 7, 8, 11, 12, 13]
                        },

                        customize: function (doc) {
                            doc.defaultStyle.fontSize = 9;
                            doc.styles.tableHeader.fontSize = 10;
                            doc.styles.title.fontSize = 12;

                            const table = doc.content.find(c => c.table);
                            if (table && table.table && table.table.body && table.table.body.length > 0) {
                                const columnCount = table.table.body[0].length;
                                table.table.widths = Array(columnCount).fill('*');
                            }
                        }
                    }
                ]
            });
        } else {
            swal({ title: "Empty data!", icon: 'info', timer: 2000 });
        }
    }
    function clr() {
        $('#txtmenuname').val('');
        $('#ddlMenutype').val("0").trigger("change");
        $('#txtUrl').val('');
        $('#txtClass').val('');
        $('#txtStyle').val('');
        $('#txtMenuorder').val('1');
        $('#txtremarks').val('');
        $("input[name='dr_li']").prop("checked", false);
        $("input[name='dr_li'][value='Active']").prop("checked", true);
        $('#' + menuHiddenIdClient).val('');
        $('#btnUpdate').hide();
        $('#btnSave').show();
        BindMenuOrder();
    }



    $('#btnMenuOrder').on('click', function () {
        $('#menuOrderModal').modal('show');

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetAllMenus",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var menus = response.d;
                var list = $('#menuOder');
                list.empty();

                $.each(menus, function (i, menu) {
                    var li = $('<li>', {
                        class: 'list-group-item d-flex align-items-center',
                        'data-id': menu.MENUID,
                        html: '<i class="fa-solid fa-circle small text-primary me-2"></i>' + menu.MENU_NAME
                    });
                    list.append(li);
                });

            },
            error: function (xhr, status, error) {
                showWarningmessage("Error: " + error);
            }
        });
    });



    $('#btnSaveMenuOrder').on('click', function () {
        var orderedIds = $('#menuOder li').map(function () {
            return $(this).data('id');
        }).get();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveMenuOrder",
            data: JSON.stringify({ orderedMenuIds: orderedIds }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (resp) {
                var result = resp.d;
                if (result === 'Success') {
                    showSuccessMessage('Menu Order saved successfully.......!');
                    $('#menuOrderModal').modal('hide');
                } else {
                    showWarningmessage('Failed to save Menu order.');
                }
            },
            error: function (err) {
                console.error("Error saving order:", err);
            }
        });
    });


});