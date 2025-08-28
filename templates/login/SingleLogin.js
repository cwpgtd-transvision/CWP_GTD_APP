$(document).ready(function () {
    $('#btnSubmitEmail').on('click', function () {

        const input = $('#Intmail').val().trim();

        if (!input) {
            showAlert('warning', 'Warning', 'Please enter an email or username.');
            return;
        }

        $.ajax({

            type: "POST",
            url: "SingleLogin.aspx/btnSubmitEmail",
            data: JSON.stringify({ input }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                const res = response.d;

                if (res === "success") {
                    showAlert('success', 'Success', 'Mail sent successfully.');
                } else if (res === "not_found") {
                    showAlert('warning', 'Warning', 'User does not exist.');
                } else {
                    showAlert('error', 'Error', 'An unexpected error occurred: ' + res);
                }
            },
            error: function (xhr, status, error) {
                showAlert('error', 'Error', 'Server error occurred: ' + error);
            }
        });
    });

    function showAlert(icon, title, message) {
        Swal.fire({
            icon: icon,
            title: title,
            text: message,
            confirmButtonText: 'OK',
            customClass: { confirmButton: 'btn btn-primary' },
            buttonsStyling: false
        });
    }
});

$(function () {
    $('button[type="reset"]').click(function () {
        $('#diverrorUser').hide();
        $('#diverrorPassword').hide();
    });

    $('#txtUserName').on('input', function () {
        var userName = $(this).val().trim();
        if (userName !== "") {
            $('#diverrorUser').hide();
        }
    });
    $('#txtpassword').on('input', function () {
        var password = $(this).val().trim();
        if (password !== "") {
            $('#diverrorPassword').hide();
        }
    });

    $('#btnSign').click(function (e) {
        e.preventDefault();

        var userName = $('#txtUserName').val().trim();
        var password = $('#txtpassword').val().trim();
        var flag = "First";
        var lblEmpID = $('#diverrorUser');
        var lblEmpPassword = $('#diverrorPassword');
        var isValid = true;
        lblEmpID.toggle(userName === "");
        lblEmpPassword.toggle(password === "");
        if (!isValid) return;

        $.ajax({
            type: 'post',
            dataType: 'json',
            contentType: 'application/json;charset=utf-8',
            url: '/templates/login/SingleLogin.aspx/btnOfficerLogin',
            data: JSON.stringify({ userName, password, flag }),
            success: function (response) {
                if (response.d === "Y") {
                    window.location.href = '/Home.aspx';
                } else if (response.d === "EXISTS") {

                    swalInit.fire({
                        title: 'Are you sure?',
                        text: "A session already exists. Do you want to log out and continue?",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Yes',
                        cancelButtonText: 'Cancel',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-primary',
                            cancelButton: 'btn btn-danger'
                        }
                    }).then(function (result) {
                        if (result.isConfirmed) {
                            const flag = "Second";
                            $.ajax({
                                type: 'post',
                                dataType: 'json',
                                contentType: 'application/json;charset=utf-8',
                                url: '/templates/login/SingleLogin.aspx/btnOfficerLogin',
                                data: JSON.stringify({ userName, password, flag }),
                                success: function (data) {

                                    if (data.d === "Y") {
                                        window.location.href = '/Home.aspx';
                                    }
                                }
                            });
                        }
                    });
                } else {

                    swalInit.fire({
                        title: 'Warning',
                        text: response.d,
                        icon: 'warning'
                    });
                }
            },
            error: function () {
            }
        });

    });
});