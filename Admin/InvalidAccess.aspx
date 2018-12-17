<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
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
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script>
        $(function() {

        })
    </script>
</head>
<body>
    <uc1:Menu runat="server" ID="Menu" />
    <form id="form1" runat="server">
    <div class="text-center">
        <span class="h4 text-danger">Invalid Access.</span>
    </div>
    </form>
</body>
</html>
