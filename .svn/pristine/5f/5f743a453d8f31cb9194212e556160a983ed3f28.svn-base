<%@ Page Language="C#" %>
<%@ Register Src="~/ProposalProject/ProposaProjectlMenu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/ProposalProject/ProposalProjectLeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register Src="~/ProposalProject/ProjectInformation.ascx" TagPrefix="uc1" TagName="ProjectInformation" %>
<%@ Register Src="~/ProposalProject/WBSInformation.ascx" TagPrefix="uc1" TagName="WBSInformation" %>

<!DOCTYPE html>

<script runat="server">

    
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <title><%=SystemHelper.SystemName %></title>
    <style>
        .w-100 {
            width: 100px;   
        }
        .w-120{ width: 120px;}
        .w-150{ width: 150px;}
        .w-min-100 {
            -moz-min-width: 100px;
            -ms-min-width: 100px;
            -o-min-width: 100px;
            -webkit-min-width: 100px;
            min-width: 100px;
        }
        .w-min-120 {
            -moz-min-width: 120px;
            -ms-min-width: 120px;
            -o-min-width: 120px;
            -webkit-min-width: 120px;
            min-width: 120px;
        }
        .w-min-150 {
            -moz-min-width: 150px;
            -ms-min-width: 150px;
            -o-min-width: 150px;
            -webkit-min-width: 150px;
            min-width: 150px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<!-- 导航菜单::开始 -->
        <uc1:Menu runat="server" id="Menu" />
<!-- 导航菜单::结束 -->
    <div>
        <div class="col col-lg-3 col-md-3 col-sm-3">
            <uc1:LeftMenu runat="server" id="LeftMenu" />
<%--            <uc1:ProjectInformation runat="server" ID="ProjectInformation" />
            <uc1:WBSInformation runat="server" ID="WBSInformation" />--%>
        </div>
        <div class="col col-lg-9 col-md-9 col-sm-9">
            <div style="border: 0px solid blue; height: 600px; padding-right: 15px;">
                    <h4 class="text-center">Staffing Plan - Detail</h4>
                    <div class="input-group col-md-4 col-lg-4 pull-right" >
                                <input type="text" class="form-control" placeholder="Type key word" id="searchKey" runat="server"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-primary btn-search" id="btnSearch" runat="server" >Search</button>
                                </span>
                   </div>
                <div class="btn-group">
                    <a href="javascript:void(0);" class="btn btn-success pull-left clear-border-radius create" tabindex="2" >Add Employee</a>
                </div>
                <div style="overflow-x: auto">
				<table id="gvList" class="table table-bordered table-condensed" style="width: 2000px;">
				    <thead>
				        <tr class="HeaderLinearBackground">
				            <th style="-moz-min-width: 100px; -ms-min-width: 100px; -o-min-width: 100px; -webkit-min-width: 100px; min-width: 100px;">Action(s)</th>
				            <th>No</th>
                            <th class="w-min-150">Position</th>
                            <th class="w-min-100">Employee ID</th>
                            <th class="w-min-150">Name</th>
                            <th class="w-min-100">Selling Rate</th>
                            <th class="w-min-100">Hour By Person</th>
                            <%
                                var lst = StaffingPlanHelper.GetYearMonthListMix(Request["ProjectNo"]);
                                foreach (var d in lst)
                                {
                                    %>
                                    <th><%=d.SValue %></th>
                            <%
                                }
                                
                            %>
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
                        var wbs = Request["WBS"].ToString();

                        var q = (from x in db.TStaffingPlanDetail.Where(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs)
                            join y1 in db.TStaffingBasicInfo on x.EmployeeId equals y1.EmployeeId into tmp
                            from y in tmp.DefaultIfEmpty()
                            select new
                            {
                                x.No,
                                x.Position,
                                x.EmployeeId,
                                y.PeopleName,
                                y.SellingRate,
                                x.HourByPerson
                            }).OrderByDescending(x => x.No).ToList();
                        if (!string.IsNullOrEmpty(Request["searchKey"]))
                        {
                            var sk = Request["searchKey"].ToString().ToLower();
                            q = q.Where(x => x.EmployeeId.ToString().Contains(sk)
                                        || x.PeopleName.ToLower().Contains(sk)
                                        || x.Position.ToLower().Contains(sk)
                                ).ToList();
                        }
                        //q = q.OrderByDescending(x => x.No);
                        var cnt = q.Count();

                        var q2 = q.Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                        var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                        // 初始化分页组件
                        PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });

                        foreach (var r in q2)
                        {%><tr>
                            <td><%=string.Format("<div class='btn-group'><a href='javascript:void(0);' class='btn btn-xs btn-primary clear-border-radius edit'>Edit</a><a href='javascript:void(0);' class='btn btn-xs btn-danger clear-border-radius delete'>Delete</a></div>") %></td>
                            <td><%=r.No %></td>
                            <td><%=r.Position%></td>
                            <td><%=r.EmployeeId%></td>
                            <td><%=r.PeopleName%></td>
                            <td><%=r.SellingRate%></td>
                            <td><%=r.HourByPerson%></td>
                            <%
                                var v = db.TStaffingPlanDetailYearMonth.Where(x => x.ProjectNo == projectNo && x.Type == type && x.WBS == wbs && x.EmployeeId == r.EmployeeId)
                                    .OrderBy(x=>x.YearMonth);
                                foreach (var s in v)
                                {
                                    %><td><%=s.YearMonthValue %></td><%
                                }
                            %>
                            </tr>
                        <% }
                        %>
                    </tbody>
<%--                    <%=PageBar.Tfoot(pageCount, cnt, 129)%>--%>
				</table>
                </div>
                <uc1:PageBar runat="server" ID="PageBar" />

            <input type="hidden" id="footHtml"/>
            </div>
        </div>
    </div>
        
<!-- 对话框开始 Create -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content clear-border-radius" style="border: 0px solid red; ">
                    <div class="modal-header ">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Add Employee</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <label>Position</label>
                            <input name="newPosition" type="text" id="newPosition" class="form-control clear-border-radius" readonly="readonly" />
                            <label>Employee</label>
                            <select id="newEmployee" name="newEmployee" class="form-control">
                                <option value="0"></option>
                                <%

                                    var emps = db.TStaffingBasicInfo.Where(x => x.ProjectNo == projectNo
                                        && x.Type == type);
                                    foreach (var emp in emps)
                                    {
                                        %><option value="<%=emp.EmployeeId %>"><%=emp.PeopleName %></option>
                                <%
                                    }
                                     %>
                            </select>
                            <div class="new-year-month-field">
                            <%
                                foreach (var s in lst)
                                {
                                    %>
                                    <label class=""><%=s.SValue%></label>
                                    <input name="new<%=s.NValue%>" type="text" id="new<%=s.NValue%>" class="form-control clear-border-radius" />
                                <%
                                }
                            %>
                            </div>
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
                    	<h4 class="modal-title">Edit Employee</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <label>Position</label>
                            <input name="editPosition" type="text" id="editPosition" class="form-control clear-border-radius" readonly="readonly" />
                            <label>Employee</label>
                            <select id="editEmployee" name="editEmployee" class="form-control">
                                <option value="0"></option>
                                <%
                                    //var emps = db.TStaffingBasicInfo.Where(x => x.ProjectNo == projectNo
                                    //    && x.Type == type);
                                    foreach (var emp in emps)
                                    {
                                        %><option value="<%=emp.EmployeeId %>"><%=emp.PeopleName %></option>
                                <%
                                    }
                                     %>
                            </select>
                            <div class="edit-year-month-field">
                            <%
                                //var lstNum = StaffingPlanHelper.GetYearMonthListNum(Request["ProjectNo"]);
                                foreach (var s in lst)
                                {
                                    %>
                                    <label class=""><%=s.SValue%></label>
                                    <input name="edit<%=s.NValue%>" type="text" id="edit<%=s.NValue%>" class="form-control clear-border-radius" />
                                <%
                                }
                            %>
                            </div>
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
</body>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/proposalProject.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/staffingplandetail.js")%>" ></script>
    <script>
        $(function () {
            $("#LeftMenu_staffingPlan").addClass("active");
        })
    </script>
</html>
