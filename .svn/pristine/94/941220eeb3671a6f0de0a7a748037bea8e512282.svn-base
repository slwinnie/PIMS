<%@ Page Language="C#" %>
<%@ Import Namespace="System.Runtime.Remoting.Metadata.W3cXsd2001" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%SystemHelper.SetPageNo(this, "Project Initiation - My Project"); %>
<%SystemHelper.SessionCheck(this); %>
<!DOCTYPE html>
1
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/normalize.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/SpryTabbedPanels.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Project/js/project.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/SpryTabbedPanels.js")%>" ></script>
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
    </style>
    <script runat="server">
        private void search_OnServerClick(object sender, EventArgs e)
        {
            Response.Redirect("SearchProject.aspx?searchKey=" + crmtId.Value);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <span>Project Initiation</span>
    </div>
    <div class="col col-lg-12 col-md-12" style="border: 0px solid red;">
<div class="container">
<h4 class="text-center">Project Initiation</h4>
</div>
    <div class="container">
        <div class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-6 col-md-6">
            <div class="input-group">
                <input type="text" class="form-control" id="crmtId" runat="server" placeholder="Type CRMT ID, Project Name or Customer"/>
                <span class="input-group-btn"> <button class="btn btn-default" runat="server" id="search" OnServerClick="search_OnServerClick">Search</button></span>
            </div>
        </div>
        <div class="col col-lg-3 col-md-3"></div>
<!-- Tab Start -->
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0" >My Project</li>
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="1" onclick="javascript:location.href='AllProjectInitiation.aspx';">All Project</li>
    <li class="btn btn-success pull-right" tabindex="2" style="-ms-border-radius: 0 !important; border-radius: 0 !important; padding: 4px 9px;" onclick="javascript:location.href='CreateProject.aspx';">Create Project</li>
  </ul>
  <div class="TabbedPanelsContentGroup" style="border:0px solid white">
  <div class="TabbedPanelsContent" style="overflow-x: auto; padding-left: 0; padding-top:0">
    <!-- 当前页正文 开始 -->
        <table class="table table-bordered table-hover">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Action(s)</th>
                    <th>CRMT<br/>ID</th>
                    <th class="minWidth2">Business Unit</th>
                    <th>Business<br/>Line</th>
                    <th>Opportunity<br/>Lead Sector</th>
                    <th>Project Name</th>
                    <th class="minWidth">Customer</th>
                    <th>Prospect<br/>Status</th>
                    <th>Status</th>
                    <th>Status<br/>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var employeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 5;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var cnt = db.TProjectOwner.Count(x => x.EmployeeId == employeeId);
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });

                    var v = from x in db.TProjectOwner.Where(x => x.EmployeeId == employeeId)
                            join y1 in db.TProject on x.ProjectId equals y1.ProjectId into tmp
                        from y in tmp.DefaultIfEmpty()
                        select new
                        {
                            x.ProjectId,
                            y.BusinessUnit,
                            y.BusinessLine,
                            y.OpportunityLeadSector,
                            y.ProjectName,
                            y.Customer,
                            y.ProspectStatus,
                            y.Status,
                            y.StatusDate
                        };

                    var sb = new StringBuilder();
                    foreach (var dr in v.OrderByDescending(x=>x.ProjectId).Skip(pageSize*(pageIndex - 1)).Take(pageSize))
                    {
                        sb.AppendFormat("<tr><td>{9}</td><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td><a href='ProposalInitiation.aspx?projectId={0}'>{4}</a></td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td></tr>",
                            dr.ProjectId,
                            dr.BusinessUnit,
                            dr.BusinessLine,
                            dr.OpportunityLeadSector,
                            dr.ProjectName,
                            dr.Customer,
                            dr.ProspectStatus,
                            dr.Status,
                            StringHelper.FmtDate(dr.StatusDate),
                            string.Format("<div class='btn-group'><a href='ProjectOwner.aspx?projectId={0}' class='btn btn-primary btn-xs'>Edit owner</a></div>", dr.ProjectId)
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, db.TProjectOwner.Count(x => x.EmployeeId == employeeId), 29)%>
        </table>

        <uc1:PageBar runat="server" ID="PageBar" />
    <!-- 当前页正文 结束 -->
  </div>
  <div class="TabbedPanelsContent"></div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1
 = new Spry.Widget.TabbedPanels("TabbedPanels1");
TabbedPanels1.showPanel(0);
</script>
<!-- Tab End -->

    </div>
    </div>

    </form>
</body>
</html>
