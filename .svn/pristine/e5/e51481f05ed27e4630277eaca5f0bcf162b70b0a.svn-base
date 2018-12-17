<%@ Control Language="C#" ClassName="HomePageTopMenu" %>
<%@ Import Namespace="System.Data.Entity.Core.Common.CommandTrees" %>
<%@ Import Namespace="System.Web.Razor.Generator" %>

<nav class="navbar navbar-default sys-menu" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="border: 0px solid red; width: 260px;">
            <a class="navbar-brand" runat="server" href="~/Default.aspx"><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); border: 0px solid blue; display: inline-block; height: 24px; width: 300px; background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS / Proposal & Project</strong> </a>
        </div>
        <div>
            <ul class="nav navbar-nav">
<%--                <li><a href="~/ProposalProject/Default.aspx" class="menu-proposal-project" id="proposalProject" runat="server">Proposal & Project</a></li>--%>
<%--                <li><a href="~/ProposalProject/Project.aspx" class="" id="projectInfoMenu" runat="server">Project Info</a></li>--%>
<%--                 <li><a href="~/ProposalProject/StaffingBasicInformation.aspx" class="menu-staffing-basic-information" id="staffingBasicInformation" runat="server">Staffing Basic Information</a></li>
               <li><a href="~/ProposalProject/StaffingPlan.aspx" class="menu-staffing-plan" id="staffingPlan" runat="server">Staffing Plan</a></li>
                <li><a href="~/ProposalProject/PAAF.aspx" class="menu-paaf" id="paaf" runat="server">PAAF</a></li>
                <li><a href="~/ProposalProject/PAAFApproval.aspx" class="menu-paff-approval" id="paafApproval" runat="server">PAAF Approval</a></li>
                <li><a href="~/ProposalProject/ProjectContactList.aspx" class="menu-project-contact-list" id="projectContactList" runat="server">Project Contact List</a></li>--%>
            </ul>

            <ul class="pull-right" >
               <li style="padding-top: 15px;">
                    <div>
                          <a href="<%=string.Format("{0}Admin/Default.aspx", this.ResolveUrl("~")) %>"><img src="<%=string.Format("{0}Images/sys.png", ResolveUrl("~")) %>" /></a>
                          <span style="color: white;padding-right: 3px;"><%=string.Format("{0}", SystemHelper.GetUserName(SystemHelper.DomainUserName())) %></span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>