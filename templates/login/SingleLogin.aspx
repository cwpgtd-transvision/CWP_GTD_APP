<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SingleLogin.aspx.cs" Inherits="SingleLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Login page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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

    <script src="../../assets/js/jquery/jquery-3.7.1.min.js"></script>
    <!-- /core JS files -->

    <script src="../../../assets/js/vendor/notifications/sweet_alert.min.js"></script>

    <script src="SingleLogin.js"></script>

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

                                            <div class="card-body">

                                                <div class="text-center mb-3">
                                                    <div class="d-inline-flex align-items-center justify-content-center mb-2 mt-2">
                                                        <img src="../../assets/images/kptcl-logo.png" class="h-48px" alt="" />
                                                    </div>
                                                    <h5 class="mb-0 fs-xl space-resp">Karnataka Power Transmission Corporation Limited</h5>
                                                    <span class="d-block text-muted">Welcome To Bank Guarantee(GTD)</span>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Username</label>
                                                    <div class="form-control-feedback form-control-feedback-start">
                                                        <input type="text" id="txtUserName" class="form-control" placeholder="john@doe.com" />
                                                        <div class="invalid-feedback" id="diverrorUser">Enter your username</div>
                                                        <div class="form-control-feedback-icon">
                                                            <i class="ph-user-circle text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Password</label>
                                                    <div class="form-control-feedback form-control-feedback-start">
                                                        <input type="password" id="txtpassword" class="form-control" placeholder="•••••••••••" />
                                                        <div class="invalid-feedback" id="diverrorPassword">Enter your password</div>
                                                        <div class="form-control-feedback-icon">
                                                            <i class="ph-lock text-muted"></i>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="d-flex align-items-center mb-3">
                                                    <a href="#" id="txt_Fps" onclick="forgot_Password" data-bs-toggle="modal" data-bs-target="#modal_theme_primary2">Forgot password?</a>
                                                    <a href="#" class="ms-auto" id="txt_Ndp" data-bs-toggle="modal" data-bs-target="#modal_theme_primary">Need help?</a>
                                                </div>

                                                <div class="mb-3">
                                                    <button type="button" id="btnSign" class="btn btn-primary w-100">Sign in</button>
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
                                       <%-- <div id="modal_theme_primary2" class="modal fade" tabindex="-1">
                                            <div class="modal-dialog">
                                            
                                                <div class="card mb-0">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="text-end">
                                                                <button type="button" class="btn-close btn-close-black" data-bs-dismiss="modal"></button>
                                                            </div>
                                                        </div>
                                                        <div class="text-center mb-3">
                                                            <div class="d-inline-flex bg-primary bg-opacity-10 text-primary lh-1 rounded-pill p-3 mb-3 mt-1">
                                                                <i class="ph-arrows-counter-clockwise ph-2x"></i>
                                                            </div>
                                                            <h5 class="mb-0">Password recovery</h5>
                                                            <span class="d-block text-muted">We'll send you instructions in email</span>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Your email/User Name</label>
                                                            <div class="form-control-feedback form-control-feedback-start">
                                                                <input type="email" id="Intmail" class="form-control" placeholder="Your email/User Name" />
                                                                <div class="form-control-feedback-icon">
                                                                    <i class="ph-at text-muted"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-primary w-100" id="btnSubmitEmail">
                                                            <i class="ph-arrow-counter-clockwise me-2"></i>
                                                            Reset password
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                                       
                                    
                                        <% Server.Execute("~/templates/login/ForgotPassword.aspx"); %>
                                        <% Server.Execute("~/templates/login/NeedHelp.aspx"); %>

                                        <!-- Primary modal -->
                                       <%-- <div id="modal_theme_primary" class="modal fade" tabindex="-1">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header  border-0 bg-light p-2">
                                                        <h1 class="modal-title fw-semibold  ">Contact Us</h1>
                                                        <button type="button" class="btn-close btn-close" data-bs-dismiss="modal"></button>
                                                    </div>


                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <h3 class="fw-semibold p-0 m-0">EMAIL ID :</h3>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <label class="fw-semibold p-0 m-0 ">transvision.kptcl@gmail.com</label>
                                                                <br />
                                                                <label class="fw-semibold p-0 m-0">projects@transvisionsolutions.in</label>
                                                                <br />
                                                                <label class="fw-semibold p-0 m-0">dr.zoola@transvisionsolutions.in</label>
                                                                <br />
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col-md-4">
                                                                <h3 class="fw-semibold p-0 m-0">MOBILE NO :</h3>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <label class="fw-semibold p-0 m-0">+91 8050256797</label>
                                                                <br />
                                                                <label class="fw-semibold p-0 m-0 ">+91 7899901712</label>
                                                                <br />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>


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
