<%@ Page Language="C#" %>

<%@ Register Src="~/Admin/AdminMenu.ascx" TagPrefix="uc1" TagName="AdminMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>
<%SystemHelper.SetPageNo(this, "Account"); %>
<%SystemHelper.SessionCheck(this); %>
<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var db = new PPPEntities();
            foreach (var dr in db.TRole.OrderBy(x => x.RoleId))
            {
                newRole.Items.Add(new ListItem(string.Format("{0}-{1}", dr.RoleId.ToString().PadLeft(2, '0'), dr.Role), dr.RoleId.ToString()));
            }

            accountId.Value = Request["accountId"];
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>"/>
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="js/accountRole.js"></script>
    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
    <uc1:AdminMenu runat="server" ID="AdminMenu" />
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
    <div class="container">
<strong>PIMS / System Management</strong> > <a href="Default.aspx">Account</a> > Account Role
        <h4 class="text-center">Account Role</h4>
        <%
            var db = new PPPEntities();
            var accountId = Convert.ToInt32(Request["accountId"]);
            var account = db.TAccount.Find(accountId);
            var ppl = db.TPeople.FirstOrDefault(x => x.EmployeeId == account.EmployeeId);
            var employeeNameEn = "";
            if (ppl != null)
            {
                employeeNameEn = ppl.PeopleNameEn;
            }
        %>
        <a href="javascript:void(0);" class="btn btn-primary pull-left clear-border-radius add-account-role">Add Account Role</a>
        <div class="btn pull-left clear-border-radius" style="background-color: gainsboro;"><strong>Account:<span class="text-danger"><%=string.Format("{0}, {1}", account.Account, employeeNameEn) %></span></strong></div>
        <table class="table table-bordered table-hover header">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>No</th>
                    <th>Role</th>
                    <th>Action(s)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var q = from x in db.TAccountRole.Where(x => x.AccountId == accountId)
                        join y1 in db.TRole on x.RoleId equals y1.RoleId into tmp1
                        from y in tmp1
                        select new
                        {
                            x.AccountId,
                            x.RoleId,
                            y.Role,
                            x.No
                        };
                    var cnt = q.Count();
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });
                    q = q.OrderBy(x => x.No).Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        sb.AppendFormat("<tr><td>{0}</td><td><span data-roleid='{1}'>{2}</span></td><td>{3}</td></tr>",
                            dr.No,
                            dr.RoleId,
                            dr.Role,
                            string.Format("<div class='btn-group'><a href='javascript:void(0);' class='btn btn-xs btn-danger clear-border-radius delete'>Delete</a></div>")
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 29)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
        <input type="hidden" id="accountId" runat="server"/>
        
<!-- 对话框开始 New -->
        <div class="modal" id="modalDialog-new">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Add Account Role</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>NO</label>
                                <input type="text" id="newNo" name="newNo" runat="server" class="form-control" />
                                <label>Role</label>
                                <asp:DropDownList runat="server" id="newRole" name ="newRole" class="form-control"/>
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
