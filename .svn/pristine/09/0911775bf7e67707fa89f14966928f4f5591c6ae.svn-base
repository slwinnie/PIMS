<%@ Page Language="C#" %>

<%@ Register Src="~/Admin/AdminMenu.ascx" TagPrefix="uc1" TagName="AdminMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%SystemHelper.SetPageNo(this, "Role"); %>
<%SystemHelper.SessionCheck(this); %>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="js/role.js"></script>
    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
    <uc1:AdminMenu runat="server" ID="AdminMenu" />
    <form id="form1" runat="server">
    <div class="container">
<strong>PIMS / System Management</strong> > Role
        <h4 class="text-center">Role</h4>
        <a href="javascript:void(0);" class="btn btn-primary clear-border-radius add-role">Add Role</a>
        <table class="table table-bordered table-hover header">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>Role ID</th>
                    <th>Role</th>
                    <th>Description</th>
                    <th>Action(s)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var cnt = db.TRole.Count();
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });

                    var q = db.TRole.OrderBy(x => x.RoleId).Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>",
                            dr.RoleId,
                            dr.Role,
                            dr.Description,
                            string.Format("<div class='btn-group'><a href='javascript:void(0);' class='btn btn-xs btn-warning clear-border-radius editFunction'>Edit Function(s) & Access</a><a href='javascript:void(0);' class='btn btn-xs btn-primary clear-border-radius edit'>Edit</a><a href='javascript:void(0);' class='btn btn-xs btn-danger clear-border-radius delete'>Delete</a></div>")
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 29)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
        
<!-- 对话框开始 New -->
        <div class="modal" id="modalDialog-new">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Add Role</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>ID</label>
                                <input type="text" id="newId" name="newId" runat="server" class="form-control" />
                                <label>Role</label>
                                <input type="text" id="newRole" name="newRole" runat="server" class="form-control" />
                                <label class="">Description</label>
                                <input type="text" class="form-control" id="newDescription" name ="newDescription" runat="server"/>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnAdd" type="button" class="btn btn-primary">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 New -->

<!-- 对话框开始 Edit -->
        <div class="modal" id="modalDialog-edit">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Edit Role</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>ID</label>
                                <input type="text" id="editId" name="editId" runat="server" class="form-control" readonly="readonly" />
                                <label>Role</label>
                                <input type="text" id="editRole" name="editRole" runat="server" class="form-control" />
                                <label class="">Description</label>
                                <input type="text" class="form-control" id="editDescription" name ="editDescription" runat="server"/>
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnEdit" type="button" class="btn btn-primary">Save</button>
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

    </div>
    </form>
</body>
</html>
