<%@ Control Language="C#" ClassName="ProposaProjectlMenu" %>
<%@ Import Namespace="System.Data.Entity.Core.Common.CommandTrees" %>
<%@ Import Namespace="System.Web.Razor.Generator" %>
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
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown .header {
        height: 24px;
        line-height: 24px;
        margin: 12px;
        font-size: 20px;
        display: inline-block;
        border: 2px solid blue;
    }
    .dropdown-content {
        z-index: 50000;
        display: none;
        position: absolute;
        /*background-color: #f9f9f9;*/
        background-color: black;
        -moz-min-width: 160px;
        -ms-min-width: 160px;
        -o-min-width: 160px;
        -webkit-min-width: 160px;
        min-width: 160px;
        -webkit-box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        -ms-box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        padding: 12px 16px;
        width: 260px;
        border: 2px solid darkred;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }
    .dropdown span {
        color: white;
    }
    .dropdown a {
        text-decoration: none !important;
        border: 0 !important;
        display:block;
    }
    .dropdown-content a:hover {
        color: red !important;
    }
</style>
<nav class="navbar navbar-default sys-menu" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="border: 0px solid red; width: 260px;">
            <a class="navbar-brand" runat="server" href="~/Default.aspx"><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); border: 0px solid blue; display: inline-block; height: 24px; width: 300px; background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS / Proposal & Project</strong> </a>
        </div>
        <div>
<!-- links -->
<div class="dropdown" id="subMenuStaffingPlan">
    <a href="javascript:void(0);" class="header">Operation(s)</a>
    <div class="dropdown-content">
        <a id="homeLink" href="~/ProposalProject/Default.aspx" class="link-btn" runat="server"  >Project List</a>
        <a id="staffingPlan" href="~/ProposalProject/StaffingPlan.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad"  >Staffing Plan</a>
        <a id="staffingBasicInformation" href="~/ProposalProject/StaffingBasicInformation.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad"  >Staffing Basic Information</a>
        <a id="paaf" href="~/ProposalProject/PAAF.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad"  >PAAF</a>
        <a id="paafApproal" href="~/ProposalProject/PAAFApproval.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad"  >PAAF Approval</a>
        <a id="projectContactList" href="~/ProposalProject/ProjectContactList.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad" >Project Contact List</a>
        <a id="projectInformation" href="~/ProposalProject/Project.aspx" class="link-btn" runat="server" OnLoad="LinkOnLoad"  >Project Information</a>
    </div>
</div>
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
<script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js") %>"></script>
<script>
    
    $(function() {
        $(".header").click(function () {
            $("#subMenuStaffingPlan.dropdown-content").css("display", "block");
        });
    });
</script>
