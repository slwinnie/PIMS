<%@ Control Language="C#" ClassName="UserMenu" %>
<%@ Import Namespace="System.Data.Entity.Core.Common.CommandTrees" %>

<nav class="navbar navbar-default sys-menu" role="navigation" style="border-bottom: 3px solid darkslateblue;">
        <div class="navbar-header" style="border: 0px solid red; width: 280px;">
            <a class="navbar-brand" href="#">
                <nobr><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); display: inline-block; height: 24px; width: calc(24px + 3rem); background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS / System Management</strong></nobr>
            </a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li></li>
                <li><a href="~/Default.aspx" class="menu-home" id="home" runat="server" style="display: inline-block; text-decoration: none; border: 0px dotted red;">
                    <img src="~/Images/home_16px.png" runat="server" style="margin-top: -2px;" />&nbsp;PIMS Home</a></li>
                <li><a href="~/Admin/Role/Default.aspx" class="menu-role" id="my" runat="server">Role</a></li>
                <li><a href="~/Admin/Function/Default.aspx" class="menu-function" id="A2" runat="server">Function</a></li>
                <li><a href="~/Admin/Account/Default.aspx" class="menu-account" id="account" runat="server">Account</a></li>
            </ul>
            <ul class="pull-right" >
               <li style="padding-top: 15px;">
                    <div>
                          <a href="<%=string.Format("{0}Admin/Default.aspx", this.ResolveUrl("~")) %>"><img src="<%=string.Format("{0}Images/sys.png", ResolveUrl("~")) %>" /></a>
                          <span style="color: white; padding-right: 3px;"><%=string.Format("{0}", SystemHelper.GetUserName(SystemHelper.DomainUserName())) %></span>
                    </div>
                </li>
            </ul>
        </div>
</nav>
<div class="clearfix"></div>
