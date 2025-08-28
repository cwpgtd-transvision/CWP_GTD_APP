$(document).ready(function () {
    $("#btnclear3").on('click', function () {
        clr3();
    });
    loadNestedSubMenuDropdown();
    $("#btnadd3").on('click', function () {
        $("#divrow3").hide();
        $("#divadd3").show();
        $("#btnback3").show();
        $("#btnadd3").hide();
    });

    $("#btnback3").on('click', function () {
        $("#divrow3").show();
        $("#divadd3").hide();
        $("#btnback3").hide();
        $("#btnadd3").show();
    });


    function loadNestedSubMenuDropdown() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetNestedSubMenuList",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var ddl = $('#ddlNestedSubMenu');
                ddl.empty();
                ddl.append($('<option>', {
                    value: 0,
                    text: 'Select Nested Sub Menu'
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

    BindDeepNestedSubMenuOrder();
    dataView3();


    $('#txtDeepNestedSubMenuorder').on('input', function () {
        var val = parseInt($(this).val());
        if (isNaN(val) || val <= 0) {
            $(this).val(1);
        }
    });
    function BindDeepNestedSubMenuOrder() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetDeepNestedSubMenuOrdertype",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var nextOrder = JSON.parse(response.d);
                $('#txtDeepNestedSubMenuorder').val(nextOrder);
            },
            error: function (xhr, status, error) {
                alert("Error: " + error);
            }
        });
    }
    $('#btnDeepNestedSubMenuLogview').on('click', function (e) {
        ViewData_LogDeepNestedSub();
    });

    $('#btnDeepNestedSubMenuSave').on('click', function (e) {
        var NestedSubMenu = $('#ddlNestedSubMenu').val();
        var DeepNestedMenuName = $('#txtdeepnestedsubmenuname').val();
        var DeepNestedUrl = $('#txtDeepnestedSubUrl').val();
        var DeepNestedClasses = $('#txtDeepNestedSubClass').val();
        var DeepNestedStyle = $('#txtDeepNestedSubStyle').val();
        var DeepNestedStatus = $("input[name='dr_li3']:checked").val();
        var DeepNestedMenuOrder = $('#txtDeepNestedSubMenuorder').val();
        var DeepNestedRemrks = $('#txtDeepNestedSubremarks').val();
        if (NestedSubMenu == '0') {
            showWarningmessage("Please Select the Nested Sub menu name.!");
            return false;
        }
        if (DeepNestedMenuName == '') {
            showWarningmessage("Please enter the Deep Nested Sub menu name.!");
            return false;
        }
        if (DeepNestedUrl == '') {
            showWarningmessage("Please enter the Deep Nested Sub URL.!");
            return false;
        }
        if (DeepNestedClasses == '') {
            showWarningmessage("Please enter the class.!");
            return false;
        }
        if (DeepNestedStatus == '') {
            showWarningmessage("Please enter the status.!");
            return false;
        }
        if (DeepNestedMenuOrder == '' || parseInt(DeepNestedMenuOrder) <= 0) {
            showWarningmessage("Please enter a valid Deep Nested Sub menu module Order greater than 0.!");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveDeepNestedSubMenuDetails",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                NestedSubMenu: NestedSubMenu, DeepNestedMenuName: DeepNestedMenuName, DeepNestedUrl: DeepNestedUrl,
                DeepNestedClasses: DeepNestedClasses, DeepNestedStyle: DeepNestedStyle, DeepNestedStatus: DeepNestedStatus,DeepNestedMenuOrder: DeepNestedMenuOrder, DeepNestedRemrks: DeepNestedRemrks
            }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Save') {
                    var mes = "Deep Nested Sub Menu Data Saved Successfully....! ";
                    showSuccessMessage(mes);
                }
                else if (data == 'Already Exits') {
                    var msg = "Same Deep Nested Sub Menu Name Already Exits..!";
                    showInfoMessage(msg);
                }
                else {
                    var mes = "Deep Nested Sub Menu data Not Saved...!";
                    showWarningmessage(mes);
                }
                $("#divrow3").show();
                $("#btnadd3").show();
                $("#divadd3").hide();
                $("#btnback3").hide();
                clr3();
                dataView3();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    $('#btnDeepNestedSubMenuUpdate').on('click', function (e) {
        var NestedSubMenuId = $('#' + NestedMenuIdClientID).val();
        var NestedSubMenu = $('#ddlNestedSubMenu').val();
        var DeepNestSubMenuName = $('#txtdeepnestedsubmenuname').val();
        var DeepNestedUrl = $('#txtDeepnestedSubUrl').val();
        var DeepNestedClasses = $('#txtDeepNestedSubClass').val();
        var DeepNestedStyle = $('#txtDeepNestedSubStyle').val();
        var DeepNestedStatus = $("input[name='dr_li3']:checked").val();
        var DeepNestedMenuOrder = $('#txtDeepNestedSubMenuorder').val();
        var DeepNestedRemrks = $('#txtDeepNestedSubremarks').val();
        if (NestedSubMenu == '0') {
            showWarningmessage("Please Select the Nested Sub menu name.!");
            return false;
        }
        if (DeepNestSubMenuName == '') {
            showWarningmessage("Please enter the Deep Nested Sub menu name.!");
            return false;
        }
        if (DeepNestedUrl == '') {
            showWarningmessage("Please enter the Deep Nested  Sub URL.!");
            return false;
        }
        if (DeepNestedClasses == '') {
            showWarningmessage("Please enter the class.!");
            return false;
        }
        if (DeepNestedStatus == '') {
            showWarningmessage("Please enter the status.!");
            return false;
        }
        if (DeepNestedMenuOrder == '' || parseInt(DeepNestedMenuOrder) <= 0) {
            showWarningmessage("Please enter a valid Deep Nested Sub menu module Order greater than 0.!");
            return false;
        }

        var ID = $('#' + DeepsubMenuHiddenIdClientID).val();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/UpdateDeepNestedSubMenu",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                NestedSubMenuId: NestedSubMenuId,
                DeepNestSubMenuName: DeepNestSubMenuName,
                DeepNestedUrl: DeepNestedUrl,
                DeepNestedClasses: DeepNestedClasses,
                DeepNestedStyle: DeepNestedStyle,
                DeepNestedStatus: DeepNestedStatus,
                DeepNestedMenuOrder: DeepNestedMenuOrder,
                DeepNestedRemrks: DeepNestedRemrks,
                ID: ID
            }),
            dataType: "json",
            success: function (response) {
                var data = response.d;
                if (data == 'Update') {
                    showSuccessMessage("Deep Nested Sub Menu Data Updated Successfully....! ");
                }
                else if (data == 'Already Exits') {
                    showInfoMessage("Same Deep Nested Sub Menu Name Already Exits..!");
                }
                else {
                    showWarningmessage("Deep Nested Sub Menu data Not Updated...!");
                }
                $('#btnDeepNestedSubMenuUpdate').hide();
                $('#btnDeepNestedSubMenuSave').show();
                $("#divrow3").show();
                $("#btnadd3").show();
                $("#divadd3").hide();
                $("#btnback3").hide();
                clr3();
                dataView3();
            },
            error: function (error) {
                console.error("Error fetching data:", error);
            }
        });
    });

    function dataView3() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewTable3",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    var msg = "No Data Found....!";
                    showInfoMessage(msg);
                }

                var data1 = JSON.parse(rawData);

                jquerydatatableDeepNestedMenu(data1);

            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatableDeepNestedMenu(data1) {
        if ($.fn.DataTable.isDataTable('#DeepNestedSubMenuTable')) {
            $('#DeepNestedSubMenuTable').DataTable().clear().destroy();
            $('#DeepNestedSubMenuTable thead tr').empty();
        }
        if (data1.length > 0) {
            $('#tableHeadRow3').append('<th>Action</th>');
            $('#tableHeadRow3').append('<th>SlNo</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu ID</th>');
            $('#tableHeadRow3').append('<th>Nested Sub Menu ID</th>');
            $('#tableHeadRow3').append('<th>Nested Sub Menu</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Name</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Value</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu URL</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Class</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Style</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Status</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Order</th>');
            $('#tableHeadRow3').append('<th>Deep Nested Sub Menu Remarks</th>');
            $('#tableHeadRow3').append('<th>AddBy</th>');
            $('#tableHeadRow3').append('<th>Addon</th>');


            var columns1 = [
                {
                    data: null,
                    orderable: false,
                    render: function (data, type, row, meta) {
                        return `<button type="button" class="btnEdit3 btn btn-sm btn-success me-1">Edit</button>`;
                    }
                },
                {
                    data: null,
                    title: 'SlNo',
                    render: function (data1, type, row, meta) {
                        return meta.row + 1;
                    }
                },
                { data: 'DEEPID', visible: false },
                { data: 'NESTSUBMENUID', visible: false },
                { data: 'NESTEDSUBMENU' },
                { data: 'DEEPSUBMENU_NAME' },
                { data: 'DEEPSUBMENU_VALUE', visible: false },
                { data: 'DEEP_URL' },
                { data: 'DEEPCLASSES' },
                { data: 'DEEPSTYLES' },
                { data: 'DEEPSTATUS' },
                { data: 'DEEPNSM_ORDER', visible: false },
                { data: 'DEEPREMARK' },
                { data: 'DEEPADDBY' },
                { data: 'ADDEDON' }

            ];
            var col = columns1.length;
            var table = $('#DeepNestedSubMenuTable').DataTable({
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
                            filename: 'DeepNestedSubmenu',
                            autoFilter: true,
                            title: 'Deep Nested Sub Menu',
                            className: 'btn btn-success bg-success text-white border-success me-2',
                            exportOptions: {
                                columns: [1, 4, 5, 7, 8, 9, 10, 12, 13, 14]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            filename: 'DeepNestedSubmenu',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'Deep Nested Sub Menu',
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
            $('#DeepNestedSubMenuTable tbody').on('click', '.btnEdit3', function () {
                var table = $('#DeepNestedSubMenuTable').DataTable();
                var rowData = table.row($(this).closest('tr')).data();

                var IDS = rowData['DEEPID'];
                $("#divrow3").hide();
                $("#btnadd3").hide();
                $("#divadd3").show();
                $("#btnback3").show();
                var NestedSubMenu = rowData['NESTEDSUBMENU'];
                var NestedSubId = rowData['NESTSUBMENUID'];
                var DeepNestSubMenuName = rowData['DEEPSUBMENU_NAME'];
                var DeepNestSubMenuUrl = rowData['DEEP_URL'];
                var DeepNestSubclases = rowData['DEEPCLASSES'];
                var DeepNestSubstyle = rowData['DEEPSTYLES'];
                var DeepNestSubStatus = rowData['DEEPSTATUS'];
                var DeeNestedSubmenuOrder = rowData['DEEPNSM_ORDER'];
                var DeepNestremark = rowData['DEEPREMARK'];

                $('#btnDeepNestedSubMenuUpdate').show();
                $('#btnDeepNestedSubMenuSave').hide();

                $('#ddlNestedSubMenu').empty().append(`<option value="${NestedSubId}" selected="selected">${NestedSubMenu}</option>`);

                $('#' + NestedMenuIdClientID).val(NestedSubId);

                $('#txtdeepnestedsubmenuname').val(DeepNestSubMenuName);
                $('#txtDeepnestedSubUrl').val(DeepNestSubMenuUrl);
                $('#txtDeepNestedSubClass').val(DeepNestSubclases);
                $('#txtDeepNestedSubStyle').val(DeepNestSubstyle);
                $('#rdlDeepNestedSubStatus input[value="' + DeepNestSubStatus + '"]').prop("checked", true);
                $('#txtDeepNestedSubMenuorder').val(DeeNestedSubmenuOrder);
                $('#txtDeepNestedSubremarks').val(DeepNestremark);
                $('#' + DeepsubMenuHiddenIdClientID).val(IDS);

                $('#<%= hdnActiveTab.ClientID %>').val('#js-tab4');
                localStorage.setItem("activeTab", "#js-tab4");
            });
        }

        else {
            var mes = "No Data";
            showInfoMessage(mes);
        }
    }

    function ViewData_LogDeepNestedSub() {
        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/ViewDataLogDeepNestedSub",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var rawData = response.d;

                if (rawData === "No data found") {
                    swal({ title: "No data found", icon: 'info', timer: 2000 });
                    return;
                }

                var datas = JSON.parse(rawData);

                jquerydatatable_logDeepNestedSub(datas);
                $('#modal_scrollable3').modal('show');
            },
            error: function (error) {
                console.error("Error fetching  data:", error);
            }
        });
    }
    function jquerydatatable_logDeepNestedSub(datas) {
        if ($.fn.DataTable.isDataTable('#DeepNested_LogTable')) {
            $('#DeepNested_LogTable').DataTable().clear().destroy();
            $('#DeepNested_LogTable thead tr').empty();
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
                { data: 'DEEPID', title: 'Deep Nested Sub Menu Id', visible: false },
                { data: 'NESTEDSUBMENU', title: 'Nested Sub Menu' },
                { data: 'DEEPSUBMENU_NAME', title: 'Deep Nested Sub Menu Name' },
                { data: 'DEEPSUBMENU_VALUE', title: 'Deep Nested Sub Menu Value', visible: false },
                { data: 'DEEP_URL', title: 'Url' },
                { data: 'DEEPCLASSES', title: 'Class' },
                { data: 'DEEPSTYLES', title: 'Style' },
                { data: 'DEEPSTATUS', title: 'Status' },
                { data: 'DEEPNSM_ORDER', title: 'Deep Nested Sub Menu Order', visible: false },
                { data: 'DEEPREMARK', title: 'Remarks' },
                { data: 'DEEPADDBY', title: 'AddBy' },
                { data: 'ADDEDON', title: 'AddOn' }
            ];
            var table = $('#DeepNested_LogTable').DataTable({
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
                        filename: 'DeepNestedSubMenuLogData',
                        autoFilter: true,
                        title: 'Deep Nested Sub Menu Log',
                        className: 'btn btn-success bg-success-subtle text-dark me-2',
                        exportOptions: {
                            columns: [0, 2, 3, 5, 6, 7, 8, 10, 11, 12]
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                        filename: 'DeepNestedSubMenuLogData',
                        title: 'Deep Nested Sub Menu Log',
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
    function clr3() {
        $('#ddlNestedSubMenu').val("0").trigger("change");
        loadNestedSubMenuDropdown();
        $('#txtdeepnestedsubmenuname').val('');
        $('#txtDeepnestedSubUrl').val('');

        $('#txtDeepNestedSubClass').val('');

        $('#txtDeepNestedSubStyle').val('');
        $('#txtDeepNestedSubMenuorder').val(1);
        $('#txtDeepNestedSubremarks').val('');

        $("input[name='dr_li3']").prop("checked", false);
        $("input[name='dr_li3'][value='Active']").prop("checked", true);
        $('#' + DeepsubMenuHiddenIdClientID).val('');
        $('#btnDeepNestedSubMenuUpdate').hide();
        $('#btnDeepNestedSubMenuSave').show();
        BindDeepNestedSubMenuOrder();
        loadNestedSubMenuDropdown();
    }

    $('#btnDeepOrder').on('click', function () {
        $('#deepSubMenuOrderModal').modal('show');

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/GetAllDeepMenus",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var deepmenus = response.d;
                var list = $('#deepSubMenuOrder');
                list.empty();

                $.each(deepmenus, function (i, deepmenu) {
                    list.append($('<li>', {
                        class: 'list-group-item d-flex align-items-center',
                        'data-id': deepmenu.ID,
                        html: '<i class="fa-solid fa-circle small text-primary me-2"></i>' + deepmenu.Name
                    }));
                });
            },
            error: function (xhr, status, error) {
                showWarningmessage("Error: " + error);
            }
        });
    });



    $('#btnSaveDeepSubMenuOrder').on('click', function () {
        var orderedId = $('#deepSubMenuOrder li').map(function () {
            return $(this).data('id');
        }).get();

        $.ajax({
            type: "POST",
            url: "/templates/Master/AddMenuAndSubMenu.aspx/SaveDeepMenuOrder",
            data: JSON.stringify({ orderedDeepMenuIds: orderedId }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (resp) {
                var result = resp.d;
                if (result === 'Success') {
                    showSuccessMessage('Deep Sub Menu Order saved successfully.......!');
                    $('#deepSubMenuOrderModal').modal('hide');
                } else {
                    showWarningmessage('Failed to save Deep  Menu order.');
                }
            },
            error: function (err) {
                console.error("Error saving order:", err);
            }
        });
    });
});