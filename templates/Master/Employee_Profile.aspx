<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="Employee_Profile.aspx.cs" Inherits="Employee_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        var imagename = "";
        var base64Image = "";
        var fileModify = "No";
        const swalInit = swal.mixin({
            buttonsStyling: false,
            customClass: {
                confirmButton: 'btn btn-primary',
                cancelButton: 'btn btn-light',
                denyButton: 'btn btn-light',
                input: 'form-control'
            }
        });
        $(document).ready(function () {
            loadUserProfileImage();
            $('#btnclear').on('click', function () {
                $('#txtFullName, #txtPhone, #txtEmail, #txtAddress').val('');
            });
            $('#btnchangepassword').click(function () {
                debugger;
                var current = $('#txtpass').val();
                var newpass = $('#txtnew').val();
                var confirm = $('#txtre').val();
                // Validate Current Password
                if (!validateField(current, "#lblcurrentpass", "Current Password is required", "#txtpass")) {
                    swalInit.fire({
                        title: 'Error!',
                        text: 'Current Password is required.',
                        icon: 'error',
                        confirmButtonText: 'Close',
                        buttonsStyling: false,
                        customClass: { confirmButton: 'btn btn-danger' }
                    });
                    return;
                }

                // Validate New Password
                if (!validateField(newpass, "#lblnewpass", "New Password is required", "#txtnew")) {
                    swalInit.fire({
                        title: 'Error!',
                        text: 'New Password is required.',
                        icon: 'error',
                        confirmButtonText: 'Close',
                        buttonsStyling: false,
                        customClass: { confirmButton: 'btn btn-danger' }
                    });
                    return;
                }

                // New Password Strength Check
                var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,20}$/;
                if (!passwordPattern.test(newpass)) {
                    swalInit.fire({
                        title: 'Password Strength Error!',
                        text: 'New Password must be 8-20 characters long and include uppercase, lowercase, a number, and a special character.',
                        icon: 'warning',
                        confirmButtonText: 'Close',
                        buttonsStyling: false,
                        customClass: { confirmButton: 'btn btn-warning' }
                    });
                    $("#txtnew").focus();
                    return;
                }

                // Validate Re-enter New Password
                if (!validateField(confirm, "#lblreenterpass", "Re-enter New Password is required", "#txtre")) {
                    swalInit.fire({
                        title: 'Error!',
                        text: 'Re-enter New Password is required.',
                        icon: 'error',
                        confirmButtonText: 'Close',
                        buttonsStyling: false,
                        customClass: { confirmButton: 'btn btn-danger' }
                    });
                    return;
                }
                if (newpass != confirm) {
                    swalInit.fire({
                        title: 'Warning',
                        text: 'New Password and Confirm Password do not match!',
                        icon: 'warning'
                    });
                    $('#txtpass').val('');
                    $('#txtnew').val('');
                    $('#txtre').val('');
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: "/templates/Master/Employee_Profile.aspx/ChangePassword",
                    data: JSON.stringify({ currentPassword: current, newPassword: newpass }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        debugger;
                        var result = response.d;
                        var message = '';

                        if (result === "Password changed successfully.") {
                            message = "Password changed successfully.";
                        } else if (result === "Failed to update password.") {
                            message = "Failed to update password.";
                        } else if (result === "Invalid current password.") {
                            message = "Invalid current password.";
                        } else if (result === "Password changed successfully.- sessionExpired") {
                            swalInit.fire({
                                title: 'Password Changed!',
                                icon: 'success',
                                buttons: {
                                    confirm: {
                                        text: 'OK',
                                        value: true,
                                        visible: true,
                                        className: 'btn btn-success',
                                        closeModal: true
                                    }
                                }
                            }).then((value) => {
                                if (value) {
                                    window.location.href = '/templates/login/LoginMain.aspx';
                                }
                            });
                            return;
                        }

                        swalInit.fire({
                            title: message,
                            icon: result === "Password changed successfully." ? 'success' : 'warning',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: { confirmButton: 'btn btn-primary' }
                        }).then((value) => {
                            if (value) {
                                window.location.href = '/templates/login/LoginMain.aspx';
                            }
                        });

                        $('#txtpass').val('');
                        $('#txtnew').val('');
                        $('#txtre').val('');
                    },
                    error: function () {
                        swalInit.fire({
                            title: 'Error',
                            text: 'An error occurred while changing the password.',
                            icon: 'error',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: { confirmButton: 'btn btn-danger' }
                        });
                    }
                });
            });
        });


        function loadUserProfileImage() {
            $.ajax({
                type: "POST",
                url: "/templates/Master/Employee_Profile.aspx/getdata",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                   
                    if (response.d.success) {
                        $('#profileImage').attr('src', response.d.imageUrl);
                        $('#profileImage1').attr('src', response.d.imageUrl);
                        $('#lblUserName').text(response.d.userName);
                        $('#lblFullName').text(response.d.fullname);
                        $('#lblPhone').text(response.d.phone);
                        $('#lblEmail').text(response.d.email);
                        $('#lblAddress').text(response.d.address);
                        $('#txtUserName').val(response.d.userName);
                        $('#txtFullName').val(response.d.fullname);
                        $('#txtPhone').val(response.d.phone);
                        $('#txtEmail').val(response.d.email);
                        $('#txtAddress').val(response.d.address);
                    } else {
                        alert(response.d.message);
                    }
                }
            });
        }

        function validateField(value, labelSelector, errorMessage, inputSelector) {
            if (value.trim() === "") {
                $(labelSelector).show().text(errorMessage);
                $(inputSelector).focus();
                return false;
            }
            $(labelSelector).hide();
            return true;
        }

        function saveProfile() {
            var phone = $('#txtPhone').val().trim();
            var phonePattern = /^[6-9]\d{9}$/;  // Phone should start with 6-9 and be exactly 10 digits
            var email = $('#txtEmail').val().trim();
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // Basic email pattern
            var gmailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/; // Gmail specific pattern

            // Phone number validation
            if (!phonePattern.test(phone)) {
                swalInit.fire({
                    title: 'Invalid Phone Number!',
                    text: 'Phone number must start with 6-9 and contain exactly 10 digits.',
                    icon: 'error',
                    confirmButtonText: 'Close',
                    buttonsStyling: false,
                    customClass: { confirmButton: 'btn btn-danger' }
                });
                return false; // Prevent further execution if phone is invalid
            }

            // General email validation
            if (!emailPattern.test(email)) {
                swalInit.fire({
                    title: 'Invalid Email!',
                    text: 'Please enter a valid email address.',
                    icon: 'error',
                    confirmButtonText: 'Close',
                    buttonsStyling: false,
                    customClass: { confirmButton: 'btn btn-danger' }
                });
                return false; // Prevent further execution if email is invalid
            }

            // Gmail-specific validation (if required)
            if (!gmailPattern.test(email)) {
                swalInit.fire({
                    title: 'Warning!',
                    text: 'Please enter a valid Gmail address (e.g. user@gmail.com).',
                    icon: 'warning',
                    confirmButtonText: 'Close',
                    buttonsStyling: false,
                    customClass: { confirmButton: 'btn btn-warning' }
                });
                return false; // Prevent further execution if the Gmail pattern does not match
            }

            // Prepare data for AJAX submission
            const data = {
                userName: $('#txtUserName').val(),
                imageUrl: $('#profileImage1').val(),
                fullname: $('#txtFullName').val(),
                phone: phone,
                email: email,
                address: $('#txtAddress').val(),
                base64Image: base64Image,
                imagename: imagename,
                fileModify: fileModify
            };

            // Make AJAX call to save user profile
            $.ajax({
                type: "POST",
                url: "/templates/Master/Employee_Profile.aspx/SaveUserProfile",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;

                    if (result === "User Saved Successfully") {

                        swalInit.fire({
                            title: 'Session Expired!',
                            text: 'Your session has ended due to changes made to your profile.',
                            icon: 'info',
                            confirmButtonText: 'Login Again',
                            buttonsStyling: false,
                            customClass: { confirmButton: 'btn btn-primary' }
                        }).then(function () {
                            window.location.href = '/templates/login/LoginMain.aspx'; // Redirect to login page
                        });
                        return;
                    }

                    //if (result === "User Saved Successfully") {
                    //    swalInit.fire({
                    //        title: 'Profile saved successfully.',
                    //        icon: 'success',
                    //        confirmButtonText: 'OK',
                    //        buttonsStyling: false,
                    //        customClass: { confirmButton: 'btn btn-success' }
                    //    }).then(function () {
                    //        window.location.href = '/templates/login/LoginMain.aspx'; // Redirect after success
                    //    });
                    //}
                    else if (result.startsWith("Error:")) {
                        swalInit.fire({
                            title: 'Error!',
                            text: result,
                            icon: 'error',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: { confirmButton: 'btn btn-danger' }
                        });
                    } else {
                        swalInit.fire({
                            title: 'Warning!',
                            text: result,
                            icon: 'warning',
                            confirmButtonText: 'Close',
                            buttonsStyling: false,
                            customClass: { confirmButton: 'btn btn-warning' }
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.error(error);
                    swalInit.fire({
                        title: 'Error!',
                        text: 'An error occurred while saving the profile.',
                        icon: 'error',
                        confirmButtonText: 'Close',
                        buttonsStyling: false,
                        customClass: { confirmButton: 'btn btn-danger' }
                    });
                }
            });
        }

    </script>


    <script>

        function uploadFileBase64(input) {
            debugger;
            if (input.files && input.files[0]) {
                const file = input.files[0];
                const reader = new FileReader();

                reader.onload = function (e) {
                    base64Image = e.target.result;
                    // Save file name
                    imagename = file.name;
                    // Set image preview
                    document.getElementById('profileImage1').src = e.target.result;
                    fileModify = 'yes';
                };

                reader.readAsDataURL(file); // Converts file to base64
            }
        }

        function deleteImage() {
            document.getElementById('profileImage1').src = "/assets/images/ProfileImages/DefaultUser.jpg";
            document.getElementById('Uploadedfile').value = "";
            base64Image = "";
            imagename = "";
            fileModify = 'yes';

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="card ">
            <div class="card-header ">
                User Profile
            </div>
            <div class="card-body ">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                <img id="profileImage" src="" alt="Profile Image"
                                    style="border-radius: 50%; height: 110px; width: 112px;" />
                                <label id="userName" class="form-label"></label>
                            </div>
                            <div class="card-header">
                                <h6 class="mb-0">Profile Details</h6>
                            </div>
                            <div class="card-body profile-card pt-4 d-flex flex-column">
                                <div class="row">
                                    <label class="col-form-label col-lg">User Name :</label>
                                    <div class="col-lg-6">
                                        <label class="col-form-label col-lg" id="lblUserName"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-form-label col-lg">Full Name :</label>
                                    <div class="col-lg-6">
                                        <label class="col-form-label col-lg" id="lblFullName"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-form-label col-lg">Phone :</label>
                                    <div class="col-lg-6">
                                        <label class="col-form-label col-lg" id="lblPhone"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-form-label col-lg">Email :</label>
                                    <div class="col-lg-6">
                                        <label class="col-form-label col-lg" id="lblEmail"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-form-label col-lg">Address :</label>
                                    <div class="col-lg-6">
                                        <label class="col-form-label col-lg" id="lblAddress"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7">
                        <div class="card card-body">
                            <ul class="nav nav-tabs mb-3">
                                <li class="nav-item">
                                    <a href="#js-tab2" class="nav-link active" data-bs-toggle="tab">Edit Profile
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#js-tab3" class="nav-link" data-bs-toggle="tab">Change Password
                                    </a>
                                </li>
                            </ul>

                            <div class="tab-content ">
                                <div class="tab-pane fade show active" id="js-tab2">
                                    <div class="card-body profile-card pt-2 d-flex flex-column align-items-center">
                                        <div class="row">
                                            <img id="profileImage1" src="" alt="Profile Image"
                                                style="border-radius: 50%; height: 140px; width: 160px;" />
                                        </div>
                                        <div class="row mt-4">
                                            <div class="d-flex align-items-center ">
                                                <button type="button" class="btn btn-link p-0 border-0" onclick="document.getElementById('Uploadedfile').click();">
                                                    <i class="icon-file-upload2 text-success icon-1x"></i>Upload
                                                </button>
                                                <span id="lblfilename" class="link link-primary"></span>
                                                <input type="file" id="Uploadedfile" style="display: none;" accept=".png,.jpg,.jpeg,.gif" onchange="uploadFileBase64(this)" />

                                                <button type="button" class="btn btn-link p-0 border-0 ms-5" onclick="deleteImage();">
                                                    <i class="icon-bin text-danger icon-1x"></i>Delete
                                                </button>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">User Name :</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtUserName" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">Full Name :</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtFullName" autocomplete="off">
                                        </div>
                                    </div>

                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">Phone :</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtPhone" maxlength="10" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">Email :</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtEmail" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">Address :</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtAddress" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="text-end">
                                            <button id="btnSave" class="btn btn-primary" type="button" onclick="saveProfile()">Save</button>
                                            <button id="btnclear" class="btn btn-warning" type="button">Clear</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="js-tab3">
                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">Current Password :</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" id="txtpass" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">New Password :</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" id="txtnew" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label class="col-form-label col-lg-3">Re-enter New Password :</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" id="txtre" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="text-end">
                                            <button id="btnchangepassword" class="btn btn-primary" type="button">Change Password</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

