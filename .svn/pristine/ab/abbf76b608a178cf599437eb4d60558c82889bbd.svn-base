<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%SystemHelper.SetPageNo(this, "Project Initiation - All Project"); %>
<%SystemHelper.SessionCheck(this); %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <li class="TabbedPanelsTab" tabindex="0" onclick="javascript:location.href='MyProjectInitiation.aspx';">My Project</li>
    <li class="TabbedPanelsTab TabbedPanelsTabSelected" tabindex="1">All Project</li>
    <li class="btn btn-success pull-right" tabindex="2" style="-ms-border-radius: 0 !important; border-radius: 0 !important; padding: 4px 9px;" onclick="javascript:location.href='CreateProject.aspx';">Create Project</li>
  </ul>
  <div class="TabbedPanelsContentGroup" style="border:0px solid white">
  <div class="TabbedPanelsContent"></div>
  <div class="TabbedPanelsContent" style="overflow-x: auto; padding-left: 0; padding-top:0">
    <!-- 当前页正文 开始 -->
        <table class="table table-bordered table-hover" style="width: 3000px !important">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th style="-moz-min-width: 10em; -ms-min-width: 10em; -o-min-width: 10em; -webkit-min-width: 10em; min-width: 10em">Owner(s)</th>
                    <th>CRMT<br/>ID</th>
                    <th class="minWidth2">Business Unit</th>
                    <th>Business<br/>Line</th>
                    <th>Opportunity<br/>Lead Sector</th>
                    <th style="width: 300px !important;">Project Name</th>
                    <th class="minWidth">Customer</th>
                    <th>Prospect<br/>Status</th>
                    <th>Bid<br/>Due Date</th>
                    <th>Award Date</th>
                    <th>Go (%)</th>
                    <th>Get (%)</th>
                    <th>WorleyParsons<br/>CV (AUD)</th>
                    <th>WorleyParsons<br/>EBIT (AUD)</th>
                    <th>Estimated<br/>Work (Hrs)</th>
                    <th>Contract<br/>Duration (Wks)</th>
                    <th>Contract Type</th>
                    <th>Bid Office</th>
                    <th>Facility Location<br/> - Country</th>
                    <th>Workshare<br/>Offices (All)</th>
                    <th class="minWidth">Scopes (All)</th>
                    <th>Opportunity<br/>Lead Subsector</th>
                    <th>Custodian</th>
                    <th>Opportunity<br/>Priority</th>
                    <th>Contract<br/>Currency</th>
                    <th>CreatedBy<br/>CreatedDate</th>
                    <th>UpdaetdBy<br/>UpdatedDate</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 5;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var cnt = db.TProject.Count();
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });
                    var q = db.TProject.OrderBy(x=>x.CreatedDate).Skip(pageSize*(pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        var p = from o in db.TProjectOwner.Where(x => x.ProjectId == dr.ProjectId)
                                join e in db.TPeople on o.EmployeeId equals e.EmployeeId into tmp
                                from v in tmp.DefaultIfEmpty()
                                select new
                                {
                                    v.EmployeeId,
                                    v.PeopleNameEn
                                };
                        var strOwners = new StringBuilder();
                        if (p.Any())
                        {
                            foreach (var a in p)
                            {
                                strOwners.AppendFormat("{0},<br />", a.PeopleNameEn);
                            }
                            strOwners.Length -= 7;
                        }
                        sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td><nobr>{4}</nobr></td><td>{5}</td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td>{10}</td><td>{11}</td><td>{12}</td><td>{13}</td><td>{14}</td><td>{15}</td><td>{16}</td><td>{17}</td><td>{18}</td><td>{19}</td><td>{20}</td><td>{21}</td><td>{22}</td><td>{23}</td><td>{24}<br/>{25}</td><td>{26}<br/>{27}</td><td>{28}</td></tr>",
                            strOwners,
                            dr.ProjectId,
                            dr.BusinessUnit,
                            dr.BusinessLine,
                            dr.OpportunityLeadSector,
                            string.IsNullOrEmpty(strOwners.ToString().Trim()) ? string.Format("{0}", dr.ProjectName) : string.Format("<a href='ProposalInitiation.aspx?projectId={0}'>{1}</a> ", dr.ProjectId, dr.ProjectName),
                            dr.Customer,
                            dr.ProspectStatus,
                            StringHelper.FmtDate(dr.BidDueDate),
                            StringHelper.FmtDate(dr.AwardDate),
                            dr.Go,
                            dr.Get,
                            dr.WorleyParsonsCV == null ? "" : string.Format("{0:N0}", dr.WorleyParsonsCV),
                            dr.WorleyParsonsEBIT == null ? "" : string.Format("{0:N0}", dr.WorleyParsonsEBIT),
                            dr.EstimatedWork == null ? "" : string.Format("{0:N0}", dr.EstimatedWork),
                            dr.ContractDuration,
                            dr.ContractType,
                            dr.BidOffice,
                            dr.FacilityLocationCountry,
                            dr.WorkshareOffices,
                            dr.Scopes,
                            dr.OpportunityLeadSubsector,
                            dr.Custodian,
                            dr.OpportunityPriority,
                            dr.ContractCurrency,
                            dr.CreatedBy, 
                            StringHelper.FmtDate(dr.CreatedDate),
                            dr.UpdatedBy,
                            StringHelper.FmtDate(dr.UpdatedDate)
                            
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, db.TProject.Count(), 29)%>
        </table>

        <uc1:PageBar runat="server" ID="PageBar" />
    <!-- 当前页正文 结束 -->
  </div>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1
 = new Spry.Widget.TabbedPanels("TabbedPanels1");
TabbedPanels1.showPanel(1);
</script>
<!-- Tab End -->

    </div>
    </div>
    </form>
</body>
</html>
