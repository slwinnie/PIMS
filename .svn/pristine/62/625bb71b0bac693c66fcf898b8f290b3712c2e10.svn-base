<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="~/Workbench/LeftMenu.ascx" %>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrapValidator.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <title><%=SystemHelper.SystemName %></title>
    <style>
        .status {
            color: red;
        }
        .HeaderLinearBackground { 
           background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
	<div class="container">
	    <div class="row">
    	<div class="col-lg-4 col-md-4 col-xs-4">
            <uc1:LeftMenu runat="server" ID="LeftMenu" />
        </div>
    	<div class="col col-lg-8 col-md-8 col-xs-8">
<strong>PIMS</strong> > <a href="~/Workbench/Default.aspx" class=" btn-default btn-create" runat="server">My Approval</a> > Workshare Risk Prompt List <p></p>
    <h3 class="text-center">Workshare Risk Prompt List</h3>
        <table class="table table-bordered table-hover">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>CRMT ID</th>
                    <th>Project Name</th>
                    <th>Submit By</th>
                    <th>Created Date</th>
                    <th>Approved Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var employeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
                    var cnt = db.TApproval.Count(x => x.FormType == "RiskWS" && x.EmployeeId == employeeId);
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });
                    var q = db.TApproval.Where(x => x.FormType == "RiskWS" && x.EmployeeId == employeeId).OrderByDescending(x => x.CreatedDate).Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                    var r = from x in q
                        join y in db.TProject on x.ProjectId equals y.ProjectId
                        select new
                        {
                            x.ProjectId,
                            y.ProjectName,
                            x.CreatedDate,
                            x.ApprovedDate,
                            x.SubId,
                            x.Status
                        }; 
                    
                    var sb = new StringBuilder();
                    foreach (var dr in r)
                    {
                        var item = db.TRiskWorkshare.FirstOrDefault(x => x.ProjectId == dr.ProjectId
                                                         && x.SubId == dr.SubId && x.type == "2");
                        sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td></tr>",
                            dr.ProjectId,
                            string.Format("<a href='{4}Workbench/Forms/RiskForm-Workshare.aspx?projectId={0}&subId={1}&type=2'>{2}</a>&nbsp;<sup class='status'>{3}</sup>", dr.ProjectId, dr.SubId, dr.ProjectName, dr.Status, ResolveUrl("~")),
                            item == null ? "" : item.SubmitBy,
                            StringHelper.FmtDate(dr.CreatedDate),
                            StringHelper.FmtDate(dr.ApprovedDate)
                            
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 29)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
        </div>
        </div>
        </div>
        </div>
    </form>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrapValidator.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Workbench/js/workbench.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
</body>
</html>
