<%@ Page Language="C#" %>
<%@ Register Src="~/ProposalProject/HomePageTopMenu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>

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
        private void frmDefault_OnLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


    </script>
</head>
<body>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
<form style="border:0px solid red;" class="" id="frmDefault" runat="server"  OnLoad="frmDefault_OnLoad">
<div class="container">
			    <div class="text-center" >
			        <h4>Proposal & Project</h4>
                    <div class="input-group col-md-4 col-lg-4 pull-right" >
                            <input type="text" class="form-control" placeholder="Type key word" id="searchKey" runat="server"/>
                            <span class="input-group-btn">
                                <button class="btn btn-primary btn-search" id="btnSearch" runat="server" >Search</button>
                            </span>
                     </div>
				<table id="gvProjectList" class="table table-bordered table-condensed">
				    <thead>
				        <tr class="HeaderLinearBackground">
				            <th>Type</th>
                            <th>Project No</th>
                            <th>Project Descrption</th>
                            <th>Client</th>
                            <th>PM</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
				        </tr>
				    </thead>
                    <tbody>
                    <%             
                        int pageIndex = 1;
                        int pageSize = 10;
                        pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                        var db = new PPPEntities();

                        var q = (from d in db.TProjectRegister
                                          select new
                                          {
                                              ProjectNo = d.ProjectNo,
                                              ProjectName = d.ProjectName,
                                              ProjectDescription = d.ProjectDescription,
                                              Client = d.ClientName,
                                              Type = "Project",
                                              Start = d.StartDate,
                                              End = d.EndDate,
                                              PM = d.PM,
                                              Status = d.ProjectStatus
                                          }).Where(x =>
                              x.ProjectNo.Contains(searchKey.Value)).OrderBy(x => x.ProjectName)
                              ;
                        var cnt = q.Count();

                        var q2 = q.Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                        var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                        // 初始化分页组件
                        PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });


                        foreach (var r in q2)
                        {%><tr>
                            <td><%=r.Type%></td>
                            <td><a href="Init.aspx?ProjectNo=<%=r.ProjectNo%>&Type=<%=r.Type%>"><%=r.ProjectNo%></a></td>
                            <td><%=r.ProjectDescription%></td>
                            <td><%=r.Client%></td>
                            <td><%=r.PM%></td>
                            <td><%=StringHelper.FmtDate(r.Start)%></td>
                            <td><%=StringHelper.FmtDate(r.End)%></td>
                            <td><%=r.Status%></td>
                            </tr>
                        <%}
                        %>
                    </tbody>
                    <%=PageBar.Tfoot(pageCount, cnt, 129)%>
				</table>
                <uc1:PageBar runat="server" ID="PageBar" />
                </div>
            <div class="clearfix"></div>
            <input type="hidden" id="footHtml"/>
			<asp:HiddenField ID="selProjectNo" runat="server" />
</div>
</form>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/proposalProject.js")%>" ></script>
    <script>
        $(function () {

        })
    </script>
</body>
</html>