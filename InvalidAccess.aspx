<%@ Page Language="C#" %>
<%--<%@ Register Src="~/Admin/AdminMenu.ascx" TagPrefix="uc1" TagName="AdminMenu" %>--%>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=SystemHelper.SystemName %></title>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/People/js/people.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/UserCenter/js/my.js")%>" ></script>

</head>
<body>
<nav class="navbar navbar-default sys-menu" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" runat="server" href="~/Default.aspx"><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); display: inline-block; height: 24px; width: calc(32px + 3rem); background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS</strong> </a> <!--Project Information Management System -->
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="~/Default.aspx" class="menu-home" id="myHome" runat="server">Home</a></li>
            </ul>
        </div>
        <div style="position:relative; border:0px solid red; width: 250px; float: right; text-align: right; padding: 5px;">
              <a href="<%=string.Format("{0}Admin/Default.aspx", this.ResolveUrl("~")) %>"><img src="<%=string.Format("{0}Images/sys.png", ResolveUrl("~")) %>" /></a>
              <span style="color:white"><%=string.Format("{0}", SystemHelper.GetUserName(SystemHelper.DomainUserName())) %></span>
        </div>
    </div>
</nav>
    <form id="form1" runat="server">
    <div class="text-center">
        <span class="h4 text-danger">Invalid Access.</span>
    </div>
    </form>
</body>
</html>
