<!-- Main sidebar -->
<div id="sideBar" class="sidebar sidebar-dark sidebar-main sidebar-expand-lg">

    <% Server.Execute("~/templates/sidebar/SidebarHeader.aspx") %>
    <!-- Sidebar content -->
    <div class="sidebar-content">
        <% Server.Execute("~/templates/sidebar/SidebarMenu.aspx") %>
    </div>
    <!-- /sidebar content -->
</div>