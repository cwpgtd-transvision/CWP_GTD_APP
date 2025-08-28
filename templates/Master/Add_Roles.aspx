    <%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Add_Roles.aspx.cs" Inherits="Add_Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        $(document).ready(function () {
            debugger;
            $("#btnSave").on('click', function () {
                debugger;
                save();
            });
            
            $("#btnupdate").on('click', function () {
                
                updatedetails();
            });
            $("#btnLogView").on('click', function () {
                DataView_Log();
            });

            DataViewRoles();
        });
        function cleardetails() {
            $("#txtRoleName").val('');
            $("#ddlTypeForm").val("0");
            $("#ddlUserId").val("0");
            $("#dr_li_c").prop("checked", true);
            $("#dr_li_u").prop("checked", false);
            $('#btnSave').show();
            $('#btnupdate').hide();
            $("#lblTypeForm").text('');
            $("#lblUserId").text('');
            $("#lblroles").text('');
        }
        debugger;
        function save() {
            var RoleName = $("#txtRoleName").val();
            var Status = $("input[name='dr_li']:checked").val();
            var Type_Role = $("#ddlTypeForm option:selected").val();
            var Type_Role_Name = $("#ddlTypeForm option:selected").text();
            var Mster_User = $("#ddlUserId option:selected").val();
            var Mster_User_Name = $("#ddlUserId option:selected").text();
            if (Type_Role == '' || Type_Role == '0') {
                $("#ddlTypeForm").addClass("is-invalid");
                $("#lblTypeForm").text("Type Role is required").show();
                return;
            } else {
                $("#ddlTypeForm").removeClass("is-invalid");
                $("#lblTypeForm").hide().text('');
            }

            if (Mster_User == '' || Mster_User == '0') {
                $("#ddlUserId").addClass("is-invalid");
                $("#lblUserId").text("User is required").show();
                return;
            } else {
                $("#ddlUserId").removeClass("is-invalid");
                $("#lblUserId").hide().text('');
            }
            if (RoleName == '') {
                $("#lblroles").show().text("Role is required");
                $("#lblroles").focus();
                return;
            } else {
                $("#lblroles").hide().text('');
            }
            

            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/templates/Master/Add_Roles.aspx/SaveRole',
                data: JSON.stringify({
                    RoleName: RoleName,
                    Type_Role: Type_Role,
                    Mster_User: Mster_User,
                    Status: Status,
                    Type_Role_Name: Type_Role_Name,
                    Mster_User_Name: Mster_User_Name
                }),
                async: true,
                success: function (data) {

                    var response = data.d;
                    if (response == 'Save') {
                        var mes = "Role Name Saved Successfully....! ";
                        showSuccessMessage(mes);
                    }
                    else if (response == 'RNAME') {
                        var msg = "Role Name Already Exists..!";
                        showWarningmessage(msg);
                    }
                    else {
                        var mes = "Failed To Save the Role Name...!";
                        showErrorMessage(mes);
                    }
                    cleardetails();
                    DataViewRoles();
                },
                error: function () {
                    showErrorMessage('Failed To Save The Role');
                }
            });
        }
        
        function updatedetails() {
            
            var RoleName = $("#txtRoleName").val();
            var RoleId = $('#<%= hidRoleId.ClientID %>').val();
            var Type_Role = $("#ddlTypeForm option:selected").val();
            var Type_Role_Name = $("#ddlTypeForm option:selected").text();
            var Master_User = $("#ddlUserId option:selected").val();
            var Master_User_Name = $("#ddlUserId option:selected").text();
            var Status = $("input[name='dr_li']:checked").val();
            if (RoleName == '') {
                $("#lblroles").show().text("Role is required");
                $("#lblroles").focus();
                return;
            } else {
                $("#lblroles").hide().text('');
            }
            if (Type_Role == '' || Type_Role == '0') {
                $("#ddlTypeForm").addClass("is-invalid");
                $("#lblTypeForm").text("Type Role is required").show();
                return;
            } else {
                $("#ddlTypeForm").removeClass("is-invalid");
                $("#lblTypeForm").hide().text('');
            }

            if (Master_User == '' || Master_User == '0') {
                $("#ddlUserId").addClass("is-invalid");
                $("#lblUserId").text("User is required").show();
                return;
            } else {
                $("#ddlUserId").removeClass("is-invalid");
                $("#lblUserId").hide().text('');
            }

            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                url: '/templates/Master/Add_Roles.aspx/updatedetils',
                data: JSON.stringify({
                    RoleName: RoleName,
                    RoleId: RoleId,
                    Type_Role: Type_Role,
                    Master_User: Master_User,
                    Status: Status,
                    Type_Role_Name: Type_Role_Name,
                    Master_User_Name: Master_User_Name
                }),
                async: true,
                success: function (data) {
                    var response = data.d;
                    if (response == 'Updated') {
                        var mes = "Role Name Updated Successfully....! ";
                        showSuccessMessage(mes);
                    }
                    else if (response == 'RNAME') {
                        var msg = "Role Name Already Exists..!";
                        showWarningmessage(msg);
                    }
                    else {
                        var mes = "Failed To Updated the Role Name...!";
                        showErrorMessage(mes);
                    }
                    cleardetails();
                    DataViewRoles();
                },
                error: function () {
                    showErrorMessage('Failed To Update The Role');
                }
            });
        }
        function DataViewRoles() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/Add_Roles.aspx/BindRoleData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var rawData = response.d;

                    var data = JSON.parse(rawData);


                    jquerydatatable(data);

                },
                error: function (error) {
                }
            });
        }

        function jquerydatatable(data) {



            if ($.fn.DataTable.isDataTable('#RolesTable')) {
                $('#RolesTable').DataTable().clear().destroy();
                $('#RolesTable thead tr').empty();
            }
            if (data.length > 0) {
                $('#tableHeadRow').append('<th>Action</th>');
                $('#tableHeadRow').append('<th>SLNO</th>');
                $('#tableHeadRow').append('<th>Role Id</th>');
                $('#tableHeadRow').append('<th>Role Name</th>');
                $('#tableHeadRow').append('<th>Type Role Id</th>');
                $('#tableHeadRow').append('<th>Type Role</th>');
                $('#tableHeadRow').append('<th>Type User Id</th>');
                $('#tableHeadRow').append('<th>User Name</th>');
                $('#tableHeadRow').append('<th>Status</th>');
                $('#tableHeadRow').append('<th>Added By</th>');
                $('#tableHeadRow').append('<th>Added On</th>');

                var columns = [
                    {
                        data: null,
                        orderable: false,
                        render: function (data, type, row, meta) {
                            return `<button type="button" class="btnEdit btn btn-secondary btn-sm" data-row-index="${meta.row}">Edit</button>`;
                        }
                    },
                    {
                        data: null,
                        title: 'SlNo',
                        render: function (data, type, row, meta) {
                            return meta.row + 1;
                        }
                    },
                    { data: 'ROLEID', visible: false },
                    { data: 'NAME' },
                    { data: 'Type_table_Id', visible: false },
                    { data: 'Type_Table_Name' },
                    { data: 'Master_User_Id', visible: false },
                    { data: 'Master_User_Name' },
                    { data: 'Status' },
                    { data: 'ADDBY' },
                    { data: 'ADDEDON' },
                ];
                var col = columns.length;
                var table = $('#RolesTable').DataTable({
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
                    language: {
                        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                        searchPlaceholder: 'Type to filter...',
                        lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                        paginate: { 'first': 'First', 'last': 'Last', 'next': document.dir == "rtl" ? '&larr;' : '&rarr;', 'previous': document.dir == "rtl" ? '&rarr;' : '&larr;' }
                    },
                    dom: '<"datatable-header dt-buttons-right pt-0"fB><"datatable-scroll"tS><"datatable-footer"i>',
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                            className: 'btn btn-success me-2',
                            title: 'Role Table Report',
                            filename: 'Roles_table_export',
                            exportOptions: {
                                columns: [1, 3, 5, 7, 8, 9, 10]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            pageSize: 'A4',
                            className: 'btn btn-danger',
                            title: '',
                            filename: 'Role_table_export',
                            exportOptions: {
                                columns: [1, 3, 5, 7, 8, 9, 10]
                            },
                            customize: function (doc) {
                                doc.content.splice(0, 0, {
                                    text: 'Role Table Report',
                                    fontSize: 14,
                                    bold: true,
                                    alignment: 'center',
                                    margin: [0, 0, 0, 10]
                                });

                                var table = doc.content.find(function (content) {
                                    return content.table !== undefined;
                                });

                                if (table) {
                                    var columnCount = table.table.body[0].length;

                                    table.table.widths = Array(columnCount).fill('*');

                                    table.layout = {
                                        hLineWidth: function () { return 0.5; },
                                        vLineWidth: function () { return 0.5; },
                                        hLineColor: function () { return '#aaa'; },
                                        vLineColor: function () { return '#aaa'; },
                                        paddingLeft: function () { return 5; },
                                        paddingRight: function () { return 5; },
                                        paddingTop: function () { return 3; },
                                        paddingBottom: function () { return 3; }
                                    };
                                }
                                doc.defaultStyle.fontSize = 8;
                                doc.styles.tableHeader.alignment = 'center';
                                doc.styles.tableHeader.fontSize = 9;
                                doc.styles.tableHeader.bold = true;
                            }
                        }

                    ]
                });

                $('#RolesTable tbody').off('click', '.btnEdit').on('click', '.btnEdit', function () {
                    var rowIndex = $(this).data('row-index');
                    var table = $('#RolesTable').DataTable();
                    var rowData = table.row($(this).closest('tr')).data();

                    $('#btnupdate').show();
                    $('#btnSave').hide();

                    var IDS = rowData['ROLEID'];
                    var rolename = rowData["NAME"];
                    var IDS1 = rowData['Type_table_Id'];
                    var IDS2 = rowData['Master_User_Id'];

                    $('#txtRoleName').val(rolename);

                    $('#ddlTypeForm').val(IDS1);

                    loadTypeUserId(IDS1, IDS2);

                    $('#<%= hidRoleId.ClientID %>').val(IDS);
                    $('#<%= hidTypeRoleId.ClientID %>').val(IDS1);
                    $('#<%= hidTypeUserId.ClientID %>').val(IDS2);
                });


            }

        }


        function DataView_Log() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/Add_Roles.aspx/BindData_log",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var rawData = response.d;

                    var data = JSON.parse(rawData);


                    jquerydatatable_LOG(data);

                },
                error: function (error) {
                }
            });
        }
        function jquerydatatable_LOG(data) {



            if ($.fn.DataTable.isDataTable('#RoleTable_Log')) {
                $('#RoleTable_Log').DataTable().clear().destroy();
                $('#RoleTable_Log thead tr').empty();
            }
            if (data.length > 0) {
                $('#tableHeadRow_Log').append('<th>SLNO</th>');
                $('#tableHeadRow_Log').append('<th>Role Name</th>');
                $('#tableHeadRow_Log').append('<th>Type Role</th>');
                $('#tableHeadRow_Log').append('<th>User Name</th>');
                $('#tableHeadRow_Log').append('<th>Status</th>');
                $('#tableHeadRow_Log').append('<th>Added By</th>');
                $('#tableHeadRow_Log').append('<th>Added On</th>');

                var columns = [
                    {
                        data: null,
                        title: 'SlNo',
                        render: function (data, type, row, meta) {
                            return meta.row + 1;
                        }
                    },
                    { data: 'NAME' },
                    { data: 'Type_Table_Name' },
                    { data: 'Master_User_Name' },
                    { data: 'Status' },
                    { data: 'ADDBY' },
                    { data: 'ADDEDON' },
                ];
                var col = columns.length;
                var table = $('#RoleTable_Log').DataTable({
                    data: data,
                    info: false,
                    columns: columns,
                    destroy: true,
                    pageLength: 10,
                    scrollCollapse: true,
                    paging: false,
                    autoWidth: false,
                    responsive: false,
                    scroller: true,
                    scrollY: 250,
                    scrollCollapse: true,
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
                            className: 'btn btn-success bg-success-subtle text-dark me-2',
                            title: 'Role Log Table Report ',
                            filename: 'Role_table_export_LOG',
                        },
                        {
                            extend: 'pdfHtml5',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            orientation: 'landscape',
                            pageSize: 'A4',
                            className: 'btn btn-danger',
                            title: 'Role Log Table Report',
                            filename: 'Role_table_export_Log',
                            customize: function (doc) {
                                doc.content.splice(0, 0, {
                                    text: '',
                                    fontSize: 14,
                                    bold: true,
                                    alignment: 'center',
                                    margin: [0, 0, 0, 5]
                                });

                                var table = doc.content.find(function (content) {
                                    return content.table !== undefined;
                                });

                                if (table) {
                                    var columnCount = table.table.body[0].length;
                                    table.table.widths = Array(columnCount).fill('*');
                                    table.layout = {
                                        hLineWidth: function () { return 0.1; },
                                        vLineWidth: function () { return 0.2; },
                                        hLineColor: function () { return '#aaa'; },
                                        vLineColor: function () { return '#aaa'; }
                                    };
                                }

                                doc.defaultStyle.fontSize = 8;
                            }
                        }

                    ]
                });

                setTimeout(() => table.columns.adjust().draw(), 200);
            }
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            loadTypeRole();

            $('#ddlTypeForm').on('change', function () {
                var selectedValue = $(this).val();

                if (selectedValue === "0") {
                    $('#ddlUserId')
                        .empty()
                        .append($('<option>', { value: 0, text: 'Select User' }));
                    return;
                }
                loadTypeUserId(selectedValue);
            });
        });

        function loadTypeRole() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/Add_Roles.aspx/GetTypeRoleList",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlTypeForm');
                    ddl.empty();
                    ddl.append($('<option>', { value: 0, text: 'Select Type Role' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ID,
                            text: item.NAME
                        }));
                    });
                },
                error: function (xhr, status, error) {
                    alert("Error loading type roles: " + error);
                }
            });
        }

        function loadTypeUserId(type, selectedUserId = null) {
            $.ajax({
                type: "POST",
                url: "/templates/Master/Add_Roles.aspx/GetTypeUserIdList",
                data: JSON.stringify({ type: type }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlUserId');
                    ddl.empty();
                    ddl.append($('<option>', { value: 0, text: 'Select User' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ID,
                            text: item.NAME
                        }));
                    });

                    if (selectedUserId !== null) {
                        ddl.val(selectedUserId);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error loading users: " + error);
                }
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hidRoleId" />
    <asp:HiddenField runat="server" ID="hidTypeRoleId" />
    <asp:HiddenField runat="server" ID="hidTypeUserId" />
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <div class="container-fluid mt-3">
        <div class="card">
            <div class="card-header">
                <h6 class="mb-0">Add Master Data</h6>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3">
                    <li class="nav-item">
                        <a href="#js-tab1" class="nav-link active" data-bs-toggle="tab">Roles
                        </a>
                    </li>
                   <%-- <li class="nav-item">
                        <a href="#js-tab2" class="nav-link" data-bs-toggle="tab">Next 1
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#js-tab3" class="nav-link" data-bs-toggle="tab">Next 2
                        </a>
                    </li>--%>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade show active" id="js-tab1">
                        <div class="row">

                            <div class="col-md-3 mb-3">
                                <label class="form-label">Type Role<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <select id="ddlTypeForm" class="form-select select">
                                        <option value="0">Select Type</option>
                                    </select>
                                </div>
                                <div class="invalid-feedback" id="lblTypeForm"></div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="form-label">User<span class="text-danger">*</span> :</label>
                                <div class="input-group">
                                    <select id="ddlUserId" class="form-select select">
                                        <option value="0">Select User ID</option>
                                    </select>
                                </div>
                                <div class="invalid-feedback" id="lblUserId"></div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="form-label">Role Name<span class="text-danger">*</span> :</label>
                                <input type="text" id="txtRoleName" class="form-control" placeholder="Enter Role Name">
                                <div class="invalid-feedback" id="lblroles"></div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <div id="rdlStatus">
                                    <label class="form-label d-block">Status<span class="text-danger">*</span> :</label>
                                    <div class="form-check form-check-inline mt-2 mb-2">
                                        <input class="form-check-input" type="radio" name="dr_li" id="dr_li_c" checked value="Active">
                                        <label class="form-check-label" for="dr_li_c">Active</label>
                                    </div>
                                    <div class="form-check form-check-inline mt-2">
                                        <input class="form-check-input" type="radio" name="dr_li" id="dr_li_u" value="Inactive">
                                        <label class="form-check-label" for="dr_li_u">Inactive</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="text-end">
                                <button type="button" id="btnSave" class="btn btn-primary my-1 me-2">Save</button>
                                <button type="button" id="btnupdate" class="btn btn-primary my-1 me-2" style="display: none">Update</button>
                                <button type="button" id="btnLogView" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#modal_xlarge">Log View</button>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <table id="RolesTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr id="tableHeadRow"></tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="js-tab2">
                        This is some placeholder content the <strong>second</strong> tab's associated content
		
                    </div>

                    <div class="tab-pane fade" id="js-tab3">
                        This is some placeholder content the <strong>third</strong> tab's associated content
		
                    </div>
                </div>
                <div id="modal_xlarge" class="modal fade" tabindex="-1">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Role Name Log</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <div class="modal-body">

                                <table id="RoleTable_Log" class="table table-striped table-bordered">
                                    <thead>
                                        <tr id="tableHeadRow_Log"></tr>
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

        </div>
    </div>

</asp:Content>

