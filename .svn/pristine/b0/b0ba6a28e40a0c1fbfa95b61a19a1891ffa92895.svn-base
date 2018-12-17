<%@ Control Language="C#" ClassName="LeftMenu" %>

<script runat="server">

</script>
<%
    var db = new PPPEntities();
    var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
    var bidFormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Bid" && x.EmployeeId == iEmployeeId);
    var Risk1FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Risk1" && x.EmployeeId == iEmployeeId);
    var npis1FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Npis1" && x.EmployeeId == iEmployeeId);
    var Risk2FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Risk2" && x.EmployeeId == iEmployeeId);
    var npis2FormCount = db.TApproval.Count(x => x.Status == "New" && x.FormType == "Npis2" && x.EmployeeId == iEmployeeId);
    var riskWS = db.TApproval.Count(x => x.Status == "New" && x.FormType == "RiskWS" && x.EmployeeId == iEmployeeId);
    bidFormInfo.InnerText = bidFormCount.ToString();
    riskFormProposal.InnerText = Risk1FormCount.ToString();
    npisFormProposal.InnerText = npis1FormCount.ToString();
    riskFormProject.InnerText = Risk2FormCount.ToString();
    npisFormProject.InnerText = npis2FormCount.ToString();
    riskWorkShare.InnerText = riskWS.ToString();
%>
<div class="list-group">
    <span class="list-group-item active">Proposal</span>
    <a href="~/Workbench/BidForm.aspx" class="list-group-item" runat="server">Bid/No Bid Form <span class="badge" id="bidFormInfo" runat="server"></span></a>
    <a href="~/Workbench/RiskForm-Proposal.aspx" class="list-group-item" runat="server">Risk Classification Form<span class="badge" id="riskFormProposal" runat="server"></span></a>
    <a href="~/Workbench/NPISForm.aspx?type=1" class="list-group-item" runat="server">New Project Information Sheet (NPIS)<span class="badge" id="npisFormProposal" runat="server"></span></a>
</div>
<div class="list-group">
    <span class="list-group-item active">Project</span>
    <a href="~/Workbench/RiskWorkShareForm-Project.aspx" class="list-group-item" runat="server">Workshare Risk Prompt List<span class="badge" id="riskWorkShare" runat="server"></span></a>
    <a href="~/Workbench/RiskForm-Project.aspx" class="list-group-item" runat="server">Risk Classification Form<span class="badge" id="riskFormProject" runat="server"></span></a>
    <a href="~/Workbench/NPISForm-Project.aspx?type=2" class="list-group-item" runat="server">New Project Information Sheet (NPIS)<span class="badge" id="npisFormProject" runat="server"></span></a>
</div>