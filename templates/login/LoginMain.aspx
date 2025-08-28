<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginMain.aspx.cs" Inherits="LoginMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Login page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- /global stylesheets -->
    <link href="../../assets/fonts/inter/inter.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/icons/phosphor/styles.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/ltr/all.min.css" id="stylesheet" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/custom.css" rel="stylesheet" type="text/css" />

    <!-- Core JS files -->
    <script src="../../assets/demo/demo_configurator.js"></script>
    <script src="../../assets/js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../../assets/js/app.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script src="../../../assets/js/jquery/jquery.min.js"></script>
    <script src="../../../assets/js/vendor/notifications/sweet_alert.min.js"></script>
    <script src="../../../assets/js/vendor/forms/selects/select2.min.js"></script>
    <script src="../../../assets/js/vendor/forms/selects/bootstrap_multiselect.js"></script>

    <script src="../../../assets/demo/pages/extra_sweetalert.js"></script>
    <!-- /theme JS files -->

    <script src="LoginMain.js"></script>
</head>

<body class="bg-dark">

    <div class="page-content">
        <div class="content-wrapper">
            <div class="content-inner lgoin-page">

                <!-- Content area -->
                <div class="content align-content-center">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 px-0 d-none d-sm-none d-md-block">
                                    <div class="card mb-0 h-100 rounded-top-end-0 rounded-bottom-end-0">
                                        <div class="login-img-block">&nbsp;</div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-6 col-md-6 px-0 col-sm-12">

                                    <!-- Login form -->
                                    <form class="wmin-sm-400" action="index.html">
                                        <div class="card mb-0 rounded-top-start-0 rounded-bottom-start-0 custom-radius">
                                            <ul class="nav nav-tabs nav-tabs-underline nav-justified bg-light rounded-top-end mb-0 custom-radius-tab" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <a href="#login-tab1" class="nav-link rounded-top-start-0 active" data-bs-toggle="tab" aria-selected="true" role="tab">
                                                        <h6 class="my-1">Officer</h6>
                                                    </a>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <a href="#login-tab2" class="nav-link" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
                                                        <h6 class="my-1">IPP</h6>
                                                    </a>
                                                </li>
                                            </ul>

                                            <div class="tab-content card-body">
                                                <div class="tab-pane fade active show" id="login-tab1" role="tabpanel">
                                                    <div class="text-center mb-3">
                                                        <div class="d-inline-flex align-items-center justify-content-center mb-2 mt-2">
                                                            <img src="../../assets/images/kptcl-logo.png" class="h-48px" alt="" />
                                                        </div>
                                                        <h5 class="mb-0 fs-xl space-resp">Karnataka Power Transmission Corporation Limited</h5>
                                                        <span class="d-block text-muted">Welcome To KPCL(GTD)</span>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Username</label>
                                                        <div class="form-control-feedback form-control-feedback-start">
                                                            <input type="text" id="txtUserName" class="form-control" placeholder="john@doe.com" required="" />
                                                            <div class="invalid-feedback" id="diverrorUser">Enter your username</div>
                                                            <div class="form-control-feedback-icon">
                                                                <i class="ph-user-circle text-muted"></i>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Password</label>
                                                        <div class="form-control-feedback form-control-feedback-start">
                                                            <input type="password" id="txtpassword" class="form-control" placeholder="•••••••••••" required="" />
                                                            <div class="invalid-feedback" id="diverrorPassword">Enter your Password</div>
                                                            <div class="form-control-feedback-icon">
                                                                <i class="ph-lock text-muted"></i>
                                                            </div>
                                                        </div>
                                                        <%--<div class="invalid-feedback">Enter your password</div>--%>
                                                    </div>

                                                    <%--<div class="d-flex align-items-center mb-3">
                                                        <a href="login_password_recover.html">Forgot password?</a>
                                                        <a href="login_password_recover.html" class="ms-auto">Need help?</a>
                                                    </div>--%>
                                                    <div class="d-flex align-items-center mb-3">
                                                        <a href="#" id="txt_Fps" onclick="forgot_Password" data-bs-toggle="modal" data-bs-target="#modal_theme_primary2">Forgot password?</a>
                                                        <a href="#" class="ms-auto" id="txt_Ndp" data-bs-toggle="modal" data-bs-target="#modal_theme_primary">Need help?</a>
                                                    </div>

                                                    <div class="mb-3">
                                                        <button type="submit" id="btnSignIn_Officer" class="btn btn-primary w-100">Sign in</button>
                                                    </div>
                                                    <div class="mb-3">
                                                        <button type="reset" class="btn link-primary border-primary w-100">Reset</button>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="login-tab2" role="tabpanel">
                                                    <div class="text-center mb-3">
                                                        <div class="d-inline-flex align-items-center justify-content-center mb-2 mt-2">
                                                            <img src="../../assets/images/kptcl-logo.png" class="h-48px" alt="" />
                                                        </div>
                                                        <h5 class="mb-0 fs-xl space-resp">Karnataka Power Transmission Corporation Limited</h5>
                                                        <span class="d-block text-muted">Welcome To KPCL(GTD)</span>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Username</label>
                                                        <div class="form-control-feedback form-control-feedback-start">
                                                            <input type="text" class="form-control" id="txtIppUsername" placeholder="john@doe.com" required="" />
                                                            <div class="invalid-feedback" id="lblIppID">Enter your username</div>
                                                            <div class="form-control-feedback-icon">
                                                                <i class="ph-user-circle text-muted"></i>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Password</label>
                                                        <div class="form-control-feedback form-control-feedback-start">
                                                            <input type="password" id="txtIPPPassword" class="form-control" placeholder="•••••••••••" required="" />
                                                            <div class="invalid-feedback" id="lblIPPPassword">Enter your password</div>
                                                            <div class="form-control-feedback-icon">
                                                                <i class="ph-lock text-muted"></i>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center mb-3">
                                                        <a href="#" id="txt_Fp" onclick="forgot_Password" data-bs-toggle="modal" data-bs-target="#modal_theme_primary2">Forgot password?</a>
                                                        <a href="#" class="ms-auto" id="txt_Nd" data-bs-toggle="modal" data-bs-target="#modal_theme_primary">Need help?</a>
                                                    </div>

                                                    <div class="mb-3">
                                                        <button type="button" id="btnIPPLogin" class="btn btn-primary w-100">Sign in</button>
                                                    </div>
                                                    <div class="mb-3">
                                                        <button type="reset" class="btn link-primary border-primary w-100">Reset</button>
                                                    </div>

                                                    <div class="text-center text-muted content-divider mb-3">
                                                        <span class="px-2">Don't have an account?</span>
                                                    </div>

                                                    <div class="mb-3">
                                                        <a href="#" class="btn btn-light w-100">Sign up</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                      
                                        <% Server.Execute("~/templates/login/ForgotPassword.aspx"); %>
                                        <% Server.Execute("~/templates/login/NeedHelp.aspx"); %>
                                        <!-- Primary modal -->

                                    
                                    </form>
                                    <!-- /login form -->

                                </div>
                                <!-- /content area -->
                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

</body>

</html>

