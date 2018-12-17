<%@ Page Language="C#" %>
<%
    var account = Request["newAccount"];
    var company = Request["newCompany"];
    var employeeId = Convert.ToInt32(Request["newEmployeeId"]);
    var email = Request["newEmail"];
    var status = Request["newStatus"];

    var db = new PPPEntities();
    if (db.TAccount.Any(x => x.EmployeeId == employeeId))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-1");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid EmployeeId.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    if (db.TAccount.Any(x => x.Account == account))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Account.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    if (string.IsNullOrEmpty(email))
    {
        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "-2");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "Invalid Email.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());
        return;
    }
    else
    {
        var acc = new TAccount();
        var id = db.TAccount.Max(x => x.AccountId);
        acc.AccountId = id + 1;
        acc.EmployeeId = employeeId;
        acc.Account = account;
        acc.Company = company;
        acc.Email = email;
        //acc.Role = role;
        acc.Status = status;
        acc.Psd = StringHelper.GetMd5(SystemHelper.DefaultPassword);
        acc.CreateDate = DateTime.Now;
        db.TAccount.Add(acc);
        db.SaveChanges();

        var sb = new StringBuilder();
        sb.AppendFormat("{{");
        sb.AppendFormat("\"{0}\":\"{1}\", ", "ErrorCode", "0");
        sb.AppendFormat("\"{0}\":\"{1}\"  ", "ErrorMessage", "OK.");
        sb.AppendFormat("}}");
        Response.Write(sb.ToString());    
    }
    

%>
