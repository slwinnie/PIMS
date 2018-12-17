<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=SystemHelper.SystemName %></title>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.js")%>" ></script>
    <script src="<%=ResolveUrl("~/People/js/people.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/UserCenter/js/changepassword.js")%>" ></script>
    <style>
        div.title {
            background-color: #425870;
            padding: 5px;
            color: white;
        }
        .funBtn {
            width: 120px;
            height: 60px;
            padding: 8px 5px 5px 5px;
            margin: 2px;
			display:inline-block;
			font-family: "Arial";
			vertical-align: middle;
        }
        .tbl {
            width: 100%;
        }
        tr.active {
            background-color: yellow !important;
        }
        .selected {
            background-color:bisque !important;
        }
        .HeaderLinearBackground { 
            background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
        }
    </style>

    <script>
        $(function () {
            $("input[type='text'], input[type='password']").keydown(function (e) {
                var ev = document.all ? window.event : e;
                if (ev.keyCode === 13) {
                    $("input[name='login']").trigger("click");
                }
            });

            $("#gvProjectList tr:gt(0)").click(function () {
                $(this).siblings().removeClass('selected');
                $(this).addClass('selected');
                $("#projectId").val($("#gvProjectList tr.selected td:eq(0)").html());
            });

            $("#qrCode").hover(function() {
                $(".pims-qrcode").css("display", "block");
                return false;
            },function() {
                $(".pims-qrcode").css("display", "none");
                return false;
            });

        });

        function checkProject(parameters) {
            if (document.getElementById("projectId").value === "") {
                alert("请选择一个项目");
                return false;
            }
            return true;
        }
    </script>
    <script runat="server">
        private void frmLogin_OnLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["employeeId"] != null)
                {
                    account.Value = Request["employeeId"];
                }

                if (Session["EmployeeId"] != null)
                {

                }
            }
        }
        
        private void OnServerClick(object sender, EventArgs e)
        {
            //var employeeId = account.Value;
            var db = new PPPEntities();
            var md5Password = StringHelper.GetMd5(password.Value);
            if (!db.TAccount.Any(x => x.Account == account.Value && x.Psd == md5Password))
            {
                //Invalid Employee Number or Password.
                errorMessage.InnerText = "Invalid Employee Number or Password.";
            }
            else
            {
                var acc = db.TAccount.First(x => x.Account == account.Value);
                if (acc.Status != "Active")
                {
                    errorMessage.InnerText = "Invalid Account Status.";
                    return;
                }

                var ppl = db.TPeople.First(x => x.EmployeeId == acc.EmployeeId);

                Session["EmployeeId"] = acc.EmployeeId;
                Session["PeopleNameEn"] = ppl.PeopleNameEn;

                errorMessage.InnerText = "";
                acc.LastLogin = DateTime.Now;
                db.SaveChanges();
                if (StringHelper.GetMd5(SystemHelper.DefaultPassword) == acc.Psd)
                {
                    Response.Redirect("~/UserCenter/ChangePassword.aspx");
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

    </script>
</head>
<body style="background-image: url(Images/loginbk.jpg)">
<%--    <nav class="top-bar" role="navigation">
        <div id="nav-top-bar" style="margin-left: 0.11em;border-bottom: 0px solid darkred;">
        <a class="navbar-brand" href="#"><%=SystemHelper.SystemInfo.SystemName + " - " + SystemHelper.SystemInfo.Version %></a>
        </div>
    </nav>--%>
<div>
<div style="width: 100%; height: 80px; background-image: url(Images/WPRE-12-Col-Blk.png);background-repeat:no-repeat; border-bottom: 0px solid #EF2E24; ">
    
</div>

<form style="border:0px solid red;" class="" name="frmLogin" id="frmLogin" runat="server" OnLoad="frmLogin_OnLoad">
    <div class="container">
<div style="width: 100%; height: 60px;">

</div>

        <div class="col-lg-7 col-md-7 col-sm-3"></div>
        <div class="col-lg-4 col-md-4 col-sm-6" style="background-color:#fff; opacity: 0.8;">
        <h4 class="text-center">Login</h4>
        <hr/>
            <div class="form-group">
                <label>Account</label>
                <input type="text" id="account" name="account" runat="server" class="form-control" autocomplete="off" />
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" id="password" name="password" runat="server" class="form-control" autocomplete="off" />
            </div>
            <div class="form-group">
                <a href="javascript:void(0);" class="btn btn-primary table clear-border-radius" runat="server" OnServerClick="OnServerClick">Login</a>
                <label id="errorMessage" runat="server" class="text-danger"></label>
            </div>
            <div class="form-group">
                <span class="prompt">Release:2018/04/27&nbsp;&nbsp;&nbsp;Rev:0.1</span> <img src="~/Images/qr_code.png" id="qrCode" runat="server"/> <a href="Help/Default.aspx">Help</a><br/>
                <span class="prompt"> It is recommended that you use </span><a href="download/ChromeStandalone_66.0.3359.139_Setup.exe">the Google Chrome browser.</a> 
            </div>
            <div class="form-group text-center pims-qrcode" style="border: 1px dotted gray; display:none">
                <img runat="server" src="~/Images/PIMS-QR-Code.png"/>
            </div>
        </div>
        <div class="col-lg-1 col-md-1 col-sm-3"></div>
        
        <input type="hidden" id="projectId" runat="server"/>
</div>
</form>

</div>
    </body>
</html>
