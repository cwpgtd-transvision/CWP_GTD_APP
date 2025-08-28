$(document).ready(function () {
    $("#btnclear1").on('click', function () {
        clr1();
    });
    loadMainMenuDropdown();
    $("#btnadd1").on('click', function () {
        $("#divrow1").hide();
        $("#divadd1").show();
        $("#btnback1").show();
        $("#btnadd1").hide();
    });

    $("#btnback1").on('click', function () {
        $("#divrow1").show();
        $("#divadd1").hide();
        $("#btnback1").hide();
        $("#btnadd1").show();
    });


    function loadMainMenuDropdown() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetMainMenuList",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var ddl = $('#ddlmainMenu');
                ddl.empty();
                ddl.append($('<option>', {
                    value: 0,
                    text: 'Select Main Menu'
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

    BindSubMenuOrder();
    dataView1();

    $('#ddlSubMenutype').on('change', function () {
        var selectedValue = $(this).val();
        if (selectedValue == "1") {
            $('#txtSubUrl').closest('.col-md-3').show();
        }
        else {
            $('#txtSubUrl').closest('.col-md-3').hide();
        }
    });
    var initialVal = $('#ddlSubMenutype').val();
    if (initialVal == "1") {
        $('#txtSubUrl').closest('.col-md-3').show();
    } else {
        $('#txtSubUrl').closest('.col-md-3').hide();
    }

    $('#txtSubMenuorder').on('input', function () {
        var val = parseInt($(this).val());
        if (isNaN(val) || val <= 0) {
            $(this).val(1);
        }
    });
    function BindSubMenuOrder() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetSubMenuOrdertype",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var nextOrder = JSON.parse(response.d);
                $('#txtSubMenuorder').val(nextOrder);
            },
            error: function (xhr, status, error) {
                alert("Error: " + error);
            }
        });
    }
    $('#btnSubMenuLogview').on('click', function (e) {
        ViewData_LogSub();
    });

    $('#btnSubMenuSave').on('click', function (e) {
        var MainMenu = $('#ddlmainMenu').val();
        var SubMenuName = $('#txtsubmenuname').val();
        var SubMenuType1 = $('#ddlSubMenutype').val();
        var SubMenuType = $('#ddlSubMenutype option:selected').text();
        var SubUrl = $('#txtSubUrl').val();
        var SubClasses = $('#txtSubClass').val();
        var SubStyle = $('#txtSubStyle').val();
        var SubStatus = $("input[name='dr_li1']:checked").val();
        var SubMenuOrder = $('#txtSubMenuorder').val();
        var SubRemrks = $('#txtSubremarks').val();
        if (MainMenu == '0') {
            showWarningmessage("Please Select the Main menu name.!");
            return false;
        }
        if (SubMenuName == '') {
            showWarningmessage("Please enter the Sub menu name.!");
            return false;
        }
        if (SubMenuType1 == '0') {
            showWarningmessage("Please enter the Sub menu type.!");
            return false;
        }
        if (SubMenuType1 == '1' && SubUrl == '') {
            showWarningmessage("Please enter the Sub URL.!");
            return false;
        }
        if (SubMenuType1 == '2') {
            SubUrl = '#';
        }
        if (SubClasses == '') {
            showWarningmessage("Please enter the class.!");
            return false;
        }
        if (SubStatus == '') {
            showWarningmessage("Please enter the status.!");
            return false;
        }
        if (SubMenuOrder == '' || parseInt(SubMenuOrder) <= 0) {
            showWarningmessage("Please enter a valid menu module Order greater than 0.!");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveSubMenuDetails",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ MainMenu: MainMenu, SubMenuName: SubMenuName, SubMenuType: SubMenuType, SubUrl: SubUrl, SubClasses: SubClasses, SubStyle: SubStyle, SubStatus: SubStatus, SubMenuOrder: SubMenuOrder, SubRemrks: SubRemrks }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Save') {
                    var mes = "Sub Menu Data Saved Successfully....! ";
                    showSuccessMessage(mes);
                }
                else if (data == 'Already Exits') {
                    var msg = "Same Sub Menu Name Already Exits..!";
                    showInfoMessage(msg);
                }
                else {
                    var mes = "Sub Menu data Not Saved...!";
                    showWarningmessage(mes);
                }
                $("#divrow1").show();
                $("#btnadd1").show();
                $("#divadd1").hide();
                $("#btnback1").hide();
                clr1();
                dataView1();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    $('#btnSubMenuUpdate').on('click', function (e) {
        var MainMenuId = $('#' + menuHiddenIdClient1).val();
        var SubMenuName = $('#txtsubmenuname').val();
        var SubMenuType1 = $('#ddlSubMenutype').val();
        var SubMenuType = $('#ddlSubMenutype option:selected').text();
        var SubUrl = $('#txtSubUrl').val();
        var SubClasses = $('#txtSubClass').val();
        var SubStyle = $('#txtSubStyle').val();
        var SubStatus = $("input[name='dr_li1']:checked").val();
        var SubMenuOrder = $('#txtSubMenuorder').val();
        var SubRemrks = $('#txtSubremarks').val();

        if (MainMenuId == '' || MainMenuId == '0' || MainMenuId == null) {
            showWarningmessage("Please Select the Main menu name.!");
            return false;
        }
        if (SubMenuName == '') {
            showWarningmessage("Please enter the Sub menu name.!");
            return false;
        }
        if (SubMenuType1 == '0') {
            showWarningmessage("Please enter the Sub menu type.!");
            return false;
        }
        if (SubMenuType1 == '1' && SubUrl == '') {
            showWarningmessage("Please enter the Sub URL.!");
            return false;
        }
        if (SubMenuType1 == '2') {
            SubUrl = '#';
        }
        if (SubClasses == '') {
            showWarningmessage("Please enter the class.!");
            return false;
        }
        if (SubStatus == '') {
            showWarningmessage("Please enter the status.!");
            return false;
        }
        if (SubMenuOrder == '' || parseInt(SubMenuOrder) <= 0) {
            showWarningmessage("Please enter a valid menu module Order greater than 0.!");
            return false;
        }

        var ID = $('#' + subMenuHiddenIdClient).val();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/UpdateSubMenu",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                MainMenuId: MainMenuId,
                SubMenuName: SubMenuName,
                SubMenuType: SubMenuType,
                SubUrl: SubUrl,
                SubClasses: SubClasses,
                SubStyle: SubStyle,
                SubStatus: SubStatus,
                SubMenuOrder: SubMenuOrder,
                SubRemrks: SubRemrks,
                ID: ID
            }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Update') {
                    showSuccessMessage("Sub Menu Data Updated Successfully....! ");
                }
                else if (data == 'Already Exits') {
                    showInfoMessage("Same Sub Menu Name Already Exits..!");
                }
                else {
                    showWarningmessage("Sub Menu data Not Updated...!");
                }
                $('#btnSubMenuUpdate').hide();
                $('#btnSubMenuSave').show();
                $("#divrow1").show();
                $("#btnadd1").show();
                $("#divadd1").hide();
                $("#btnback1").hide();
                clr1();
                dataView1();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    function dataView1() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewTable1",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    var msg = "No Data Found....!";
                    showInfoMessage(msg);
                }

                var data1 = JSON.parse(rawData);

                jquerydatatableSubMenu(data1);

            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatableSubMenu(data1) {
        if ($.fn.DataTable.isDataTable('#SubMenuTable')) {
            $('#SubMenuTable').DataTable().clear().destroy();
            $('#SubMenuTable thead tr').empty();
        }
        if (data1.length > 0) {
            $('#tableHeadRow1').append('<th>Action</th>');
            $('#tableHeadRow1').append('<th>SlNo</th>');
            $('#tableHeadRow1').append('<th>Sub Menu ID</th>');
            $('#tableHeadRow1').append('<th>Menu ID</th>');
            $('#tableHeadRow1').append('<th>Main Menu</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Name</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Value</th>');
            $('#tableHeadRow1').append('<th>SubMenu Type</th>');
            $('#tableHeadRow1').append('<th>Sub Menu URL</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Class</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Style</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Status</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Order</th>');
            $('#tableHeadRow1').append('<th>Nested Sub Menu Id</th>');
            $('#tableHeadRow1').append('<th>Sub Menu Remarks</th>');
            $('#tableHeadRow1').append('<th>AddBy</th>');
            $('#tableHeadRow1').append('<th>Addon</th>');


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
                { data: 'SUBMENUID', visible: false },
                { data: 'MENUID', visible: false },
                { data: 'MAIN_MENU' },
                { data: 'SUBMENU_NAME' },
                { data: 'SUBMENU_VALUE', visible: false },
                { data: 'SUBMENU_TYPE' },
                { data: 'SUBMENU_URL' },
                { data: 'SUBCLASSES' },
                { data: 'SUBSTYLES' },
                { data: 'SUBSTATUS' },
                { data: 'SUBMENU_ORDER', visible: false },
                { data: 'NESTEDSUBMENU_ID', visible: false },
                { data: 'REMARK' },
                { data: 'ADDBY' },
                { data: 'ADDEDON' }

            ];
            var col = columns1.length;
            var table = $('#SubMenuTable').DataTable({
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
                            filename: 'Submenu',
                            autoFilter: true,
                            title: 'SubMenu',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            exportOptions: {
                                columns: [1, 3, 4, 6, 7, 8, 9, 13, 14, 15]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            filename: 'Submenu',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'SubMenu',
                            orientation: 'landscape',
                            pageSize: 'A4',
                            exportOptions: {
                                columns: [1, 3, 4, 6, 7, 8, 9, 13, 14, 15]
                            },
                            customize: function (doc) {
                                doc.defaultStyle.fontSize = 9;
                                doc.styles.tableHeader.fontSize = 10;
                                doc.styles.title.fontSize = 12;

                                const table = doc.content.find(c => c.table);
                                if (table && table.table && table.table.body && table.table.body.length > 0) {
                                    table.table.widths = ['5%', '15%', '10%', '10%', '10%', '10%', '10%', '10%', '10%', '10%'];
                                }
                            }

                        }
                    ]

                }
            });
            setTimeout(() => table.columns.adjust().draw(), 2000);
            $('#SubMenuTable tbody').on('click', '.btnEdit1', function () {
                var table = $('#SubMenuTable').DataTable();
                var rowData = table.row($(this).closest('tr')).data();

                var IDS = rowData['SUBMENUID'];
                $("#divrow1").hide();
                $("#btnadd1").hide();
                $("#divadd1").show();
                $("#btnback1").show();
                var MainMenu = rowData['MAIN_MENU'];
                var MenuId = rowData['MENUID'];

                var SubMenuName = rowData['SUBMENU_NAME'];
                var SubMenuType = rowData['SUBMENU_TYPE'];
                var SubMenuUrl = rowData['SUBMENU_URL'];
                var Subclases = rowData['SUBCLASSES'];
                var Substyle = rowData['SUBSTYLES'];
                var Substatus = rowData['SUBSTATUS'];
                var SubmenuOrder = rowData['SUBMENU_ORDER'];
                var remark = rowData['REMARK'];

                $('#btnSubMenuUpdate').show();
                $('#btnSubMenuSave').hide();

                $('#ddlmainMenu').empty().append(`<option value="${MenuId}" selected="selected">${MainMenu}</option>`);

                $('#' + menuHiddenIdClient1).val(MenuId);
                $('#txtsubmenuname').val(SubMenuName);

                $('#ddlSubMenutype option').each(function () {
                    if ($(this).text().trim() === SubMenuType.trim()) {
                        $('#ddlSubMenutype').val($(this).val()).trigger("change");
                        return false;
                    }
                });

                $('#txtSubUrl').val(SubMenuUrl);
                $('#txtSubClass').val(Subclases);
                $('#txtSubStyle').val(Substyle);
                $('#rdlSubStatus input[value="' + Substatus + '"]').prop("checked", true);
                $('#txtSubMenuorder').val(SubmenuOrder);
                $('#txtSubremarks').val(remark);
                $('#' + subMenuHiddenIdClient).val(IDS);

                $('#<%= hdnActiveTab.ClientID %>').val('#js-tab2');
                localStorage.setItem("activeTab", "#js-tab2");
            });
        }

        else {
            var mes = "No Data";
            showInfoMessage(mes);
        }
    }

    function ViewData_LogSub() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewDataLogSub",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    swal({ title: "No data found", icon: 'info', timer: 2000 });
                    return;
                }

                var datas = JSON.parse(rawData);

                jquerydatatable_logSub(datas);
                $('#modal_scrollable1').modal('show');
            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatable_logSub(datas) {
        if ($.fn.DataTable.isDataTable('#Menu_LogTable1')) {
            $('#Menu_LogTable1').DataTable().clear().destroy();
            $('#Menu_LogTable1 thead tr').empty();
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
                { data: 'SUBMENUID', title: 'Sub Menu Id', visible: false },
                { data: 'MAIN_MENU', title: 'Main Menu' },
                { data: 'SUBMENU_NAME', title: 'Sub Menu Name' },
                { data: 'SUBMENU_VALUE', title: 'Sub Menu Value', visible: false },
                { data: 'SUBMENU_TYPE', title: 'Sub Menu Type' },
                { data: 'SUBMENU_URL', title: 'Url' },
                { data: 'SUBCLASSES', title: 'Class' },
                { data: 'SUBSTYLES', title: 'Style' },
                { data: 'SUBSTATUS', title: 'Status' },
                { data: 'SUBMENU_ORDER', title: 'Sub Menu Order', visible: false },
                { data: 'NESTEDSUBMENU_ID', title: 'Nested Sub Menu Id', visible: false },
                { data: 'REMARK', title: 'Remarks' },
                { data: 'ADDBY', title: 'AddBy' },
                { data: 'ADDEDON', title: 'AddOn' }
            ];
            var table = $('#Menu_LogTable1').DataTable({
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
                        filename: 'SubMenuLogData',
                        autoFilter: true,
                        title: 'Sub Menu Log',
                        className: 'btn btn-success bg-success-subtle text-dark me-2',
                        exportOptions: {
                            columns: [0, 2, 3, 5, 6, 7, 8, 9, 12, 13, 14]
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                        filename: 'SubMenuLogData',
                        title: 'Sub Menu Log',
                        orientation: 'landscape',
                        pageSize: 'A4',
                        className: 'btn btn-danger',
                        exportOptions: {
                            columns: [0, 2, 3, 5, 6, 7, 8, 9, 12, 13, 14]
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
    function clr1() {
        $('#ddlmainMenu').val("0").trigger("change");

        $('#txtsubmenuname').val('');

        $('#ddlSubMenutype').val("0").trigger("change");
        loadMainMenuDropdown();

        $('#txtSubUrl').val('');

        $('#txtSubClass').val('');

        $('#txtSubStyle').val('');
        $('#txtSubMenuorder').val(1);
        $('#txtSubremarks').val('');

        $("input[name='dr_li1']").prop("checked", false);
        $("input[name='dr_li1'][value='Active']").prop("checked", true);
        $('#' + subMenuHiddenIdClient).val('');
        $('#btnSubMenuUpdate').hide();
        $('#btnSubMenuSave').show();
        BindSubMenuOrder();
    }

    $('#btnSubOrder').on('click', function () {
        $('#subMenuOrderModal').modal('show');

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetAllSubMenus",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var submenus = response.d;
                var list = $('#subMenuOrder');
                list.empty();

                $.each(submenus, function (i, submenu) {
                    list.append($('<li>', {
                        class: 'list-group-item d-flex align-items-center',
                        'data-id': submenu.ID,
                        html: '<i class="fa-solid fa-circle small text-primary me-2"></i>' + submenu.Name
                    }));
                });
            },
            error: function (xhr, status, error) {
                showWarningmessage("Error: " + error);
            }
        });
    });



    $('#btnSaveSubMenuOrder').on('click', function () {
        var orderedId = $('#subMenuOrder li').map(function () {
            return $(this).data('id');
        }).get();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveSubMenuOrder",
            data: JSON.stringify({ orderedSubMenuIds: orderedId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (resp) {
                var result = resp.d;
                if (result === 'Success') {
                    showSuccessMessage('Sub Menu Order saved successfully.......!');
                    $('#subMenuOrderModal').modal('hide');
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
