<%@ Page Language="C#" %>

<%@ Register Src="~/Admin/AdminMenu.ascx" TagPrefix="uc1" TagName="AdminMenu" %>


<% SystemHelper.SetPageNo(this, "ResetPassword"); %>
<% SystemHelper.SessionCheck(this); %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        account.Value = Request["account"];
    }

</script>

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
    <script src="<%=ResolveUrl("~/Admin/Account/js/resetpassword.js")%>" ></script>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
        <uc1:AdminMenu runat="server" ID="AdminMenu" />
    <div class="container">
        <h4 class="text-center">Reset Password</h4>
        <div class="col-lg-4 col-md-4 col-sm-3"></div>
        <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="form-group">
                <label>Account</label>
                <input type="text" id="account" name="account" runat="server" class="form-control" readonly="readonly" />
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" id="newPassword" name="newPassword" runat="server" class="form-control" autocomplete="off" />
            </div>
            <div class="form-group">
                <label>New Password Again</label>
                <input type="password" id="newPassword2" name="newPassword2" runat="server" class="form-control" autocomplete="off" />
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-3"></div>
    </div>
        <div class="text-center">
            <div class="btn-group">
                <a href="javascript:void(0);" class="save-change btn btn-default loadDefaultPassword" runat="server" id="A1" >Load Default Password</a>
                <a href="javascript:void(0);" class="save-change btn btn-primary resetPassword" runat="server" id="btnSave" >Change Password</a>
            </div>
            <br/><br/><br/><br/>
        </div>
    </form>
</body>
</html>
