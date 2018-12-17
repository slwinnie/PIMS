<%@ Control Language="C#" ClassName="UserMenu" %>
<%@ Import Namespace="System.Data.Entity.Core.Common.CommandTrees" %>
<nav class="navbar navbar-default sys-menu" role="navigation" style="border-bottom: 3px solid darkorange;">
    <div class="container-fluid">
        <div class="navbar-header" style="border: 0px solid red; width: 200px;">
            <a class="navbar-brand" href="#">
                <nobr><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); display: inline-block; height: 24px; width: calc(24px + 3rem); background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS / User Center</strong></nobr>
            </a> <!--Project Information Management System -->
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="~/Default.aspx" class="menu-home" id="home" runat="server">PIMS Home</a></li>
                <li><a href="~/UserCenter/Default.aspx" class="menu-my" id="my" runat="server">My</a></li>
                <li><a href="~/UserCenter/ChangePassword.aspx" class="menu-changepassword" id="changepassword" runat="server">Change Password</a></li>
            </ul>
        </div>
        <div style="position:relative; border:0px solid red; width: 250px; float: right; text-align: right; padding: 5px;">
           <a href="<%=string.Format("{0}Admin/Default.aspx", this.ResolveUrl("~")) %>"><img src="<%=string.Format("{0}Images/sys.png", ResolveUrl("~")) %>" /></a>
           <a href="<%=this.ResolveUrl("~/UserCenter/Default.aspx") %>"><%=string.Format("{0}", SystemHelper.GetUserName(SystemHelper.DomainUserName())) %></a>
        </div>
    </div>
</nav>