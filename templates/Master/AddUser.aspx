<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        var imagename = "";
        var base64Image = "";
        var selectedfiles = "0";

        const swalInit = swal.mixin({
            buttonsStyling: false,
            customClass: {
                confirmButton: 'btn btn-primary btn-sm',
                cancelButton: 'btn btn-light btn-sm',
                denyButton: 'btn btn-light btn-sm',
                input: 'form-control'
            }
        });

        $(document).ready(function () {

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
            $("#btnupdate").on('click', function () {
                updatedetails();
            });
            $("#btnclear").on('click', function () {
                cleardetails();
            });
            $("#btnLogView").on('click', function () {
                DataView_Log();
            });

            document.querySelector('.fileinput-button').addEventListener('click', function () {
                this.querySelector('input[type="file"]').click();
            });
            $("#btnSave").on('click', function () {
                save();
            });

            DataView();
        });


        function updatedetails() {

            var username = $("#txtuname_add").val();
            var fullname = $("#txtfullname").val();
            var phonenumber = $("#txtphone").val();
            var email = $("#txtmail").val();
            var password = $("#txtpassword").val();
            var confirmpassword = $("#txtconfmpass").val();
            var loginfrom = $("#ddllogin option:selected").val();
            var userfrom = $("#ddluser option:selected").val();
            var userfromname = $("#ddluser option:selected").text();
            var masteruser = $("#ddlmasteruser option:selected").val();
            var masterusername = $("#ddlmasteruser option:selected").text();
            var role = $("#ddlrole option:selected").val();
            var remarks = $("#txtremark").val();
            var status = $("input[name='inlineRadioOptions']:checked").val();

            let updateVariable = 0;

            if (!validateField(username, "#lblreqname", "Username is required", "#txtuname_add")) return;
            if (!/^[a-zA-Z].*[0-9]?$/.test(username) || username.length < 3) {
                $("#lblreqname").show().text("Username should be at least 5 characters and cannot start with a number or special character.");
                $("#txtuname_add").focus();
                return;
            }

            if (!validateField(fullname, "#lblreqfirmname", "Full Name is required", "#txtfullname")) return;
            if (!/^[a-zA-Z].*[0-9]?$/.test(fullname)) {
                $("#lblreqfirmname").show().text("Please enter a valid Full Name.");
                $("#txtfullname").focus();
                return;
            }

            if (!validateField(phonenumber, "#lblreqphone", "Phone number is required", "#txtphone")) return;
            if (!/^[6-9]\d{9}$/.test(phonenumber)) {
                $("#lblreqphone").show().text("Please enter a valid 10-digit phone number.");
                $("#txtphone").focus();
                return;
            }

            if (!validateField(email, "#lblreqmail", "Email is required", "#txtmail")) return;
            if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
                $("#lblreqmail").show().text("Please enter a valid email address.");
                $("#txtmail").focus();
                return;
            }

            if (!validateField(password, "#lblreqpass", "Password is required", "#txtpassword")) return;
            if (!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$/.test(password)) {
                $("#lblstrogpass").show().text("Password must be 8-20 characters long and include uppercase, lowercase, a number, and a special character.");
                $("#txtpassword").focus();
                return;
            }

            if (!validateField(confirmpassword, "#lblreqconfmpass", "Confirm Password is required", "#txtconfmpass")) return;
            if (password !== confirmpassword) {
                $("#lblreqconfmpass").show().text("Passwords do not match.");
                $("#txtconfmpass").focus();
                return;
            }

            if (!validateField(loginfrom, "#lblloginfrom", "Login From is required", "#ddllogin")) return;
            if (!validateField(userfrom, "#lbluserfrom", "User From is required", "#ddluser")) return;
            if (!validateField(masteruser, "#lbl_master_roles", "Master User is required", "#ddlmasteruser")) return;
            if (!validateField(role, "#lblroles", "Role is required", "#ddlrole")) return;
            if (!status) {
                $("#lblstatus").show().text("Status is required (Active or Inactive).");
                return;
            }
            $("#lblstatus").hide().text("");

            var image = (selectedfiles === "0") ? "default" : "dynamic";

            if (updateVariable == 0) {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    url: '/templates/Master/AddUser.aspx/updatedetils',
                    data: JSON.stringify({
                        username: username,
                        fullname: fullname,
                        phonenumber: phonenumber,
                        email: email,
                        password: password,
                        loginfrom: loginfrom,
                        userfrom: userfrom,
                        userfromname: userfromname,
                        masteruser: masteruser,
                        masterusername: masterusername,
                        role: role,
                        remarks: remarks,
                        status: status,
                        imagename: imagename,
                        base64Image: base64Image,
                        userid: userid,
                        bindpath: bindpath, bindimage: bindimage
                    }),
                    async: true,
                    success: function (data) {

                        var response = data.d;
                        var message = '';
                        if (response == "UNAME") message = "User Name Already Exists";
                        else if (response == "PHNO") message = "Phone Number Already Exists";
                        else if (response == "EMAIL") message = "Email Already Exists";
                        else {
                            message = response;

                            $("#divrow").show();
                            $("#btnadd").show();
                            $("#divadd").hide();
                            $("#btnback").hide();
                            cleardetails();
                            DataView();
                        }

                        swalInit.fire({
                            title: message,
                            icon: response == "UNAME" || response == "PHNO" || response == "EMAIL" ? 'warning' : 'success',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: {
                                confirmButton: 'btn btn-primary btn-sm',
                            }
                        }).then(function (result) {
                            if (response != "UNAME" && response != "PHNO" && response != "EMAIL") swal.close();
                        });
                    },
                    error: function () {
                    }
                });
            }
        }

        function cleardetails() {

            $("#txtuname_add").val('');
            $("#txtfullname").val('');
            $("#txtphone").val('');
            $("#txtmail").val('');
            $("#txtpassword").val('');
            $("#txtconfmpass").val('');
            $("#txtremark").val('');
            $("#ddluser").val("0").trigger('change');
            $("#ddllogin").val("0").trigger('change');
            $("#ddlmasteruser").val("0").trigger('change');
            $("#ddlrole").val("0").trigger('change');
            //  $("input[name='inlineRadioOptions']").prop('checked', false);
            const tableBody = document.querySelector('.files');
            tableBody.innerHTML = `
                  <tr data-id="empty">
                       <td colspan="1" class="text-center text-gray-500 py-30px">
                         <div class="mb-10px"><i class="fa fa-file fa-3x"></i></div>
                          <div class="fw-bold">No file selected</div>
                      </td>
                  </tr>
                    `;
            $('#btnupdate').hide();
            $('#btnView').show(); $('#btnSave').show();
            //$('#bindata').hide();
            $("#lblroles").hide(); $("#lblreqradio").hide(); $("#lblreqconfmpass").hide(); $("#lblreqpass").hide(); $("#lblreqname").hide();
            $("#lblreqmail").hide(); $("#lblreqphone").hide(); $("#lblreqfirmname").hide(); $("#lblreqremark").hide();
            $("#lbl_master_roles").hide(); $("#lbluserfrom").hide(); $("#lblloginfrom").hide(); $("#lblstrogpass").hide()

        }

        function save() {

            var username = $("#txtuname_add").val();
            var fullname = $("#txtfullname").val();
            var phonenumber = $("#txtphone").val();
            var email = $("#txtmail").val();
            var password = $("#txtpassword").val();
            var confirmpassword = $("#txtconfmpass").val();
            var loginfrom = $("#ddllogin option:selected").val();
            var userfrom = $("#ddluser option:selected").val();
            var userfromname = $("#ddluser option:selected").text();
            var masteruser = $("#ddlmasteruser option:selected").val();
            var masterusername = $("#ddlmasteruser option:selected").text();
            var role = $("#ddlrole option:selected").val();
            var remarks = $("#txtremark").val();
            var status = $("input[name='inlineRadioOptions']:checked").val();

            let saveVariable = 0;
            if (!validateField(username, "#lblreqname", "Username is required", "#txtuname_add")) return;
            if (!/^[a-zA-Z].*[0-9]?$/.test(username) || username.length < 3) {
                $("#lblreqname").show().text("Username should be at least 5 characters and cannot start with a number or special character.");
                $("#txtuname_add").focus();
                return;
            }

            if (!validateField(fullname, "#lblreqfirmname", "Full Name is required", "#txtfullname")) return;
            if (!/^[a-zA-Z].*[0-9]?$/.test(fullname)) {
                $("#lblreqfirmname").show().text("Please enter a valid Full Name.");
                $("#txtfullname").focus();
                return;
            }

            if (!validateField(phonenumber, "#lblreqphone", "Phone number is required", "#txtphone")) return;
            if (!/^[6-9]\d{9}$/.test(phonenumber)) {
                $("#lblreqphone").show().text("Please enter a valid 10-digit phone number.");
                $("#txtphone").focus();
                return;
            }

            if (!validateField(email, "#lblreqmail", "Email is required", "#txtmail")) return;
            if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
                $("#lblreqmail").show().text("Please enter a valid email address.");
                $("#txtmail").focus();
                return;
            }

            if (!validateField(password, "#lblreqpass", "Password is required", "#txtpassword")) return;
            if (!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$/.test(password)) {
                $("#lblreqpass").show().text("Password must be 8-20 characters long and include uppercase, lowercase, a number, and a special character.");
                $("#txtpassword").focus();
                return;
            }

            if (!validateField(confirmpassword, "#lblreqconfmpass", "Confirm Password is required", "#txtconfmpass")) return;
            if (password !== confirmpassword) {
                $("#lblreqconfmpass").show().text("Passwords do not match.");
                $("#txtconfmpass").focus();
                return;
            }

            if (!validateField(loginfrom, "#lblloginfrom", "Login From is required", "#ddllogin")) return;
            if (!validateField(userfrom, "#lbluserfrom", "User From is required", "#ddluser")) return;
            if (!validateField(masteruser, "#lbl_master_roles", "Master User is required", "#ddlmasteruser")) return;
            if (!validateField(role, "#lblroles", "Role is required", "#ddlrole")) return;

            var image = (selectedfiles === "0") ? "default" : "dynamic";

            if (saveVariable == 0) {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json;charset=utf-8',
                    url: '/templates/Master/AddUser.aspx/saveuser',
                    data: JSON.stringify({
                        username: username,
                        fullname: fullname,
                        phonenumber: phonenumber,
                        email: email,
                        password: password,
                        loginfrom: loginfrom,
                        userfrom: userfrom,
                        userfromname: userfromname,
                        masteruser: masteruser,
                        masterusername: masterusername,
                        role: role,
                        remarks: remarks,
                        status: status,
                        imagename: imagename,
                        base64Image: base64Image,
                        image: image
                    }),
                    async: true,
                    success: function (data) {

                        var response = data.d;
                        var message = '';
                        if (response == "UNAME") message = "User Name Already Exists";
                        else if (response == "PHNO") message = "Phone Number Already Exists";
                        else if (response == "EMAIL") message = "Email Already Exists";
                        else {
                            message = response;
                            $("#divrow").show();
                            $("#btnadd").show();
                            $("#divadd").hide();
                            $("#btnback").hide();
                            cleardetails();
                            DataView();
                        }
                        swalInit.fire({
                            title: message,
                            icon: response == "UNAME" || response == "PHNO" || response == "EMAIL" ? 'warning' : 'success',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: {
                                confirmButton: 'btn btn-primary btn-sm',
                            }
                        }).then(function (result) {
                            if (response != "UNAME" && response != "PHNO" && response != "EMAIL") swal.close();
                        });
                    },
                    error: function () {
                        swalInit.fire({
                            title: 'Error',
                            text: 'Failed To Save The User',
                            icon: 'error'
                        });
                    }
                });
            }

        }

        function validateField(field, errorLabel, errorMessage, id) {
            if (!field || field === "0") {
                $(errorLabel).show().text(errorMessage);
                $(id).focus();
                return false;
            }
            $(errorLabel).hide().text("");
            return true;
        }
        function handleFileSelection(event) {
            const files = event.target.files;
            const tableBody = document.querySelector('.files');
            tableBody.innerHTML = '';
            if (files.length > 0) {
                selectedfiles = "1";
                Array.from(files).forEach((file, index) => {
                    const row = document.createElement('tr');
                    row.setAttribute('data-id', `file-${index}`);
                    const previewCell = document.createElement('td');
                    if (file.type.startsWith('image/')) {
                        const img = document.createElement('img');
                        img.src = URL.createObjectURL(file);
                        img.alt = file.name;
                        img.style.width = '100px';
                        img.style.height = '100px';
                        img.style.objectFit = 'contain';
                        previewCell.appendChild(img);
                        const reader = new FileReader();
                        reader.onloadend = function () {
                            base64Image = reader.result;
                        };
                        reader.readAsDataURL(file);
                    } else {
                        const icon = document.createElement('i');
                        icon.className = 'fa fa-file fa-2x';
                        previewCell.appendChild(icon);
                    }
                    imagename = file.name;
                    const infoCell = document.createElement('td');
                    infoCell.innerHTML = `
            <div><strong>Name:</strong> ${file.name}</div>
            <div><strong>Size:</strong> ${(file.size / 1024).toFixed(2)} KB</div>
        `;
                    const cancelCell = document.createElement('td');
                    const cancelButton = document.createElement('button');
                    cancelButton.className = 'btn btn-default cancel w-100px pe-20px d-block';
                    cancelButton.innerHTML = `
            <i class="fa fa-trash fa-fw text-muted"></i>
            <span>Cancel</span>
        `;
                    cancelButton.addEventListener('click', function () {
                        tableBody.removeChild(row);
                        if (file.type.startsWith('image/')) {
                            URL.revokeObjectURL(previewCell.querySelector('img').src);
                        }
                        if (tableBody.children.length === 0) {
                            tableBody.innerHTML = `<tr data-id="empty"><td colspan="1" class="text-center text-gray-500 py-30px"><div class="mb-10px"><i class="fa fa-file fa-3x"></i></div><div class="fw-bold">No file selected</div></td></tr>`;
                        }
                        event.target.value = '';
                    });
                    cancelCell.appendChild(cancelButton);
                    row.appendChild(previewCell);
                    row.appendChild(infoCell);
                    row.appendChild(cancelCell);
                    tableBody.appendChild(row);
                });
                event.target.value = '';
            } else {
                tableBody.innerHTML = `<tr data-id="empty"><td colspan="1" class="text-center text-gray-500 py-30px"><div class="mb-10px"><i class="fa fa-file fa-3x"></i></div><div class="fw-bold">No file selected</div></td></tr>`;
            }
        }
        function DataView_Log() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/AddUser.aspx/BindData_log",
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
            if ($.fn.DataTable.isDataTable('#UserTable_Log')) {
                $('#UserTable_Log').DataTable().clear().destroy();
                $('#UserTable_Log thead tr').empty();
            }
            if (data.length > 0) {
                $('#tableHeadRow_Log').append('<th>SLNO</th>');
                $('#tableHeadRow_Log').append('<th>User Name</th>');
                $('#tableHeadRow_Log').append('<th>Full Name</th>');
                $('#tableHeadRow_Log').append('<th>Password</th>');
                $('#tableHeadRow_Log').append('<th>Mobile</th>');
                $('#tableHeadRow_Log').append('<th>Email</th>');
                $('#tableHeadRow_Log').append('<th>Designation</th>');
                $('#tableHeadRow_Log').append('<th>Login-From</th>');
                $('#tableHeadRow_Log').append('<th>User-From Name</th>');
                $('#tableHeadRow_Log').append('<th>Master-From Name</th>');
                $('#tableHeadRow_Log').append('<th>ImageName</th>');
                $('#tableHeadRow_Log').append('<th>Profile-Path</th>');
                $('#tableHeadRow_Log').append('<th>Status</th>');
                $('#tableHeadRow_Log').append('<th>Remarks</th>');
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
                    { data: 'User_NAME' },
                    { data: 'FULLNAME' },
                    { data: 'PASSWORD', visible: false },
                    { data: 'MOBILE_NO' },
                    { data: 'EMAIL' },
                    { data: 'RNAME' },
                    { data: 'USER_TYPE' },
                    { data: 'USER_TABLE_NAME' },
                    { data: 'TABLE_USER_NAME' },
                    { data: 'PROFILE_IMAGE_NAME' },
                    { data: 'PROFILE_FULL_PATH' },
                    { data: 'STATUS' },
                    { data: 'COMMENTS' },
                    { data: 'ADDEDBY' },
                    { data: 'ADDEDON' },
                ];
                var col = columns.length;
                var table = $('#UserTable_Log').DataTable({
                    data: data,
                    columns: columns,
                    destroy: true,
                    pageLength: 10,
                    scrollCollapse: true,
                    paging: false,
                    info: false,
                    autoWidth: true,
                    responsive: false,
                    scrollX: true,
                    scroller: true,
                    scrollY: 250,
                    scrollCollapse: true,
                    language: {
                        search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                        searchPlaceholder: 'Type to filter...',
                        lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                        paginate: { 'first': 'First', 'last': 'Last', 'next': document.dir == "rtl" ? '&larr;' : '&rarr;', 'previous': document.dir == "rtl" ? '&rarr;' : '&larr;' }
                    },
                    dom: '<"datatable-header dt-buttons-right"fB><"datatable-scroll"tS><"datatable-footer"i>',
                    buttons: [
                        {
                            extend: 'excelHtml5',
                            text: 'Excel <i class="ph-file-xls ms-2"></i>',
                            className: 'btn btn-success me-2',
                            title: 'User Log Table Report ',
                            filename: 'user_table_export_LOG',
                        },
                        {
                            extend: 'pdfHtml5',
                            orientation: 'landscape',
                            pageSize: 'A2',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            className: 'btn btn-danger bg-danger text-white border-danger',
                            title: 'User Log Table Report',
                            filename: 'user_table_export_Log',
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
            }
        }
        function DataView() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/AddUser.aspx/BindData",
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
            if ($.fn.DataTable.isDataTable('#UserTable')) {
                $('#UserTable').DataTable().clear().destroy();
                $('#UserTable thead tr').empty();
            }
            if (data.length > 0) {
                $('#tableHeadRow').append('<th>Action</th>');
                $('#tableHeadRow').append('<th>SLNO</th>');
                $('#tableHeadRow').append('<th>User Id</th>');
                $('#tableHeadRow').append('<th>User Name</th>');
                $('#tableHeadRow').append('<th>Full Name</th>');
                $('#tableHeadRow').append('<th>Password</th>');
                $('#tableHeadRow').append('<th>Mobile Number</th>');
                $('#tableHeadRow').append('<th>Email-Id</th>');
                $('#tableHeadRow').append('<th>Role-Id</th>');
                $('#tableHeadRow').append('<th>Designation</th>');
                $('#tableHeadRow').append('<th>Login-From</th>');
                $('#tableHeadRow').append('<th>User-From</th>');
                $('#tableHeadRow').append('<th>Master_User_Id</th>');
                $('#tableHeadRow').append('<th>Master-User</th>');
                $('#tableHeadRow').append('<th>ImageName</th>');
                $('#tableHeadRow').append('<th>Profile-Path</th>');
                $('#tableHeadRow').append('<th>Status</th>');
                $('#tableHeadRow').append('<th>Remarks</th>');
                $('#tableHeadRow').append('<th>User Table Id</th>');
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
                    { data: 'ID', visible: false },
                    { data: 'User_NAME' },
                    { data: 'FULLNAME' },
                    { data: 'PASSWORD', visible: false },
                    { data: 'MOBILE_NO' },
                    { data: 'EMAIL' },
                    { data: 'ROLE_ID', visible: false },
                    { data: 'RNAME' },
                    { data: 'USER_TYPE' },
                    { data: 'USER_TABLE_NAME' },
                    { data: 'TABLE_USER_ID', visible: false },
                    { data: 'TABLE_USER_NAME' },
                    { data: 'PROFILE_IMAGE_NAME' },
                    { data: 'PROFILE_FULL_PATH' },
                    { data: 'STATUS' },
                    { data: 'COMMENTS' },
                    { data: 'user_table_id', visible: false },
                    { data: 'ADDEDBY' },
                    { data: 'ADDEDON' },
                ];
                var col = columns.length;
                var table = $('#UserTable').DataTable({
                    data: data,
                    columns: columns,
                    destroy: true,
                    pageLength: 10,
                    scrollCollapse: true,
                    paging: false,
                    info: false,
                    autoWidth: true,
                    responsive: false,
                    scrollX: true,
                    scroller: true,
                    scrollY: 419,
                    scrollCollapse: true,
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
                            title: 'User Table Report',               // File name without extension
                            filename: 'user_table_export',            // Excel file name
                            exportOptions: {
                                columns: [1, 3, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16, 17, 19, 20]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            orientation: 'landscape',
                            pageSize: 'A3',
                            text: 'PDF <i class="ph-file-pdf ms-2"></i>',
                            className: 'btn btn-danger',
                            title: 'User Table Report',
                            filename: 'user_table_export',
                            exportOptions: {
                                //columns: [1, 3, 4, 6, 7, 9, 10, 11, 15, 16, 18, 19]
                                columns: [1, 3, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16, 17, 19, 20]
                            }
                        }
                    ]
                });
                $('#UserTable tbody').off('click', '.btnEdit').on('click', '.btnEdit', function () {
                    var rowIndex = $(this).data('row-index');
                    var table = $('#UserTable').DataTable();
                    var rowData = table.row(rowIndex).data();
                    $("#divrow").hide();
                    $("#btnadd").hide();
                    $("#divadd").show();
                    $("#btnback").show();
                    binddetails(rowData);
                });

            }

        }
        function binddetails(rowData) {
            debugger;
            $('#btnSave').hide();
            $("#btnupdate").show();
            userid = rowData.ID;
            var username = rowData.User_NAME;
            var fullname = rowData.FULLNAME;
            var password = rowData.PASSWORD;
            var mobileno = rowData.MOBILE_NO;
            var email = rowData.EMAIL;
            var role = rowData.ROLE_ID;
            var logintype = rowData.USER_TYPE;
            var massteruser = rowData.TABLE_USER_ID;
            bindimagename = rowData.PROFILE_IMAGE_NAME;
            bindimage = bindimagename;
            path = rowData.PROFILE_FULL_PATH;
            bindpath = path;

            var remarks = rowData.COMMENTS;
            var status = rowData.STATUS;
            var usertableid = rowData.user_table_id;
            $("#txtuname_add").val(username);
            $("#txtfullname").val(fullname);
            $("#txtphone").val(mobileno);
            $("#txtmail").val(email);
            $("#txtpassword").val(password);
            $("#txtconfmpass").val(password);
            $("#ddllogin").val(logintype);
            $('#ddluser').val(usertableid).trigger('change');
            loadMasterUsers(usertableid, massteruser);
            loadRoles(usertableid, massteruser, role);

            $('#<%= hidUsersTId.ClientID %>').val(userid);
            $('#<%= hidUserId.ClientID %>').val(usertableid);
            $('#<%= hidMasterId.ClientID %>').val(massteruser);
            $('#<%= hidroleId.ClientID %>').val(role);

            $("#txtremark").val(remarks);
            $("input[name='inlineRadioOptions'][value='" + status + "']").prop('checked', true);
            debugger;
            var relativePath = path.split('assets')[1];
            if (relativePath) {
                relativePath = '/assets' + relativePath;
            }
            if (relativePath) {
                const profilePreviewHTML = `
              <tr class="image-row">
              <td class="px-0 mx-0">
                 <img src="${relativePath}" alt="Profile Image" style="width: 100px; height: 100px; object-fit: cover;">
               </td> <td>${bindimagename}</td><td class="text-end"><button type="button" class="btn btn-danger deleteImage">Delete</button></td></tr> `;
                $('.files').html(profilePreviewHTML);
            }
        }

        $(document).on('click', '.deleteImage', function () {

            $(this).closest('tr').remove();

            $.ajax({
                type: 'POST',
                url: '/templates/Master/AddUser.aspx/deleteimage',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ userid: userid }),
                success: function (response) {
                    bindpath = "";
                    bindimage = "";
                    swalInit.fire({
                        title: response.d,
                        text: '',
                        icon: 'success'
                    });
                },
                error: function (error) {
                    swalInit.fire({
                        title: 'An error occurred while deleting the image.',
                        text: '',
                        icon: 'error'
                    });
                }
            });

            const emptyPreviewHTML = `<tr data-id="empty"><td colspan="1" class="text-center text-gray-500 py-30px"><div class="mb-10px"><i class="fa fa-file fa-3x"></i></div><div class="fw-bold">No file selected</div></td></tr> `;
            $('.files').html(emptyPreviewHTML);
        });

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            loadUsers();

            $('#ddluser').on('change', function () {
                var selectedUserId = $(this).val();

                if (selectedUserId === "0") {
                    $('#ddlmasteruser').empty().append($('<option>', { value: 0, text: 'Select Master User' }));
                    $('#ddlrole').empty().append($('<option>', { value: 0, text: 'Select Role' }));
                    return;
                }

                loadMasterUsers(selectedUserId);
            });

            $('#ddlmasteruser').on('change', function () {
                var selectedMasterId = $(this).val();
                var selectedUserId = $('#ddluser').val();

                if (selectedMasterId === "0") {
                    $('#ddlrole').empty().append($('<option>', { value: 0, text: 'Select Role' }));
                    return;
                }

                loadRoles(selectedUserId, selectedMasterId);
            });
        });

        function loadUsers(selectedUserId = null) {
            $.ajax({
                type: "POST",
                url: "/templates/Master/AddUser.aspx/GetUSERList",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddluser');
                    ddl.empty().append($('<option>', { value: 0, text: 'Select User' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ID,
                            text: item.NAME
                        }));
                    });
                    if (selectedUserId !== null) {
                        ddl.val(selectedUserId).trigger('change');
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error loading users: " + error);
                }
            });
        }

        function loadMasterUsers(userId, selectedMasterUserId = null) {
            $.ajax({
                type: "POST",
                url: "/templates/Master/AddUser.aspx/GetmasteruserList",
                data: JSON.stringify({ typeid: userId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlmasteruser');
                    ddl.empty().append($('<option>', { value: 0, text: 'Select Master User' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ID,
                            text: item.NAME
                        }));
                    });
                    if (selectedMasterUserId !== null) {
                        ddl.val(selectedMasterUserId);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error loading master users: " + error);
                }
            });
        }

        function loadRoles(userId, masterId, selectRolesId = null) {
            $.ajax({
                type: "POST",
                url: "/templates/Master/AddUser.aspx/GetRoleList",
                data: JSON.stringify({ user_table_id: userId, master_table_id: masterId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var ddl = $('#ddlrole');
                    ddl.empty().append($('<option>', { value: 0, text: 'Select Role' }));

                    var data = JSON.parse(response.d);
                    $.each(data, function (i, item) {
                        ddl.append($('<option>', {
                            value: item.ROLEID,
                            text: item.NAME
                        }));
                    });
                    if (selectRolesId !== null) {
                        ddl.val(selectRolesId);
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error loading roles: " + error);
                }
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hidUsersTId" />
    <asp:HiddenField runat="server" ID="hidUserId" />
    <asp:HiddenField runat="server" ID="hidMasterId" />
    <asp:HiddenField runat="server" ID="hidroleId" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <div class="container-fluid mt-3">
        <div class="card">
            <div class="card-header card-hearder-custom d-flex align-items-center py-0">
                <h6 class="mb-0">Add User</h6>
                <div class="ms-auto my-auto py-sm-1">
                    <button type="button" id="btnadd" class="btn btn-light">+ Add</button>
                    <button type="button" id="btnback" style="display: none" class="btn btn-light">Back</button>
                </div>
            </div>
            <div class="card-body" id="divadd" style="display:none">
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="form-label">User Name <span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <input type="text" id="txtuname_add" class="form-control" placeholder="User Name" />
                        </div>
                        <div class="invalid-feedback" id="lblreqname">Enter your username</div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Full Name<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <input type="text" id="txtfullname" class="form-control" placeholder="Full Name" />
                        </div>
                        <div class="invalid-feedback" id="lblreqfirmname"></div>

                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Phone Number<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <input type="tel" id="txtphone" class="form-control" placeholder="Phone Number" maxlength="10" autocomplete="off"
                                onkeydown="return (/^[0-9]*$/.test(event.key) || event.keyCode === 8 || event.keyCode === 9);">
                        </div>
                        <div class="invalid-feedback" id="lblreqphone"></div>

                    </div>


                    <div class="col-md-3 mb-3">
                        <label class="form-label">Email<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <input type="email" id="txtmail" class="form-control" placeholder="Email" />
                        </div>
                        <div class="invalid-feedback" id="lblreqmail"></div>

                    </div>
                    </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Password<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <input type="password" id="txtpassword" class="form-control" placeholder="Password"
                                onmouseover="this.type='text'" onmouseout="this.type='password'" />
                        </div>
                        <div class="invalid-feedback" id="lblreqpass"></div>
                        <div class="invalid-feedback" id="lblstrogpass"></div>

                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Confirm Password<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <input type="password" id="txtconfmpass" class="form-control" placeholder="Confirm Password"
                                onmouseover="this.type='text'" onmouseout="this.type='password'" />
                        </div>
                        <div class="invalid-feedback" id="lblreqconfmpass">Password DoNot Match</div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Login From<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddllogin" class="form-select select">
                                <option value="0">Select Login</option>
                                <option value="OFFICER">Officer</option>
                                <option value="IPP">Ipp</option>
                            </select>
                        </div>
                        <div class="invalid-feedback" id="lblloginfrom"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">User From<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddluser" class="form-select select">
                                <option value="0">Select User</option>

                            </select>
                        </div>
                        <div class="invalid-feedback" id="lbluserfrom"></div>
                    </div>
                    </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Master User<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlmasteruser" class="form-select select ">
                                <option value="0">Select Master User</option>

                            </select>
                        </div>
                        <div class="invalid-feedback" id="lbl_master_roles"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Designation<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlrole" class="form-select select">
                                <option value="0">Select Designation</option>
                            </select>
                        </div>
                        <div class="invalid-feedback" id="lblroles"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Active<span class="text-danger">*</span> </label>
                        <div class="p-2 ">
                            <div class="form-check form-check-inline mb-1">
                                <input type="radio" class="form-check-input" name="inlineRadioOptions" id="Active" value="ACTIVE" checked>
                                <label class="form-check-label" for="cr_l_i_s">Active</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="inlineRadioOptions" id="In-Active" value="INACTIVE">
                                <label class="form-check-label" for="cr_l_i_u">INACTIVE</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Remark </label>
                        <textarea id="txtremark" class="form-control" placeholder="Remarks" rows="3"></textarea>
                    </div>
                    </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Upload Profile Image<span class="text-danger">*</span> </label>

<%--                        <div class="btn btn-primary btn-file" tabindex="500">
                            <i class="ph-file-plus me-2"></i>  
                            <span class="hidden-xs">Add Profile Image...</span>
                            <input type="file" name="files[]" multiple style="display: none" class="file-input-caption hide" onchange="handleFileSelection(event)">
                        </div>--%>


                        <div class="input-group flex-nowrap mb-2">
                            <span class="btn btn-primary fileinput-button me-1">
                                <i class="ph-file-plus me-2"></i>  
                                <span class="hidden-xs">Add Profile Image</span>
                                <input type="file" name="files[]" multiple style="display: none" class="hide" onchange="handleFileSelection(event)">
                            </span>
                        </div>
                    </div>
                    
                
                    <div class="col-md-6 mb-3">
                        <div class="table-responsive">
                            <table class="table table-panel text-nowrap mb-0 m-0">
                                <thead>
                                    <tr>
                                        <th width="10%" class="pt-0 my-0 px-0">PROFILE PREVIEW</th>
                                        <th class="pt-0 my-0 px-0">FILE INFO</th>
                                    </tr>
                                </thead>
                                <tbody class="files">
                                    <tr data-id="empty">
                                        <td colspan="1" class="text-center text-gray-500 py-30px">
                                            <div class="mb-10px"><i class="fa fa-file fa-3x"></i></div>
                                            <div class="fw-bold">No file selected</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="text-end">
                        <button id="btnSave" class="btn btn-primary" type="button">Save</button>
                        <button id="btnupdate" class="btn btn-primary" style="display: none" type="button">Update</button>
                        <button type="button" id="btnLogView" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#modal_xlarge">Log View</button>
                        <button id="btnclear" class="btn btn-flat-secondary" type="button">Clear</button>
                    </div>
                </div>
            </div>

            <div class="card-body" id="divrow">
                <div id="bindata">
                    <table id="UserTable" class="table table-striped table-bordered">
                        <thead>
                            <tr id="tableHeadRow"></tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>

            <div id="modal_xlarge" class="modal fade" tabindex="-1">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">User LOG</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">

                            <table id="UserTable_Log" class="table table-striped table-bordered">
                                <thead>
                                    <tr id="tableHeadRow_Log"></tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

