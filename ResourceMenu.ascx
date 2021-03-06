﻿<%@ Control Language="C#" ClassName="ResourceMenu" %>
<%@ Import Namespace="System.Data.Entity.Core.Common.CommandTrees" %>
<%@ Import Namespace="System.Web.Razor.Generator" %>

<nav class="navbar navbar-default sys-menu" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header" style="border: 0px solid red; width: 300px;">
            <a class="navbar-brand" runat="server" href="~/Default.aspx"><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); border: 0px solid blue; display: inline-block; height: 24px; width: 300px; background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS / System Management</strong> </a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="~/People/Default.aspx" class="menu-people" id="people" runat="server">People</a></li>
                <li><a href="~/ManPowerManagement/Organization/Default.aspx" class="menu-organization" id="A1" runat="server">Organization</a></li>
                <li><a href="~/ManPowerManagement/Default.aspx" class="menu-manpowermanagement" id="manpowermanagement" runat="server">Man-Power Management</a></li>
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