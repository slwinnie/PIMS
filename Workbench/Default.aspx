<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>

    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Workbench/js/workbench.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
        .bigButton {
            width: 290px;
            height: 120px;
            line-height: 120px;
            display: inline-block;
            margin: 20px;
            text-align: center;
            /*background-color: lightblue;*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <a href="~/Workbench/Default.aspx" class=" btn-default btn-create" runat="server">My Approval</a> > Home <p></p>
    <h3 class="text-center">My Approval</h3>
<%
    var db = new PPPEntities();
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var bidFormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Bid" && x.EmployeeId == iEmployeeId);
    var Risk1FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Risk1" && x.EmployeeId == iEmployeeId);
    var npis1FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Npis1" && x.EmployeeId == iEmployeeId);
    var Risk2FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Risk2" && x.EmployeeId == iEmployeeId);
    var npis2FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Npis2" && x.EmployeeId == iEmployeeId);
    var RiskWorkshareFormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "RiskWS" && x.EmployeeId == iEmployeeId);

    bidFormInfo.InnerText = bidFormCount.ToString();
    riskFormProposal.InnerText = Risk1FormCount.ToString();
    npisFormProposal.InnerText = npis1FormCount.ToString();
    riskFormProject.InnerText = Risk2FormCount.ToString();
    npisFormProject.InnerText = npis2FormCount.ToString();
    riskWorkshareFormProject.InnerText = RiskWorkshareFormCount.ToString();
%>
    <table style="width: 900px; margin: 0 auto;">
        <tr>
            <td style="width: 50%;text-align: center"><h4>Proposal</h4><hr/></td>
            <td style="text-align: center"><h4>Project</h4><hr/></td>
        </tr>
        <tr>
            <td style="text-align: center">
                <a href="~/Workbench/BidForm.aspx" class="bigButton btn btn-default" runat="server">BID/NO BID Form <span class="badge" id="bidFormInfo" runat="server"></span></a><br/>
                <a href="~/Workbench/RiskForm-Proposal.aspx" class="bigButton btn btn-default" runat="server">Risk Classification Form (Proposal) <span class="badge" id="riskFormProposal" runat="server"></span></a> <br/>
                <a href="~/Workbench/NPISForm.aspx" class="bigButton btn btn-default" runat="server">New Project Information Sheet (NPIS)<span class="badge" id="npisFormProposal" runat="server"></span></a> 
            </td>
            <td style="text-align: center">
                <a href="~/Workbench/RiskWorkShareForm-Project.aspx" class="bigButton btn btn-default" runat="server">Workshare Risk Prompt List <span class="badge" id="riskWorkshareFormProject" runat="server"></span></a><br/>
                <a href="~/Workbench/RiskForm-Project.aspx" class="bigButton btn btn-default" runat="server">Risk Classification Form (Project) <span class="badge" id="riskFormProject" runat="server"></span></a><br/>
                <a href="~/Workbench/NPISForm-Project.aspx" class="bigButton btn btn-default" runat="server">New Project Information Sheet (NPIS)<span class="badge" id="npisFormProject" runat="server"></span></a><br/>
<%--                <span  class="bigButton " style="border: 0">&nbsp;</span> --%>
            </td>
        </tr>
    </table>

    </div>
    </form>
</body>
</html>
