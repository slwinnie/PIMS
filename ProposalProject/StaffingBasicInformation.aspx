<%@ Page Language="C#" %>
<%@ Register Src="~/ProposalProject/ProposaProjectlMenu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/ProposalProject/ProposalProjectLeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%@ Register Src="~/ProposalProject/ProjectInformation.ascx" TagPrefix="uc1" TagName="ProjectInformation" %>

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
<form style="border:0px solid red;" class="" id="frmStaffingBasicInformation" runat="server"  OnLoad="frmDefault_OnLoad">
        <%--<div class="col col-lg-3 col-md-3 col-sm-3">
            <uc1:LeftMenu runat="server" id="LeftMenu" />
            <uc1:ProjectInformation runat="server" ID="ProjectInformation" />
        </div>--%>
        <div class="col col-lg-9 col-md-9 col-sm-9">
            <div style="border: 0px solid blue; height: 600px; padding-right: 15px;">
                    <h4 class="text-center">Staffing Basic Information</h4>
                
                    <div class="input-group col-md-4 col-lg-4 pull-right" >
                            <input type="text" class="form-control" placeholder="Type key word" id="searchKey" />
                            <span class="input-group-btn">
                                <button class="btn btn-primary btn-search" id="btnSearch">Search</button>
                            </span>
                     </div>
<a href="javascript:void(0);" class="btn btn-success pull-left clear-border-radius create" tabindex="2" >Create Staffing Basic Information</a>
				<table id="gvProjectList" class="table table-bordered table-condensed" >
				    <thead>
				        <tr class="HeaderLinearBackground">
				            <th>No</th>
                            <th>Position</th>
                            <th>Employee ID</th>
                            <th>People Name</th>
                            <th>Office</th>
                            <th>Discipline</th>
                            <th>Title</th>
                            <th>Company</th>
                            <th>Selling Rate</th>
                            <th>Unit</th>
                            <th style="-moz-min-width: 100px; -ms-min-width: 100px; -o-min-width: 100px; -webkit-min-width: 100px; min-width: 100px;">Action(s)</th>
				        </tr>
				    </thead>
                    <tbody>
                    <%             
                        int pageIndex = 1;
                        int pageSize = 10;
                        pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                        var db = new PPPEntities();

                        var q = (from c in db.TStaffingBasicInfo
                            select new
                            {
                                c.No,
                                c.Position,
                                c.EmployeeId,
                                c.PeopleName,
                                c.Office,
                                c.Discipline,
                                c.Title,
                                c.Company,
                                c.SellingRate,
                                c.Unit
                            }).OrderByDescending(x => x.No).ToList();
                        if (!string.IsNullOrEmpty(Request["searchKey"]))
                        {
                            var sk = Request["searchKey"].ToString().ToLower();
                            var v = q.Where(x => x.Position.ToLower().Contains(sk)
                                || x.EmployeeId.ToString().Contains(sk)
                                || x.PeopleName.ToString().ToLower().Contains(sk)
                                || x.Office.ToString().ToLower().Contains(sk)
                                || x.Discipline.ToString().ToLower().Contains(sk)
                                || x.Title.ToString().ToLower().Contains(sk)
                                || x.Company.ToString().ToLower().Contains(sk)
                                ).ToList();
                            q = v;
                        }
                        var cnt = q.Count();

                        var q2 = q.Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                        var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                        // 初始化分页组件
                        PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });


                        foreach (var r in q2)
                        {%><tr>
                            <td><%=r.No%></td>
                            <td><%=r.Position%></td>
                            <td><%=r.EmployeeId%></td>
                            <td><%=r.PeopleName%></td>
                            <td><%=r.Office%></td>
                            <td><%=r.Discipline%></td>
                            <td><%=r.Title%></td>
                            <td><%=r.Company%></td>
                            <td><%=r.SellingRate%></td>
                            <td><%=r.Unit%></td>
                            <td><%=string.Format("<div class='btn-group'><a href='javascript:void(0);' class='btn btn-xs btn-primary clear-border-radius edit'>Edit</a><a href='javascript:void(0);' class='btn btn-xs btn-danger clear-border-radius delete'>Delete</a></div>") %></td>
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

<!-- 对话框开始 Create -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content clear-border-radius" style="border: 0px solid red; ">
                    <div class="modal-header ">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Create Staffing Basic Information</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>Position</label>
                                <input name="newPosition" type="text" id="newPosition" class="form-control clear-border-radius" />
                                <label>Employee ID</label>
                                <input name="newEmployeeId" type="text" id="newEmployeeId" class="form-control clear-border-radius" />
                                <div  class="search-people-result"></div>
                                <label class="">People Name</label>
                                <input name="newPeople" type="text" id="newPeople" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Office</label>
                                <input name="newOffice" type="text" id="newOffice" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Discipline</label>
                                <input name="newDiscipline" type="text" id="newDiscipline" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Title</label>
                                <input name="newTitle" type="text" id="newTitle" class="form-control clear-border-radius" readonly="readonly" />
                                <label>Company</label>
                                <input name="newCompany" type="text" id="newCompany" class="form-control clear-border-radius"  readonly="readonly"/>
                                <label>Selling Rate</label>
                                <input name="newSellingRate" type="text" id="newSellingRate" class="form-control clear-border-radius" />
                                <label>Unit</label>
                                <input name="newUnit" type="text" id="newUnit" value="CNY/Hr" class="form-control clear-border-radius" />
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
<!-- 对话框开始 Update -->
        <div class="modal " id="modalDialog-Update">
            <div class="modal-dialog">
                <div class="modal-content clear-border-radius" style="border: 0px solid red; ">
                    <div class="modal-header ">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Edit Staffing Basic Information</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>Position</label>
                                <input name="editPosition" type="text" id="editPosition" class="form-control clear-border-radius" />
                                <label>Employee ID</label>
                                <input name="editEmployeeId" type="text" id="editEmployeeId" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">People Name</label>
                                <input name="editPeople" type="text" id="editPeople" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Office</label>
                                <input name="editOffice" type="text" id="editOffice" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Discipline</label>
                                <input name="editDiscipline" type="text" id="editDiscipline" class="form-control clear-border-radius" readonly="readonly" />
                                <label class="">Title</label>
                                <input name="editTitle" type="text" id="editTitle" class="form-control clear-border-radius" readonly="readonly" />
                                <label>Company</label>
                                <input name="editCompany" type="text" id="editCompany" class="form-control clear-border-radius"  readonly="readonly"/>
                                <label>Selling Rate</label>
                                <input name="editSellingRate" type="text" id="editSellingRate" class="form-control clear-border-radius" />
                                <label>Unit</label>
                                <input name="editUnit" type="text" id="editUnit" value="CNY/Hr" class="form-control clear-border-radius" />
                                <input type="hidden" id="editId"/>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default clear-border-radius" data-dismiss="modal">Close</button>
                        <button id="btnUpdate" type="button" class="btn btn-primary clear-border-radius">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 Update -->
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
    <script src="<%=ResolveUrl("~/Scripts/qiyubrother.web.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/staffingBasicInformation.js")%>" ></script>
    <script src="<%=ResolveUrl("~/proposalProject/js/proposalProject.js")%>" ></script>
    <script>
        $(function () {
            $("#LeftMenu_staffingBasicInformation").addClass("active");
        })
    </script>
</html>