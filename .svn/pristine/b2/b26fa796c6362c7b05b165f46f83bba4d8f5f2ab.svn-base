<%@ Page Language="C#" %>
<%@ Register Src="~/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Import Namespace="System.Data.Entity.ModelConfiguration.Configuration" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            crmtId.Value = Request["searchKey"];
        }
        else
        {
            Response.Redirect("SearchProject.aspx?searchKey=" + crmtId.Value);
        }
    }

</script>

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
    <script>
        $(function() {
            $(".process").click(function () {
                if ($("table tr:gt(0)").length !== 1) {
                    alert("Invalid CRMT.");
                    return false
                };
                $.ajax({
                    url: "actions/Add2MyProject.aspx?projectId=" + $("#crmtId").val() + "&employeeId=<%=SystemHelper.GetEmployeeId(SystemHelper.DomainUserName())%>",
                    type: "post",
                    datatype: "json",
                    success: function(d) {
                        var rst = JSON.parse(d);
                        alert(rst.ErrorMessage);
                    },
                    error: function() {
                        alert("Error");
                    }
                });
                return false;
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
    <div>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<strong>PIMS</strong> > <span>Project Initiation</span>
    </div>
    <div class="container">
        <h4 class="text-center">Search CRMT ID</h4>

        <div class="btn-group pull-left">
            <a class="btn btn-default" href="MyProjectInitiation.aspx">My Project</a>
            <a class="btn btn-default" href="AllProjectInitiation.aspx">All Project</a>
        </div>
        <div class="clearfix"></div>
        <div class="col col-lg-3 col-md-3"></div>
        <div class="col col-lg-6 col-md-6">
            <div class="input-group">
                <input type="text" class="form-control" id="crmtId" runat="server" placeholder="Type CRMT ID, Project Name or Customer"/>
                <span class="input-group-btn"> <button class="btn btn-default">Search</button></span>
            </div>
        </div>
        <div class="col col-lg-3 col-md-3"></div>
        <div class="clearfix"></div>
        <!-- Result Start -->
        <h4>Result:</h4>
        <div style="overflow-x: auto">
        <table class="table table-bordered table-hover">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Owner(s)</th>
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
                    var db = new PPPEntities();
                    var iprojectId = -99999999999;
                    int n;
                    var sb = new StringBuilder();

                    var searchKey = Request["searchKey"].ToString().ToLower().Trim();
                    if (!string.IsNullOrEmpty(searchKey))
                    {
                        var q = db.TProject.Where(x => x.ProjectName.ToLower().Contains(searchKey)
                            || x.Customer.ToLower().Contains(searchKey));
                        if (Int32.TryParse(searchKey, out n))
                        {
                            iprojectId = Convert.ToInt32(searchKey);
                            var u = db.TProject.Where(x => x.ProjectId == iprojectId);
                            q = q.Union(u);
                        }


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
                                    strOwners.AppendFormat("{0}<br />", a.PeopleNameEn);
                                }
                                strOwners.Length -= 6;
                            }
                            {
                                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td><nobr>{5}</nobr></td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td></tr>",
                                    strOwners,
                                    dr.ProjectId,
                                    dr.BusinessUnit,
                                    dr.BusinessLine,
                                    dr.OpportunityLeadSector,
                                    dr.ProjectName,
                                    dr.Customer,
                                    dr.ProspectStatus,
                                    dr.Status,
                                    StringHelper.FmtDate(dr.StatusDate)
                                    );
                            }
                        }
                    }
                %>
                <%=sb %>
            </tbody>
        </table>
        </div>
        <!-- Result End -->
        <br/>
        <div class="text-center">
            <a href="javascript:void(0);" class="btn btn-primary process">Process Current CRMT</a>
        </div>
    </div>
    </form>
</body>
</html>
