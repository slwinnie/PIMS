<%@ Control Language="C#" ClassName="Menu" %>
<%@ Import Namespace="System.Data.Entity.Core.Common.CommandTrees" %>
<%@ Import Namespace="System.Web.Razor.Generator" %>

<nav class="navbar navbar-default sys-menu" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" runat="server" href="~/Default.aspx"><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); display: inline-block; height: 24px; width: calc(32px + 3rem); background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS</strong> </a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="~/Workbench/Default.aspx" class="menu-myWorkbench" id="myWorkbench" runat="server">My Approval</a></li>
                <li><a href="~/CRMTLoader/Default.aspx" class="menu-crmtloader" id="projectInitialization" runat="server">CRMT Loader</a></li>
                <li><a href="~/Project/default.aspx" class="menu-project" id="project" runat="server">Project Initiation</a></li>
                <li><a href="~/ProjectRegister/Default.aspx" class="menu-register" id="register" runat="server">Project Register</a></li>
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