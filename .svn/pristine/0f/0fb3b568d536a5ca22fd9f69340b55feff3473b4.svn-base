<%@ Page Language="C#" %>

<%@ Register Src="~/UserCenter/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<script runat="server">

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
    <script src="<%=ResolveUrl("~/UserCenter/js/changepassword.js")%>" ></script>
</head>
<body>
    <uc1:UserMenu runat="server" ID="UserMenu" />
    <form id="form1" runat="server">
    <div class="container">
        <h4 class="text-center">Change Password</h4>
        <div class="col-lg-4 col-md-4 col-sm-3"></div>
        <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="form-group">
                <label>Old Password</label>
                <input type="password" id="oldPassword" name="oldPassword" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" id="newPassword" name="newPassword" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>New Password Again</label>
                <input type="password" id="newPassword2" name="newPassword2" runat="server" class="form-control" />
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-3"></div>
    </div>
        <p class="text-center">
            <a href="javascript:void(0);" class="save-change btn btn-primary changePassword" runat="server" id="btnSave" >Change Password</a>
            <br/><br/><br/><br/>
        </p>
    </form>
</body>
</html>
