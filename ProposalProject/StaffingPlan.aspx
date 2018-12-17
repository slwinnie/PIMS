<%@ Page Language="C#" %>
<%@ Register Src="~/ProposalProject/ProposaProjectlMenu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/ProposalProject/ProposalProjectLeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register Src="~/ProposalProject/ProjectInformation.ascx" TagPrefix="uc1" TagName="ProjectInformation" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>

    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
    <div class="">
    <form id="form1" runat="server">
        <div class="col col-lg-3 col-md-3 col-sm-3">
            <uc1:LeftMenu runat="server" id="LeftMenu" />
<%--            <uc1:ProjectInformation runat="server" ID="ProjectInformation" />--%>
        </div>
        <div class="col col-lg-9 col-md-9 col-sm-9">
            <div style="border: 0px solid blue; height: 600px; padding-right: 15px;">
                    <h4 class="text-center">Staffing Plan</h4>
                    <div class="input-group col-md-4 col-lg-4 pull-right" >
                                <input type="text" class="form-control" placeholder="Type key word" id="searchKey" runat="server"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-primary btn-search" id="btnSearch" runat="server" >Search</button>
                                </span>
                   </div>
                <a href="javascript:void(0);" class="btn btn-success pull-left clear-border-radius create" tabindex="2" >Create Staffing Plan</a>
				<table id="gvList" class="table table-bordered table-condensed">
				    <thead>
				        <tr class="HeaderLinearBackground">
				            <th>WBS</th>
                            <th>CTR</th>
                            <th>Budget Hours</th>
                            <th>Planned Hours</th>
                            <th>Actual Hours</th>
                            <th>Owner</th>
                            <th>Action(s)</th>
				        </tr>
				    </thead>
                    <tbody>
                    <%             
                        int pageIndex = 1;
                        int pageSize = 10;
                        pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                        var db = new PPPEntities();
                        var projectNo = Request["ProjectNo"].ToString();
                        var type = Request["Type"].ToString();
                        var q = from x in db.TStaffingPlan.Where(x=>x.ProjectNo == projectNo && x.Type == type)
                            join y1 in db.TPeople on x.OwnerId equals y1.EmployeeId into tmp
                            from y in tmp.DefaultIfEmpty()
                            select new
                            {
                                x.WBS,
                                x.CTR,
                                x.BudgetHours,
                                x.PlannedHours,
                                x.ActualHours,
                                x.OwnerId,
                                y.PeopleNameEn
                            };
                        if (!string.IsNullOrEmpty(Request["searchKey"]))
                        {
                            var sk = Request["searchKey"].ToString().ToLower();
                            q = q.Where(x => x.WBS.ToLower().Contains(sk)
                                || x.CTR.ToLower().Contains(sk));
                        }
                        q = q.OrderByDescending(x => x.WBS);
                        var cnt = q.Count();

                        var q2 = q.Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                        var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                        // 初始化分页组件
                        PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });


                        foreach (var r in q2)
                        {%><tr>
                            <td><a href="StaffingPlanDetail.aspx?ProjectNo=<%=Request["ProjectNo"] %>&Type=<%=Request["Type"] %>&WBS=<%=Server.UrlEncode(r.WBS)%>" ><%=r.WBS%></a></td>
                            <td><%=r.CTR%></td>
                            <td><%=r.BudgetHours%></td>
                            <td><%=r.PlannedHours%></td>
                            <td><%=r.ActualHours%></td>
                            <td><span class="hidden"><%=r.OwnerId%></span> <%=r.PeopleNameEn%></td>
                            <td><%=string.Format("<div class='btn-group'><a href='javascript:void(0);' class='btn btn-xs btn-primary clear-border-radius edit'>Edit</a><a href='javascript:void(0);' class='btn btn-xs btn-danger clear-border-radius delete'>Delete</a></div>") %></td>
                            </tr>
                        <%}
                        %>
                    </tbody>
                    <%=PageBar.Tfoot(pageCount, cnt, 129)%>
				</table>
                <uc1:PageBar runat="server" ID="PageBar" />
            <input type="hidden" id="footHtml"/>
			<asp:HiddenField ID="selProjectNo" runat="server" />
            </div>
        </div>
        
<!-- 对话框开始 Create -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content clear-border-radius" style="border: 0px solid red; ">
                    <div class="modal-header ">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Create Staffing Plan</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <label>WBS</label>
                            <input name="newWBS" type="text" id="newWBS" class="form-control clear-border-radius" />
                            <label>CTR</label>
                            <input name="newCTR" type="text" id="newCTR" class="form-control clear-border-radius" />
                            <label class="">Budget Hour(s)</label>
                            <input name="newBudgetHours" type="text" id="newBudgetHours" class="form-control clear-border-radius" />
                            <label class="">Planned Hour(s)</label>
                            <input name="newPlannedHours" type="text" id="newPlannedHours" class="form-control clear-border-radius" />
                            <label class="">Actual Hour(s)</label>
                            <input name="newActualHours" type="text" id="newActualHours" class="form-control clear-border-radius" />
                            <label class="">Owner</label>
                            <input name="newOwner" type="text" id="newOwner" class="form-control clear-border-radius" />
                            <div  class="search-people-result"></div>
                            <input name="newOwnerId" type="hidden" id="newOwnerId" />
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default clear-border-radius" data-dismiss="modal">Close</button>
                        <button id="btnCreate" type="button" class="btn btn-primary clear-border-radius">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Create -->
<!-- 对话框开始 Edit -->
        <div class="modal " id="modalDialog-Edit">
            <div class="modal-dialog">
                <div class="modal-content clear-border-radius" style="border: 0px solid red; ">
                    <div class="modal-header ">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Edit Staffing Plan</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <label>WBS</label>
                            <input name="editWBS" type="text" id="editWBS" class="form-control clear-border-radius" readonly="readonly" />
                            <label>CTR</label>
                            <input name="editCTR" type="text" id="editCTR" class="form-control clear-border-radius" />
                            <label class="">Budget Hour(s)</label>
                            <input name="editBudgetHours" type="text" id="editBudgetHours" class="form-control clear-border-radius" />
                            <label class="">Planned Hour(s)</label>
                            <input name="editPlannedHours" type="text" id="editPlannedHours" class="form-control clear-border-radius" />
                            <label class="">Actual Hour(s)</label>
                            <input name="editActualHours" type="text" id="editActualHours" class="form-control clear-border-radius" />
                            <label class="">Owner</label>
                            <input name="editOwner" type="text" id="editOwner" class="form-control clear-border-radius" />
                            <div  class="search-people-result"></div>
                            <input name="editOwnerId" type="hidden" id="editOwnerId" />
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default clear-border-radius" data-dismiss="modal">Close</button>
                        <button id="btnEdit" type="button" class="btn btn-primary clear-border-radius">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Edit -->
<!-- 对话框开始 Delete -->
        <div class="modal " id="modalDialog-delete">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Delete confirm</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label >Confirm delete current item?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnDelete" type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Delete -->

    </form>
    </div>
</body>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/staffingplan.js")%>" ></script>
<%--    <script src="<%=ResolveUrl("~/proposalProject/js/proposalProject.js")%>" ></script>--%>
    <script>
        $(function() {
            $("#LeftMenu_staffingPlan").addClass("active");
        })
    </script>
</html>
