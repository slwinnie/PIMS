<%@ Page Language="C#" %>
<%@ Register Src="~/ResourceMenu.ascx" TagPrefix="uc1" TagName="ResourceMenu" %>
<!DOCTYPE html>

<script runat="server">

    protected void form1_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Request["fy"]))
            {
                var db = new PPPEntities();
                var fyeardata = db.TFYear.First();
                fyear.Value = fyeardata.FYear.ToString();
            }
            else
            {
                fyear.Value = Request["fy"];
            }

            if (string.IsNullOrEmpty(Request["OrganizationId"]))
            {
                var db = new PPPEntities();
                var item = db.TOrganization.FirstOrDefault(x => x.LevelNo == 0);
                if (item != null)
                {
                    Response.Redirect(string.Format("Default.aspx?OrganizationId={0}&fy={1}",item.OrganizationId,  fyear.Value));
                }
                
            }

        }
    }

    protected void go_ServerClick(object sender, EventArgs e)
    {

        {
            Response.Redirect("default.aspx?fy=" + fyear.Value);
        }
    }

    protected void fyear_ServerChange(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/font-awesome.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <style>
        .owner{
            color:darkgray;
        }
        .selected{
            color:brown !important;
        }
        .selected-td{
            color:darkmagenta !important;
            background-color:lightcyan;
        }
        .selected-tr{
            color:darkmagenta !important;
            background-color:lightcyan;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" onload="form1_Load">
    <uc1:ResourceMenu runat="server" ID="ResourceMenu" />
    <strong>PIMS / Resource Management</strong> > Man-Power Management
        <h4 class="text-center">Man-Power Management</h4>
    <div class="container1">
    <div class="col col-lg-3" style="border:0px dotted red; width:300px;">
        <div class="table" style="margin:0;padding:0;">
            <div class="input-group">
              <span class="input-group-addon">FY</span>
              <input type="text" class="form-control" aria-label="" id="fyear" runat="server" />
              <span class="input-group-addon"><a href="#" class="" runat="server" id="go" onserverclick ="go_ServerClick">Go!</a></span>
            </div>
        </div><br />
        <div>
            <!-- Tree Start -->
            <%
                var db = new PPPEntities();
                foreach(var itemLv0 in db.TOrganization.Where(x=>x.LevelNo == 0))
                {
                    %><a href="Default.aspx?ownerId=<%=itemLv0.OrganizationId %>&levelNo=<%=itemLv0.LevelNo %>&fy=<%=Request["fy"] %>"><%=itemLv0.Title %></a> <br/>
                <%
                    foreach (var itemLv1 in db.TOrganization.Where(x => x.LevelNo == 1))
                    {
                        %><a href="Default.aspx?ownerId=<%=itemLv1.OrganizationId %>&levelNo=<%=itemLv1.LevelNo %>&fy=<%=Request["fy"] %>"><%=MPMHelper.FmtTitle(itemLv1.Title, 1) %></a>  <br/><%
                        foreach (var itemLv2 in db.TOrganization.Where(x => x.LevelNo == 2 && x.ParentId == itemLv1.OrganizationId).OrderBy(x=>x.LevelPos))
                        {
                            %><a href="Default.aspx?ownerId=<%=itemLv2.OrganizationId %>&levelNo=<%=itemLv2.LevelNo %>&fy=<%=Request["fy"] %>"><%=MPMHelper.FmtTitle(itemLv2.Title, 2) %></a>   <br/><%

                            foreach (var itemLv3 in db.TOrganization.Where(x => x.LevelNo == 3 && x.ParentId == itemLv2.OrganizationId).OrderBy(x=>x.LevelPos))
                            {
                                %><a href="Default.aspx?ownerId=<%=itemLv3.OrganizationId %>&levelNo=<%=itemLv3.LevelNo %>&fy=<%=Request["fy"] %>"><%=MPMHelper.FmtTitle(itemLv3.Title, 3) %></a>  <br/><%
                                
                                foreach (var itemLv4 in db.TOrganization.Where(x => x.LevelNo == 4 && x.ParentId == itemLv3.OrganizationId).OrderBy(x=>x.LevelPos))
                                {
                                    %><a href="Default.aspx?ownerId=<%=itemLv4.OrganizationId %>&levelNo=<%=itemLv4.LevelNo %>&fy=<%=Request["fy"] %>"><%=MPMHelper.FmtTitle(itemLv4.Title, 4) %></a>  <br/><%
                                    foreach (var itemLv5 in db.TOrganization.Where(x => x.LevelNo == 5 && x.ParentId == itemLv4.OrganizationId).OrderBy(x=>x.LevelPos))
                                    {
                                        %><a href="Default.aspx?ownerId=<%=itemLv5.OrganizationId %>&levelNo=<%=itemLv5.LevelNo %>&fy=<%=Request["fy"] %>"><%=MPMHelper.FmtTitle(itemLv5.Title, 5) %></a> <br/><%
                            
                                    }
                                }
                            }
                        }
                    }
                }
                %>

            <!-- Tree  End  -->
        </div>
    </div>
    <div class="col col-lg-9" style="border:0px dotted blue;">
        <table class="table" style="border:1px dotted red;">
            <thead>
                <tr>
                    <th>Month</th>
                    <%foreach (var m in MPMHelper.FYearMonths(fyear.Value))
                      { %>
                        <th><%=m %></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Current Chargeability</td>
                    <%foreach (var m in MPMHelper.FYearMonths(fyear.Value))
                      { %>
                        <td><%=string.Empty %></td>
                    <%} %>
                </tr>
                <tr>
                    <td>Up to date Chargeability</td>
                    <%foreach (var m in MPMHelper.FYearMonths(fyear.Value))
                      { %>
                        <td><%=string.Empty %></td>
                    <%} %>
                </tr>
            </tbody>
        </table>
        <div class="table" >
       <table class="table" style="border:1px dotted red; overflow:auto;width:2000px;">
           <thead>
               <tr>
                   <td>No.</td>
                   <td>Employee ID.</td>
                   <td>People Name</td>
                   <td>OH Budget</td>
                   <td>Up to now Chargeability</td>
                   <td>Current Chargeability</td>
                   <td>Project No.</td>
                   <td>Start Date</td>
                   <td>End Date</td>
                   <td>Forecast Workload</td>
                   <td>Performance</td>
               </tr>
           </thead>
           <tbody>
               <% //var db = new PPPEntities();
                   var lst = new List<EmpInfo>();
                   var no = 1;
                   var ownerId = Convert.ToInt32(Request["ownerId"]);
               %>
               <% foreach (var item in MPMHelper.GetEmpInfos(ownerId, lst, db)){
                       var selectedTrStyle = "";
                       if (!string.IsNullOrEmpty(Request["empId"]) && item.EmpId == Convert.ToInt32(Request["empId"]))
                       {
                           selectedTrStyle = "selected-tr";
                       }
                       %>
               <tr class ="<%=selectedTrStyle %>">
                   <td><%=no++ %></td>
                   <td><%=item.EmpId %></td>
                   <td><a href="javascript:void(0);" data-id="<%=item.EmpId %>" class="emp"><%=item.EmpName %></a></td>
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                   <td><%=item.ProjectNos %></td>
                   <td><%=StringHelper.FmtDate(item.StartDate) %></td>
                   <td><%=StringHelper.FmtDate(item.EndDate) %></td>
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
               </tr>
               <%} %>
           </tbody>
       </table>
        </div>
        <div class="" style="border:0px dotted red;width:550px;display:inline-block;">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <td>Month</td>
                        <td>Chargeability</td>
                        <td>Total Hours</td>
                        <td>Billable</td>
                        <td>OH</td>
                        <td>Leave</td>
                        <td>Holiday</td>
                        <td>Status</td>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        var empId = Convert.ToInt32(Request["empId"]);
                        var rs = MPMHelper.GetEmployeeMonthChargeability(fyear.Value, empId);
                        foreach (var r in rs)
                        {
                    %>
                    <tr>
                        <td><%=r.Month %></td>
                        <td><%=r.Chargeability %></td>
                        <td><%=r.Total_Hours %></td>
                        <td><%=r.Billable %></td>
                        <td><%=r.OH %></td>
                        <td><%=r.Leave %></td>
                        <td><%=r.Holiday %></td>
                        <td><%=r.Status %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        <div class="" style="border:0px dotted red;width:250px;display:inline-block;">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <td>Project No.</td>
                        <td>Hours</td>
                        <td>Proposal</td>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var d in MPMHelper.GetEmployeeProjectNo(fyear.Value, empId)){ %>
                    <tr>
                        <td><%=d.ProjectNo %></td>
                        <td><%=d.Hours %></td>
                        <td><%=d.Proposal %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        </div>
    </div>
        <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
        <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
        <script src="<%=ResolveUrl(string.Format("~/ManPowerManagement/js/manPowerManagement.js?_={0}", DateTime.Now.Ticks.ToString())) %>")></script>
        <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
        <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    </form>

    <script src="../Scripts/jquery-1.9.1.min.js" ></script>
    <script>
        $(function () {
            $("#fyear").keyup(function(event){
                if (event.keyCode == 13) {
                    window.location.href = "default.aspx?fy=" + $(this).val();
                }
            });
        });
    </script>
</body>
</html>
