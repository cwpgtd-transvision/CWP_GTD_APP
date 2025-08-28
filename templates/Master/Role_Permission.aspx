<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Role_Permission.aspx.cs" Inherits="Role_Permission" %>

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
        //function BindRole() {
        //    $.ajax({
        //        type: "POST",
        //        url: "/templates/Master/Role_Permission.aspx/GetRoles",
        //        data: '{}',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (response) {
        //            var ddl = $('#ddlrole');
        //            ddl.empty();
        //            ddl.append($('<option>', { value: 0, text: 'Select Role' }));

        //            var data = JSON.parse(response.d); // since it's a JSON string
        //            $.each(data, function (i, item) {

        //                ddl.append($('<option>', {
        //                    value: item.ROLEID,
        //                    text: item.NAME
        //                }));
        //            });
        //        },
        //        error: function (xhr, status, error) {
        //            alert("Error: " + error);
        //        }
        //    });
        //}
        $(function () {
            //BindRole();
            loadUsers();
            Bind_main_sub_nested_menus();

            // Delegate change event for full access
            $(document).on('change', '#fullAccess', function () {
                const checked = this.checked;
                $('#divMenuss').find('input[type="checkbox"]').not(this).prop('checked', checked);
            });

            // Delegate change event for menu checkboxes
            $(document).on('change', '.menu-checkbox', function () {
                const checked = this.checked;
                const $card = $(this).closest('.card-menu');
                $card.find('input[type="checkbox"]').not(this).prop('checked', checked);
                updateFullAccess();
            });

            // Delegate change event for submenu checkboxes
            $(document).on('change', '.submenu-checkbox', function () {
                const checked = this.checked;
                const $submenuGroup = $(this).closest('.submenu-section');
                // Check/uncheck nested and deep nested inside this submenu-section
                $submenuGroup.find('.nested-checkbox, .deep-nested-checkbox').prop('checked', checked);

                // If checked, also check parent menu checkbox
                if (checked) {
                    $submenuGroup.closest('.card-menu').find('.menu-checkbox').prop('checked', true);
                } else {
                    // If none submenu or nested checked, uncheck menu
                    const anyChecked = $submenuGroup.closest('.card-menu').find('.submenu-checkbox:checked, .nested-checkbox:checked, .deep-nested-checkbox:checked').length > 0;
                    if (!anyChecked) {
                        $submenuGroup.closest('.card-menu').find('.menu-checkbox').prop('checked', false);
                    }
                }

                updateFullAccess();
            });

            // Delegate change event for nested checkboxes
            $(document).on('change', '.nested-checkbox', function () {
                const checked = this.checked;
                const $nestedFormCheck = $(this).closest('.form-check');

                // Check/uncheck deep nested inside this nested menu
                const $deepNestedMenu = $nestedFormCheck.next('.deep-nested-menu');
                if ($deepNestedMenu.length) {
                    $deepNestedMenu.find('.deep-nested-checkbox').prop('checked', checked);
                }

                // Update submenu checkbox based on nested/deep nested checked state
                const $submenuSection = $(this).closest('.submenu-section');
                const anyNestedChecked = $submenuSection.find('.nested-checkbox:checked, .deep-nested-checkbox:checked').length > 0;
                $submenuSection.find('.submenu-checkbox').prop('checked', anyNestedChecked);

                // Update menu checkbox based on submenu/nested/deep nested checked
                const $card = $(this).closest('.card-menu');
                const anyChecked = $card.find('.submenu-checkbox:checked, .nested-checkbox:checked, .deep-nested-checkbox:checked').length > 0;
                $card.find('.menu-checkbox').prop('checked', anyChecked);

                updateFullAccess();
            });

            // Delegate change event for deep nested checkboxes
            $(document).on('change', '.deep-nested-checkbox', function () {
                const $submenuSection = $(this).closest('.submenu-section');
                const anyNestedChecked = $submenuSection.find('.nested-checkbox:checked, .deep-nested-checkbox:checked').length > 0;
                $submenuSection.find('.submenu-checkbox').prop('checked', anyNestedChecked);

                const $card = $(this).closest('.card-menu');
                const anyChecked = $card.find('.submenu-checkbox:checked, .nested-checkbox:checked, .deep-nested-checkbox:checked').length > 0;
                $card.find('.menu-checkbox').prop('checked', anyChecked);

                updateFullAccess();
            });

            function updateFullAccess() {
                const allBoxes = $('#divMenuss').find('input[type="checkbox"]').not('#fullAccess');
                const allChecked = allBoxes.length === allBoxes.filter(':checked').length;
                $('#fullAccess').prop('checked', allChecked);
            }

          

            // Role dropdown change event
            $('#ddlrole').on('change', function () {
                const roleid = $(this).val();
                if (!roleid || roleid === '0') return;

                $.ajax({
                    type: "POST",
                    url: "/templates/Master/Role_Permission.aspx/binddata",
                    data: JSON.stringify({ roleid: roleid }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('input[type="checkbox"]').prop('checked', false);
                        if (response.d === "FULLACCESS") {
                            $('#divMenuss').find('input[type="checkbox"]').prop('checked', true);
                        } else if (response.d) {
                            const ids = response.d.split(',');
                            ids.forEach(id => $('#' + id).prop('checked', true));
                        }
                        updateFullAccess();
                    },
                    error: function () {
                        alert('Failed to load permissions.');
                    }
                });
            });

            // Save button click event
            $('#btnSave').on('click', function () {
                const Userid = $('#ddluser').val();
                const MasterId = $('#ddlmasteruser').val();
                const roleid = $('#ddlrole').val();
                if (!Userid || Userid === '0') {
                    showWarningmessage('Select User');
                    return;
                }
                if (!MasterId || MasterId === '0') {
                    showWarningmessage('Select Master User');
                    return;
                }
                if (!roleid || roleid === '0') {
                    showWarningmessage('Select role');
                    return;
                }

                const selectedValues = [];
                $('#divMenuss').find('input[type="checkbox"]:checked').each(function () {
                    const val = $(this).val();
                    if (val && val !== 'on') selectedValues.push(val);
                });

                $.ajax({
                    type: "POST",
                    url: "/templates/Master/Role_Permission.aspx/SaveMenuIDS",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ SelectedChecked: selectedValues.join(','), Rollid: roleid }),
                    dataType: "json",
                    success: function (response) {
                        if (response.d === 'Save') {
                            swalInit.fire({ title: 'Success', text: 'Menu Data Saved Successfully!', icon: 'success' });
                        } else {
                            swalInit.fire({ title: 'Warning', text: 'Menu data Not Saved!', icon: 'warning' });
                        }
                    },
                    error: function () {
                        swalInit.fire({ title: 'Error', text: 'Failed To Save The User', icon: 'error' });
                    }
                });
            });
        });
        // Bind menus dynamically
        function Bind_main_sub_nested_menus() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/Role_Permission.aspx/Bind_main_sub_nested_menus",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#divMenuss').html(response.d);
                    updateFullAccess(); // initial update after load
                },
                error: function (xhr, status, error) {
                    alert("Error loading menus: " + error);
                }
            });
        }
    </script>
    <script >
        $(document).ready(function () {
            loadUsers();

   
            $('#ddluser').on('change', function () {
                var selectedUserId = $(this).val();

                if (selectedUserId === "0") {
                    $('#ddlmasteruser').empty().append($('<option>', { value: 0, text: 'Select Master User' }));
                    $('#ddlrole').empty().append($('<option>', { value: 0, text: 'Select Role' })); 
                    return;
                }
                $('#ddlmasteruser').empty().append($('<option>', { value: 0, text: 'Select Master User' }));
                $('#ddlrole').empty().append($('<option>', { value: 0, text: 'Select Role' }));

                Bind_main_sub_nested_menus();
                loadMasterUsers(selectedUserId);
            });

            $('#ddlmasteruser').on('change', function () {
                var selectedMasterId = $(this).val();
                var selectedUserId = $('#ddluser').val();

                if (selectedMasterId === "0") {
                    $('#ddlrole').empty().append($('<option>', { value: 0, text: 'Select Role' }));
                    return;
                }
                Bind_main_sub_nested_menus();
                BindRole(selectedUserId, selectedMasterId);
            });
        });

        function loadUsers() {
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
                },
                error: function (xhr, status, error) {
                    alert("Error loading users: " + error);
                }
            });
        }

        function loadMasterUsers(userId) {
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
                },
                error: function (xhr, status, error) {
                    alert("Error loading master users: " + error);
                }
            });
        }

        //function BindRole() {
        //    $.ajax({
        //        type: "POST",
        //        url: "/templates/Master/Role_Permission.aspx/GetRoles",
        //        data: '{}',
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (response) {
        //            var ddl = $('#ddlrole');
        //            ddl.empty();
        //            ddl.append($('<option>', { value: 0, text: 'Select Role' }));

        //            var data = JSON.parse(response.d); // since it's a JSON string
        //            $.each(data, function (i, item) {

        //                ddl.append($('<option>', {
        //                    value: item.ROLEID,
        //                    text: item.NAME
        //                }));
        //            });
        //        },
        //        error: function (xhr, status, error) {
        //            alert("Error: " + error);
        //        }
        //    });
        //}
        function BindRole(userId, masterId) {
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
                },
                error: function (xhr, status, error) {
                    alert("Error loading roles: " + error);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container pt-3">
        <div class="card  ">
            <div class="card-header">
                <h6 class="mb-0">Give Permission to Roles</h6>
            </div>
            <div class="card-body ">
                <div class="row">
                    <div class="col-md-3">
                        <label class="form-label">User From<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddluser" class="form-select select">
                                <option value="0">Select User</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <label class="form-label">Master User<span class="text-danger">*</span> </label>
                        <div class="input-group">
                            <select id="ddlmasteruser" class="form-select select ">
                                <option value="0">Select Master User</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Select Role<span class="text-danger">*</span> :</label>
                        <select class="form-select select" id="ddlrole">
                            <option value="0" selected="selected">Select Role</option>
                        </select>
                    </div>
                </div>
                <div>
                    <div id="divMenuss"></div>
                </div>


                <div class="row">
                    <div class="text-end">
                        <button id="btnSave" class="btn btn-primary" type="button">Save</button>
                    </div>
                </div>

            </div>
            
        </div>
    </div>

</asp:Content>

