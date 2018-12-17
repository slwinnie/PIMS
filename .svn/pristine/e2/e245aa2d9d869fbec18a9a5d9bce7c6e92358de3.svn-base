<%@ Page Language="C#" %>
<%@ Register Src="~/ProposalProject/ProposaProjectlMenu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/ProposalProject/ProposalProjectLeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register TagPrefix="uc1" TagName="ProjectInformation" Src="~/ProposalProject/ProjectInformation.ascx" %>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
    <form id="form1" runat="server">
        <div class="col col-lg-3 col-md-3 col-sm-3">
            <uc1:LeftMenu runat="server" id="LeftMenu" />
<%--            <uc1:ProjectInformation runat="server" ID="ProjectInformation" />--%>
        </div>
        <div class="col col-lg-9 col-md-9 col-sm-9">
            <div style="border: 1px solid blue; height: 600px; padding-right: 15px;">
                    <h4 class="text-center">PAAF Approval</h4>
                

            </div>
        </div>
    </form>
</body>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/paafapproval.js")%>" ></script>
    <script>
        $(function() {
            $("#LeftMenu_paafApproal").addClass("active");
        })
    </script>
</html>
