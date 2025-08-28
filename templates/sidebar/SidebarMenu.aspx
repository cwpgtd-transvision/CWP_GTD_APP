<!-- Main navigation -->
<div class="sidebar-section">
    <div class="sidebar-section-body d-flex justify-content-center">
        <h5 class="sidebar-resize-hide flex-grow-1 my-auto">Navigation</h5>

        <div>
            <button id="sideBarToogle" type="button" class="btn btn-flat-white btn-icon btn-sm rounded-pill border-transparent sidebar-control sidebar-main-resize d-none d-lg-inline-flex">
                <i class="ph-arrows-left-right"></i>
            </button>

            <button type="button" class="btn btn-flat-white btn-icon btn-sm rounded-pill border-transparent sidebar-mobile-main-toggle d-lg-none">
                <i class="ph-x"></i>
            </button>
        </div>
    </div>
</div>
<div class="sidebar-section">
    <div id="dynamicMenuContainer"></div>
<%--    <ul class="nav nav-sidebar" data-nav-type="accordion">
        <li class="nav-item"><span class="nav-link"><b>FOR DEVS - ALL COMPONENTS</b></span></li>
        <li class="nav-item"><a href="/Home1.aspx" class="nav-link"><i class="ph ph-file"></i><span>Home1</span></a></li>
        <li class="nav-item"><a href="/Datatables.aspx" class="nav-link"><i class="ph ph-file"></i><span>Tables</span></a></li>
    </ul>--%>

</div>

<script>
    $(document).ready(function () {

        menubinding1();
    });

    function menubinding1() {
        $.ajax({
            type: "POST",
            url: "/Home.aspx/bindSidemenu",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify({}),
            success: function (response) {
                var data = response.d;
                if (data === "SESSION_EXPIRED") {
                    window.location.href = "/templates/login/LoginMain.aspx";
                    return;
                }
                else {
                    $('#dynamicMenuContainer').html(data);
                    $(document).on('click', '.nav-item-submenu > .nav-link', function (e) {
                        e.preventDefault();
                        var $parent = $(this).parent();

                        $parent
                            .siblings('.nav-item-submenu.nav-item-open')
                            .removeClass('nav-item-open')
                            .children('.nav-group-sub').slideUp(200);

                        $parent.toggleClass('nav-item-open');
                        $parent.children('.nav-group-sub').slideToggle(200);
                    });
                    highlightCurrentMenuByUrl();
                }

            }
        });

        function highlightCurrentMenuByUrl() {
            var currentPath = window.location.pathname.toLowerCase().replace(/\/+$/, '');

            $('#dynamicMenuContainer .nav-item-submenu').removeClass('nav-item-open');
            $('#dynamicMenuContainer .nav-group-sub').removeClass('show').hide();
            $('#dynamicMenuContainer .nav-link').removeClass('active');


            $("#dynamicMenuContainer .nav-link").each(function () {
                var href = $(this).attr("href");
                if (!href) return; // Skip if no href (e.g., JS links or headers)

                href = href.toLowerCase().replace(/\/+$/, '');

                if (currentPath === href || currentPath.includes(href)) {
                    $(this).addClass("active");

                    // Open all parents if it’s inside a submenu
                    $(this).parents(".nav-group-sub").each(function () {
                        $(this).addClass("show").show();
                    });

                    $(this).parents(".nav-item-submenu").each(function () {
                        $(this).addClass("nav-item-open");
                        $(this).children("a.nav-link").addClass("active");
                    });
                }
            });
        }
    }


</script>

<!-- /main navigation -->
