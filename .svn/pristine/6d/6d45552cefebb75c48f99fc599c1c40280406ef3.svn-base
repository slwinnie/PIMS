<%@ Control Language="C#" ClassName="ProposalProjectLeftMenu" %>

<script runat="server">

    private void LinkOnLoad(object sender, EventArgs e)
    {
        var a = sender as HtmlAnchor;
        if (a != null)
        {
            a.HRef += string.Format("?ProjectNo={0}&Type={1}", Request["ProjectNo"], Request["Type"]);
        }
    }

</script>
<style>
    a.list-group-item-x {
        border: 0;
        display: block;
        width: 100%;
        padding: 5px;
    }
    .left-menu  a.active {
        background-color:lightgray;
    }
</style>
<div class="panel panel-default left-menu clear-border-radius">
    <div class="panel-heading text-center">
        <strong>Building...</strong>
    </div>
    <div style="min-height: 500px;">
<%--        <a id="staffingPlan" href="~/ProposalProject/StaffingPlan.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad" >Staffing Plan</a>
        <a id="staffingBasicInformation" href="~/ProposalProject/StaffingBasicInformation.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad" >Staffing Basic Information</a>
        <a id="paaf" href="~/ProposalProject/PAAF.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad">PAAF</a>
        <a id="paafApproal" href="~/ProposalProject/PAAFApproval.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad">PAAF Approval</a>
        <a id="projectContactList" href="~/ProposalProject/ProjectContactList.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad">Project Contact List</a>
        <a id="projectInformation" href="~/ProposalProject/Project.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad" >Project Information</a>--%>
    </div>
</div>
