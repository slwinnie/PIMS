<%@ Page Language="C#" %>

<%@ Register Src="~/UserCenter/UserMenu.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<script runat="server">

    private void form1_OnLoad(object sender, EventArgs e)
    {
        //SystemHelper.SetPageNo(this, "Admin");
        //SystemHelper.SessionCheck(this);
        if (!IsPostBack)
        {
            var db = new PPPEntities();
            var iEmployeeId = Convert.ToInt32(SystemHelper.GetEmployeeId(SystemHelper.DomainUserName()));
            
            var acc = db.TAccount.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
            var ppl = db.TPeople.FirstOrDefault(x => x.EmployeeId == iEmployeeId);
            if (acc != null && ppl != null)
            {
                account.Value = acc.Account;
                employeeId.Value = acc.EmployeeId.ToString();
                employeeName.Value = ppl.PeopleNameEn;
                email.Value = acc.Email;
                var iempId = Convert.ToInt32(employeeId.Value);
                var q = from x in db.TAccountRole.Where(x => x.AccountId == acc.AccountId)
                    join y1 in db.TRole on x.RoleId equals y1.RoleId into tmp
                    from y in tmp.DefaultIfEmpty()
                    select new
                    {
                        x.RoleId,
                        y.Role
                    };
                var sb = new StringBuilder();
                foreach (var r in q)
                {
                    sb.AppendFormat("{0},", r.Role);
                }
                if (sb.Length > 0) sb.Length --;

                role.Value = sb.ToString();
                createDate.Value = StringHelper.FmtDate(acc.CreateDate);
                lastLogin.Value = StringHelper.FmtDate(acc.LastLogin);
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=SystemHelper.SystemName %></title>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/bootstrap.css") %>"/>
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/g.css") %>" />
    <script src="<%=ResolveUrl("~/Scripts/jquery-1.9.1.min.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/bootstrap.js")%>" ></script>
    <script src="<%=ResolveUrl("~/People/js/people.js")%>" ></script>
    <script src="<%=ResolveUrl("~/Scripts/respond.js")%>" ></script>
    <script src="<%=ResolveUrl("~/UserCenter/js/my.js")%>" ></script>
</head>
<body>
    <uc1:UserMenu runat="server" ID="UserMenu" />
    <form id="form1" runat="server" OnLoad="form1_OnLoad">
    <div class="container">
    <h4 class="text-center">My</h4>
    <div class="col-md-4 col-lg-4 "></div>
    <div class="col-md-4 col-lg-4 col-sm-12">
            <div class="form-group">
                <label>Account</label>
                <input type="text" id="account" name="account" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>Employee Id</label>
                <input type="text" id="employeeId" name="employeeId" runat="server" class="form-control" readonly="readonly" />
            </div>
            <div class="form-group">
                <label>Name (Eng)</label>
                <input type="text" id="employeeName" name="oldPassword" runat="server" class="form-control" readonly="readonly" />
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" id="email" name="email" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label>Role</label>
                <input type="text" id="role" name="role" runat="server" class="form-control" readonly="readonly" />
            </div>
            <div class="form-group">
                <label>Create Date</label>
                <input type="text" id="createDate" name="createDate" runat="server" class="form-control" readonly="readonly" />
            </div>
            <div class="form-group">
                <label>Last Login</label>
                <input type="text" id="lastLogin" name="lastLogin" runat="server" class="form-control" readonly="readonly" />
            </div>
            <div class="form-group">
                <a href="javascript:void(0);" class="btn btn-primary table save">Save</a>
            </div>
        </div>
        <div class="col-md-4 col-lg-4 "></div>
    </div>
    </form>
</body>
</html>
