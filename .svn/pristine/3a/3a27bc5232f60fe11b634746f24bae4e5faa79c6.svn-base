<%@ Page Language="C#" %>
<%@ Register Src="~/Admin/AdminMenu.ascx" TagPrefix="uc1" TagName="AdminMenu" %>
<%@ Register Src="~/PageBar.ascx" TagPrefix="uc1" TagName="PageBar" %>

<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        SystemHelper.SetPageNo(this, "Account");
        SystemHelper.SessionCheck(this);

        if (!IsPostBack)
        {
            newStatus.Items.Add("Active");
            newStatus.Items.Add("Disable");
            editStatus.Items.Add("Active");
            editStatus.Items.Add("Disable");
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
    <script src="js/account.js"></script>
    <title><%=SystemHelper.SystemName %></title>
</head>
<body>
<div class="">
    <uc1:AdminMenu runat="server" ID="AdminMenu1" />
</div>
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
    <div class="container">
    <strong>PIMS / System Management</strong> > Account
        <h4 class="text-center">Account</h4>
        <div class="col col-lg-3" style="margin: 0; padding: 0; border: 0px solid red;">
            <div class="btn-group">
                <a href="javascript:void(0);" class="btn btn-primary clear-border-radius create-account">Create Account</a><a href="javascript:void(0);" class="btn btn-success clear-border-radius sync-data">Sync From People</a>
            </div>
        </div>
        <div class="col col-lg-6"></div>
        <div class="col col-lg-3 pull-right" style="margin: 0; padding: 0; border: 0px solid red;">
            <div class="input-group ">
                <input name="searchKey" type="text" id="searchKey" class="form-control" runat="server" placeholder=""/>
                <span class="input-group-btn"> <button id="search" class="btn btn-default">Search</button></span>
            </div>
        </div>
                <table class="table table-bordered table-hover header">
            <thead>
                <tr class="HeaderLinearBackground">
                    <th>ID</th>
                    <th>Account</th>
                    <th>Company</th>
                    <th>Employee<br/>Id</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Create<br/>Date</th>
                    <th>LastLogin</th>
                    <th>Status</th>
                    <th>Action(s)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    var db = new PPPEntities();
                    int pageIndex = 1;
                    int pageSize = 20;
                    pageIndex = string.IsNullOrEmpty(Request["pageIndex"]) ? 1 : Convert.ToInt32(Request["pageIndex"]); // 设置当前页
                    var sk = searchKey.Value.ToLower();
                    var cnt = db.TAccount.Count(x => 
                        x.Account.ToLower().Contains(sk)
                        || x.EmployeeId.ToString().ToLower().Contains(sk)
                        || x.UserName.ToLower().Contains(sk)
                        || x.Company.ToLower().Contains(sk)
                        || x.Status.ToLower().Contains(sk)
                        );
                    //var cnt = db.TAccount.Count();
                    var pageCount = cnt % pageSize == 0 ? cnt / pageSize : cnt / pageSize + 1;
                    // 初始化分页组件
                    PageBar.InitStyle(new ASP.PageBar.PageStyle { PageIndex = pageIndex, PageSize = pageSize, PageCount = pageCount, IsShowHomeText = true, IsShowLastText = true });

                    var q = db.TAccount.Where(x=>
                        x.Account.ToLower().Contains(sk)
                        || x.EmployeeId.ToString().ToLower().Contains(sk)
                        || x.UserName.ToLower().Contains(sk)
                        || x.Company.ToLower().Contains(sk)
                        || x.Status.ToLower().Contains(sk)
                        ).OrderByDescending(x => x.LastLogin).Skip(pageSize * (pageIndex - 1)).Take(pageSize);
                    var sb = new StringBuilder();
                    foreach (var dr in q)
                    {
                        var emp = db.TPeople.Find(dr.EmployeeId);
                        var enName = emp == null ? "" : emp.PeopleNameEn;
                        sb.AppendFormat("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td><a href='{3}People/Default.aspx?searchKey={4}' data-empid='{4}'>{5}</a></td><td>{6}</td><td>{7}</td><td>{8}</td><td>{9}</td><td >{10}</td><td >{11}</td></tr>",
                            dr.AccountId,
                            dr.Account,
                            dr.Company,
                            ResolveUrl("~"),
                            dr.EmployeeId,
                            string.Format("{0}", dr.EmployeeId),
                            dr.UserName,
                            dr.Email,
                            StringHelper.FmtDate(dr.CreateDate),
                            StringHelper.FmtDate(dr.LastLogin),
                            dr.Status,
                            string.Format("<nobr><a href='javascript:void(0);' class='btn btn-xs btn-warning clear-border-radius editRole'>Edit Role</a><a href='javascript:void(0);' class='btn btn-xs btn-default clear-border-radius edit'>Edit</a><a href='javascript:void(0);' class='btn btn-xs btn-default clear-border-radius delete'>Delete</a></nobr>")
                            );
                    }
                %>
                <%=sb %>
            </tbody>
            <%=PageBar.Tfoot(pageCount, cnt, 29)%>
        </table>
        <uc1:PageBar runat="server" ID="PageBar" />
    </div>
        
<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Create">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Create Account</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>Employee ID</label>
                                <input type="text" id="newEmployeeId" name="newEmployeeId" runat="server" class="form-control"/>
                                <label class="">Account</label>
                                <input type="text" class="form-control" id="newAccount" name ="newAccount" runat="server"/>
                                <label class="">User Name</label>
                                <input type="text" class="form-control" id="newUserName" name ="newUserName" runat="server"/>
                                <label>Company</label>
                                <input type="text" id="newCompany" name="newCompany" runat="server" value="WPC" class="form-control" />
                                <label>Email</label>
                                <input type="text" id="newEmail" name="newEmail" runat="server" class="form-control" />
<%--                                <label>Role</label>
                                <asp:DropDownList runat="server" id="newRole" name="newRole" class="form-control" />--%>
                                <label>Status</label>
                                <asp:DropDownList runat="server" id="newStatus" name="newStatus" class="form-control" />
                            </div>
                        </div>
                        <!-- 对话框内容结束 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnCreate" type="button" class="btn btn-primary">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
<!-- 对话框结束 -->

<!-- 对话框开始 -->
        <div class="modal" id="modalDialog-edit">
            <div class="modal-dialog">
                <div class="modal-content" style="border: 0px solid red; ">
                    <div class="modal-header">
                        <button type="button" class="close " data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    	<h4 class="modal-title">Edit Account</h4>
                    </div>
                    <div class="modal-body">
                        <!-- 对话框内容开始 -->
                        <div class="">
                            <div class="">
                                <label>Account ID</label>
                                <input type="text" id="editAccountId" name="editAccountId" runat="server" class="form-control" readonly="readonly"/>
                                <label>Employee ID</label>
                                <input type="text" id="editEmployeeId" name="editEmployeeId" runat="server" class="form-control" readonly="readonly"/>
                                <label class="">Account</label>
                                <input type="text" class="form-control" id="editAccount" name ="editAccount" runat="server"/>
                                <label class="">User Name</label>
                                <input type="text" class="form-control" id="editUserName" name ="editUserName" runat="server"/>
                                <label>Company</label>
                                <input type="text" id="editCompany" name="editCompany" runat="server" value="WPC" class="form-control" />
                                <label>Email</label>
                                <input type="text" id="editEmail" name="editEmail" runat="server" class="form-control" />
<%--                                <label>Role</label>
                                <asp:DropDownList runat="server" id="editRole" name="editRole" class="form-control" />--%>
                                <label>Status</label>
                                <asp:DropDownList runat="server" id="editStatus" name="editStatus" class="form-control" />
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
<!-- 对话框结束 -->

<!-- 对话框开始 -->
        <div class="modal " id="modalDialog-Delete">
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
<!-- 对话框结束 -->
        

    </form>
</body>
</html>
