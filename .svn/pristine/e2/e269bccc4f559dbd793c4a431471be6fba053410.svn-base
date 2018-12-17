<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%
//test.Value = HttpContext.Current.Request.ApplicationPath;
    %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/font-awesome.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <title><%=SystemHelper.SystemName %></title>
    <style>
         .HeaderLinearBackground { 
           background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
         }
         .minWidth {
             -moz-min-width: 200px; -ms-min-width: 200px; -o-min-width: 200px; -webkit-min-width: 200px; min-width: 200px;
         }
         .minWidth2 {
             -moz-min-width: 150px; -ms-min-width: 150px; -o-min-width: 150px; -webkit-min-width: 150px; min-width: 150px;
         }
        .funBtn {
            width: 170px;
            height: 60px;
            padding: 8px 5px 5px 5px;
            margin: 2px;
			display:inline-block;
			font-family: "Arial";
			vertical-align: middle;
            color: white;
            padding-top: 17px;
        }
        .funBtn-double-line {
            width: 170px;
            height: 60px;
            padding: 0px 5px 5px 5px;
            margin: 2px;
			display:inline-block;
			font-family: "Arial";
			vertical-align: middle;
            color: white;
            padding-top: 9px;
        }
         .color-1 {
             background-color: #66CC33;
         }
         .color-2 {
             background-color: #0D6EF0;
         }
         .color-3 {
             background-color: #FF6633;
         }
         .btn-border-radius {
             -ms-border-radius: 10px;
             border-radius: 10px;
         }
         .home-bk1 {
             margin: 0px auto;
             background-image: url(Images/bk.jpg);
             background-repeat:no-repeat;
             height: 800px;
             width: 100%;
 }
         .home-bk2 {
             margin: 0px auto;
             margin-top: 50px;
             background-image: url(Images/homebk2.png);
             background-repeat:no-repeat;
             height: 361px;
             width: 921px;
             /*opacity: 0.9;*/
         }
         .description-small {
             font-size: 10px;
         }
         a:hover{
             text-decoration:none;
         }
         a i{
             color:lightyellow !important;
         }
         a:hover i{
             color:darkgoldenrod !important;
         }
    </style>
    <script runat="server">

        private void frmDefault_OnLoad(object sender, EventArgs e)
        {
            //SystemHelper.SessionCheck(this);
            if (!IsPostBack)
            {
                
            }
        }


    </script>
</head>
<body style="overflow-y: hidden1">
<!-- 导航菜单::开始 -->
<nav class="navbar navbar-default sys-menu" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" runat="server" href="~/Default.aspx"><strong style="background-image: url(<%=ResolveUrl("~/Images/wp.png") %>); display: inline-block; height: 24px; width: calc(24px + 3rem); background-repeat: no-repeat;  background-size:23px 23px; padding-left: 3rem;">PIMS</strong> <span style="padding-left: 50px;position:relative"> Project Information Management System</span></a>
        </div>
            <ul class="pull-right" >
               <li style="padding-top: 15px;">
                    <div>
                          <a href="<%=string.Format("{0}Admin/Default.aspx", this.ResolveUrl("~")) %>"><img src="<%=string.Format("{0}Images/sys.png", ResolveUrl("~")) %>" /></a>
                          <span style="color: white;padding-right: 3px;"><%=string.Format("{0}", SystemHelper.GetUserName(SystemHelper.DomainUserName())) %></span><a href="~/Help/PIMs User Guide.pdf" title="PIMs User Guide" runat="server">&nbsp;<i class="icon-question-sign" style=" font-size:16px;" id="help-icon"></i></a>
                    </div>
                </li>
            </ul>
    </div>
</nav>
<!-- 导航菜单::结束 -->
<div class="home-bk"></div>
<form style="border:0px solid red;" class="" id="frmDefault" runat="server"  OnLoad="frmDefault_OnLoad">
    <div style="margin-top: -50px;"></div>
        <div class="clearfix"></div>
    <div class="container home-bk1">
        <div class ="home-bk2" style="border: 0px solid red; margin-top: 150px;">
            <div style="border: 0px solid yellow; position:relative; float: left; width: 300px; height: 150px; padding-left: 20px; padding-top: 10px; display: inline-block;">
                <h4>CRMT</h4>
                <span class="description-small">CRMT opportunity import</span>
                <br/><br/><br/><br/>
                <a href="~/CRMTLoader/Default.aspx" class="pull-right" style="margin-right: 20px;" runat="server">Open</a>
            </div>
            <div style="border: 0px solid blue; position:relative; float: left;width: 300px;height: 150px; padding-left: 20px;padding-top: 10px; display: inline-block;">
                <h4>Project Initiation</h4>
                <span class="description-small">Proposal & Project Bid/No-Bid, Risk form, New Project Information Sheet and Open project</span>
                <br/><br/>
                <a href="~/Project/Default.aspx" class="pull-right" style="margin-right: 20px;" runat="server">Open</a>
            </div>
            <div style="border: 0px solid red; position:relative; float: left; width: 300px;height: 150px; padding-left: 20px;padding-top: 10px; display: inline-block;">
                <h4>Project Register</h4>
                <span class="description-small">Proposal & Project register</span>
                <br/><br/><br/><br/>
                <a href="~/ProjectRegister/Default.aspx" class="pull-right" style="margin-right: 20px;" runat="server">Open</a>
            </div>
            <div class="clearfix"></div>
            <div style="margin-top: 30px;"></div>
            <div style="border: 0px solid red; position:relative; float: left; width: 300px;height: 150px; padding-left: 20px;padding-top: 10px; display: inline-block;">
                <h4>Proposal & Project</h4>
                <span class="description-small">Proposal & Project working module including stuff plan, PAAF, task/deliverables management and collaboration</span>
                <br/><br />
                <a href="~/ProposalProject/Default.aspx" class="pull-right" style="margin-right: 20px;" runat="server">Open</a>
            </div>
            <div style="border: 0px solid red; position:relative; float: left; width: 300px;height: 150px; padding-left: 20px;padding-top: 10px; display: inline-block;">
                <h4>Resource Management</h4>
                <span class="description-small">Office, department resource management and forecast</span>
                <br/><br/><br/><br/>
                <a href="~/People/Default.aspx" class="pull-right" style="margin-right: 20px;" runat="server">Open</a>
            </div>
            <div style="border: 0px solid red; position:relative; float: left; width: 300px;height: 150px; padding-left: 20px;padding-top: 10px; display: inline-block;">
                <h4>My Approval</h4>
                <span class="description-small">Request approval</span>
                <br/><br/><br/><br/>
                <a href="~/Workbench/Default.aspx" class="pull-right" style="margin-right: 20px;" runat="server">Open</a>
            </div>
        </div>
    </div>
    <input type="hidden" id="test" runat="server" />
<%--    <div style="border-top: 1px solid black; height: 900px; margin-top: 300px; position: absolute; top: 320px; left: 0; width: 660px; padding-top: 10px; padding-left: 10px;">
        Release Information
    </div>--%>
 <div class="navbar navbar-inverse1 navbar-fixed-bottom">
    <div class="navbar-inner">
        <!--fluid 是偏移一部分-->
        <div class="container-fluid text-center">
            <span class="prompt"> It is recommended that you use </span><a href="download/ChromeStandalone_66.0.3359.139_Setup.exe"><span style="background-image:url('images/chrome16.png'); width:16px;height:16px; display:inline-block;"></span> the Google Chrome browser.</a> 
        </div>
        </div>
  </div>
</form>

</body>
</html>