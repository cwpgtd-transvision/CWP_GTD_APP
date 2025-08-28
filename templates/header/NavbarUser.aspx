<li class="nav-item nav-item-dropdown-lg dropdown">
    <a href="#" class="navbar-nav-link align-items-center rounded-pill p-1" data-bs-toggle="dropdown">
        <div class="status-indicator-container">

            <img id="userImage" src="/assets/images/ProfileImages/DefaultUser.jpg" class="w-32px h-32px rounded-pill" />
            <span class="status-indicator bg-success"></span>
        </div>
        <span class="d-none d-lg-inline-block mx-lg-2 me-1" id="user_name"></span>
        <i class="ph ph-caret-down fs-lg"></i>
    </a>

    <div class="dropdown-menu dropdown-menu-end">
        <a href="/templates/master/Employee_Profile.aspx" class="dropdown-item">
            <i class="ph-user-circle me-2"></i>
            My profile
        </a>
    <%--    <a href="#" class="dropdown-item">
            <i class="ph-currency-circle-dollar me-2"></i>
            My subscription
        </a>
        <a href="#" class="dropdown-item">
            <i class="ph-shopping-cart me-2"></i>
            My orders
        </a>
        <a href="#" class="dropdown-item">
            <i class="ph-envelope-open me-2"></i>
            My inbox
			<span class="badge bg-primary rounded-pill ms-auto">26</span>
        </a>
        <div class="dropdown-divider"></div>--%>
     <%--   <a href="#" class="dropdown-item">
            <i class="ph-gear me-2"></i>
            Account settings
        </a>--%>
        <a href="/templates/login/LoginMain.aspx" class="dropdown-item" id="btnLogout">
            <i class="ph-sign-out me-2"></i>
            Logout
        </a>
    </div>
</li>


<script>
    $(document).ready(function () {

        $('#btnLogout').click(function (e) {
            e.preventDefault();

            const swalInit = swal.mixin({
                buttonsStyling: false,
                customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-light',
                    denyButton: 'btn btn-light',
                    input: 'form-control'
                }
            });

            swalInit.fire({
                title: 'Are you sure?',
                text: 'You will be logged out from this session.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, log me out',
                cancelButtonText: 'Cancel',
                buttonsStyling: false,
                customClass: {
                    confirmButton: 'btn btn-danger',
                    cancelButton: 'btn btn-secondary'
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: "/templates/login/LoginMain.aspx/ClearLogoutSessions",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            sessionToken: sessionStorage.getItem("SessionToken")
                        }),
                        success: function (response) {

                            if (response.d === "Y") {
                                sessionStorage.clear();
                                window.location.href = "/templates/login/LoginMain.aspx";
                            } else {
                                swalInit.fire(
                                    'Failed to logout',
                                    response.d,
                                    'error'
                                );
                            }
                        },
                        error: function () {
                            swalInit.fire(
                                'Error',
                                'Logout failed due to server error.',
                                'error'
                            );
                        }
                    });
                }
            });
        });

        $.ajax({
            type: "POST",
            url: "/templates/login/LoginMain.aspx/GetUserDetails",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify({

            }),
            success: function (response) {
                debugger;
                var data = response.d;

                var username = data[0];
                var profileImagePath = data[1];

                $("#user_name").text(username);
                $("#userImage").attr("src", profileImagePath);
            },
            error: function () {

            }
        });

    });
</script>
