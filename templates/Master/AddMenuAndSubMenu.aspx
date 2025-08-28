<%@ Page Title="" Language="C#" MasterPageFile="~/GTDMaster.master" AutoEventWireup="true" CodeFile="AddMenuAndSubMenu.aspx.cs" Inherits="AddMenuAndSubMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!--<style>
        .spcolor {
            color: red;
        }

        .dataTables_wrapper {
            width: 100%;
            overflow-x: auto;
        }
    </style>-->
    <script src="../../../assets/js/vendor/ui/dragula.min.js"></script>
    <script src="../../../assets/js/vendor/uploaders/bs_custom_file_input.min.js"></script>
    <script src="../../../assets/demo/pages/extension_dnd.js"></script>
    <script type="text/javascript">
        var menuHiddenIdClient = '<%= MenuHidenId.ClientID %>';
        var activeTabClientID = '<%= hdnActiveTab.ClientID %>';

        var subMenuHiddenIdClient = '<%= SubMenuHdenId.ClientID %>';
        var menuHiddenIdClient1 = '<%= MenuHidenId1.ClientID %>';

        var NestedMenuHiddenIdClient = '<%= NestedSubMenuHdenId.ClientID %>';
        var SubMenuHiddenIdClientID = '<%= SubmenuIdHidden.ClientID %>';

        var DeepsubMenuHiddenIdClientID = '<%= DeepMenuHidenId.ClientID %>';
        var NestedMenuIdClientID = '<%= NestedIdHidden.ClientID %>';

    </script>
    <script src="../Menus/Add_Menu.js"></script>


    <script src="../Menus/Add_SubMenu.js"></script>

    <script src="../Menus/Add_NestedSubMenu.js"></script>

    <script src="../Menus/Add_DeepNestedSubMenu.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <asp:HiddenField ID="hdnActiveTab" runat="server" />
    <asp:HiddenField runat="server" ID="MenuHidenId" />
    <asp:HiddenField runat="server" ID="SubMenuHdenId" />
    <asp:HiddenField runat="server" ID="MenuHidenId1" />
    <asp:HiddenField runat="server" ID="NestedSubMenuHdenId" />
    <asp:HiddenField runat="server" ID="SubmenuIdHidden" />
    <asp:HiddenField runat="server" ID="DeepMenuHidenId" />
    <asp:HiddenField runat="server" ID="NestedIdHidden" />


    <div class="container-fluid mt-3">
        <div class="card">
            <div class="card-header">
                <h6 class="mb-0">Add Menu Master</h6>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3">
                    <li class="nav-item">
                        <a href="#js-tab1" class="nav-link active" data-bs-toggle="tab">Menu
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#js-tab2" class="nav-link" data-bs-toggle="tab">Submenu
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#js-tab3" class="nav-link" data-bs-toggle="tab">Nested SubMenu
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#js-tab4" class="nav-link" data-bs-toggle="tab">Deep Nested SubMenu
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <%--MenuTable--%>
                    <div class="tab-pane fade show active" id="js-tab1">
                        <% Server.Execute("/templates/Menus/Add_Menu.aspx"); %>
                    </div>
                    <%--SubMenuTable--%>
                    <div class="tab-pane fade" id="js-tab2">
                        <% Server.Execute("/templates/Menus/Add_SubMenu.aspx"); %>
                    </div>
                    <%--NestedSubMenuTable--%>
                    <div class="tab-pane fade" id="js-tab3">
                        <% Server.Execute("/templates/Menus/Add_NestedSubMenu.aspx"); %>
                    </div>

                    <%--DeepSubMenuTable--%>
                    <div class="tab-pane fade" id="js-tab4">
                        <% Server.Execute("/templates/Menus/Add_DeepNestedSubMenu.aspx"); %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

